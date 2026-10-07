"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";
import { fetchPage } from "@/lib/fetchPage";
import { extractCompanyIntelligence, findingTypes, type EvidencePage } from "@/lib/aiEnrich";

async function ctx() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", user!.id).maybeSingle();
  return { supabase, userId: user?.id, orgId: (profile as any)?.organization_id, role: (profile as any)?.role };
}
const canEdit = (role: string) => ["administrator", "analyst"].includes(role);

export type EnrichState = { status: "idle" | "success" | "error"; message: string; created?: number };

export async function enrichCompany(_previous: EnrichState, formData: FormData): Promise<EnrichState> {
  try {
    const companyId = String(formData.get("companyId") ?? "");
    if (!/^[0-9a-f-]{36}$/i.test(companyId)) throw new Error("Choose a valid competitor.");
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) throw new Error("Please sign in again.");
    const { data: profile, error: profileError } = await supabase.from("users").select("organization_id, role").eq("id", user.id).single();
    if (profileError || !profile || !canEdit(profile.role)) throw new Error("Enrichment requires Administrator or Analyst access.");
    if (!process.env.GROQ_API_KEY) throw new Error("Add GROQ_API_KEY to Vercel, then redeploy.");
    const orgId = profile.organization_id;
    const { data: company, error: companyError } = await supabase.from("companies").select("id, name, description").eq("id", companyId).eq("organization_id", orgId).single();
    if (companyError || !company) throw new Error("This competitor is not available in your organization.");
    const { data: recent, error: recentError } = await supabase.from("observations").select("id").eq("company_id", companyId).eq("organization_id", orgId)
      .like("extracted_by", "ai:groq-enrichment:%").gte("observed_at", new Date(Date.now() - 60000).toISOString()).limit(1);
    if (recentError) throw new Error("Could not check recent enrichment. Please try again.");
    if (recent?.length) return { status: "success", message: "This competitor was just enriched. Check the Review Queue before running again." };
    const { data: sources, error: sourceError } = await supabase.from("company_sources").select("id, url").eq("company_id", companyId).eq("organization_id", orgId)
      .eq("active", true).order("priority", { ascending: true }).limit(3);
    if (sourceError) throw new Error("Could not load competitor sources.");
    if (!sources?.length) throw new Error("Add an active source in the Sources section below, then try again.");
    const fetched = await Promise.allSettled(sources.map(async source => ({ source, page: await fetchPage(source.url) })));
    const pages: EvidencePage[] = [];
    const failures: string[] = [];
    for (let index = 0; index < fetched.length; index++) {
      const result = fetched[index];
      if (result.status === "rejected") {
        failures.push(`${new URL(sources[index].url).hostname}: ${result.reason instanceof Error ? result.reason.message : "Fetch failed."}`);
        continue;
      }
      const { source, page } = result.value;
      const { data: doc, error: docError } = await supabase.from("source_documents").insert({
        organization_id: orgId, company_source_id: source.id, fetched_at: page.fetchedAt,
        title: page.title, cleaned_text: page.text, content_hash: page.hash, fetch_status: "success",
        metadata_json: { purpose: "on_demand_enrichment", source_url: page.url },
      }).select("id").single();
      if (docError || !doc) throw new Error("Could not save source evidence. No findings were submitted.");
      pages.push({ sourceId: source.id, documentId: doc.id, url: page.url, text: page.text, fetchedAt: page.fetchedAt });
    }
    if (!pages.length) throw new Error(`No readable source pages. ${failures.join(" ").slice(0, 450)} Fix the source URLs below or try again later.`);
    const findings = await extractCompanyIntelligence(company.name, pages);
    if (!findings.length) return { status: "success", message: `Read ${pages.length} source(s), but no findings passed the source-evidence checks.${failures.length ? ` ${failures.length} source(s) could not be read.` : ""}` };
    const { data: existing, error: existingError } = await supabase.from("observations").select("field_name, observed_value_json").eq("company_id", companyId).eq("organization_id", orgId)
      .like("extracted_by", "ai:groq-enrichment:%").in("review_status", ["pending", "approved", "deferred", "auto_approved"]);
    if (existingError) throw new Error("Could not check for duplicate findings.");
    const normalized = (text: string) => text.replace(/\s+/g, " ").trim().toLowerCase();
    const seen = new Set((existing ?? []).map(row => `${row.field_name}:${normalized(String(row.observed_value_json?.text ?? ""))}`));
    const fresh = findings.filter(f => !seen.has(`${f.field}:${normalized(f.text)}`) && !(f.field === "description" && normalized(f.text) === normalized(company.description ?? "")));
    if (!fresh.length) return { status: "success", message: "These findings are already recorded or awaiting review. No duplicates were added." };
    const now = new Date().toISOString();
    const rows = fresh.map(f => ({
      organization_id: orgId, company_id: companyId, source_document_id: pages[f.source].documentId,
      observation_type: findingTypes(f.field)[0], field_name: f.field,
      observed_value_json: { kind: "company_enrichment", field: f.field, text: f.text },
      supporting_text: f.supporting_text, source_url: pages[f.source].url,
      confidence_score: f.confidence, observed_at: now,
      extracted_by: `ai:groq-enrichment:${process.env.GROQ_MODEL || "openai/gpt-oss-120b"}`, review_status: "pending",
    }));
    const { data: observations, error: obsError } = await supabase.from("observations").insert(rows).select("id, field_name, observed_value_json, confidence_score");
    if (obsError || !observations?.length) throw new Error("Could not save the proposed findings. Please try again.");
    const changes = observations.map(obs => ({
      organization_id: orgId, company_id: companyId, observation_id: obs.id,
      change_type: findingTypes(obs.field_name)[1],
      previous_value_json: obs.field_name === "description" && company.description ? { text: company.description } : null,
      new_value_json: obs.observed_value_json, significance_score: 50, confidence_score: obs.confidence_score,
      detected_at: now, status: "pending", summary: `Source enrichment: ${obs.observed_value_json.text}`,
    }));
    const { error: changeError } = await supabase.from("competitive_changes").insert(changes);
    if (changeError) {
      await supabase.from("observations").delete().eq("organization_id", orgId).in("id", observations.map(obs => obs.id));
      throw new Error("Could not add the findings to the Review Queue. Please try again.");
    }
    revalidatePath(`/competitors/${companyId}`);
    revalidatePath("/review");
    revalidatePath("/activity");
    revalidatePath("/dashboard");
    return { status: "success", created: changes.length, message: `Added ${changes.length} proposed finding(s) from ${pages.length} source(s).${failures.length ? ` ${failures.length} source(s) could not be read.` : ""} Approve findings in the Review Queue.` };
  } catch (error) {
    const message = error instanceof Error ? error.message : "Enrichment failed. Please try again.";
    return { status: "error", message: /abort|timeout/i.test(message) ? "The source or AI request timed out. Please try again." : message };
  }
}

export async function addSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const companyId = String(formData.get("companyId") ?? "");
  const url = String(formData.get("url") ?? "").trim();
  const sourceTypeId = String(formData.get("source_type_id") ?? "") || null;
  const name = String(formData.get("name") ?? "").trim() || null;
  if (!companyId || !url) return;
  await supabase.from("company_sources").insert({
    organization_id: orgId, company_id: companyId, url, source_type_id: sourceTypeId,
    name, priority: 3, active: true, status: "never_run",
  });
  revalidatePath(`/competitors/${companyId}`);
}

export async function updateSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const id = String(formData.get("id") ?? "");
  const companyId = String(formData.get("companyId") ?? "");
  const url = String(formData.get("url") ?? "").trim();
  const priority = Number(formData.get("priority") ?? 3);
  const active = formData.get("active") === "on";
  if (!id || !url) return;
  // Changing the URL invalidates the old crawl state, so reset it to crawl clean.
  const { data: cur } = await supabase.from("company_sources").select("url").eq("id", id).maybeSingle();
  const urlChanged = cur && (cur as any).url !== url;
  await supabase.from("company_sources").update({
    url, priority, active,
    ...(urlChanged ? { content_hash: null, status: "never_run", last_error: null, last_checked_at: null, last_changed_at: null } : {}),
  }).eq("id", id);
  revalidatePath(`/competitors/${companyId}`);
}

export async function deleteSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const id = String(formData.get("id") ?? "");
  const companyId = String(formData.get("companyId") ?? "");
  if (!id) return;
  await supabase.from("company_sources").delete().eq("id", id);
  revalidatePath(`/competitors/${companyId}`);
}

/** Reset crawl state so the next run re-fetches this source from scratch. */
export async function recrawlSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const id = String(formData.get("id") ?? "");
  const companyId = String(formData.get("companyId") ?? "");
  if (!id) return;
  await supabase.from("company_sources").update({ content_hash: null, status: "never_run", last_error: null }).eq("id", id);
  revalidatePath(`/competitors/${companyId}`);
}
