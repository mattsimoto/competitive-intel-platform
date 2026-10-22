"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";

async function ctx() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", user!.id).maybeSingle();
  return { supabase, userId: user?.id, orgId: (profile as any)?.organization_id, role: (profile as any)?.role };
}
const canEdit = (role: string) => ["administrator", "analyst"].includes(role);

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

import { fetchPage } from "@/lib/fetchPage";
import { enrichFromText } from "@/lib/aiEnrich";

/** On-demand AI enrichment for one company: reads its crawled pages, extracts
 *  company fields + topics, and applies them (with evidence + an Activity entry).
 *  No-op without ANTHROPIC_API_KEY. */
export async function enrichCompanyNow(formData: FormData) {
  const { supabase, userId, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  if (!process.env.GROQ_API_KEY) return;
  const companyId = String(formData.get("companyId") ?? "");
  if (!companyId) return;

  const { data: company } = await supabase.from("companies").select("id, name, website_url").eq("id", companyId).single();
  if (!company) return;

  const { data: srcs } = await supabase
    .from("company_sources")
    .select("id, url, source_types(name)")
    .eq("company_id", companyId)
    .eq("active", true);
  const srcIds = (srcs ?? []).map((s: any) => s.id);
  let text = "";
  if (srcIds.length) {
    const { data: docs } = await supabase
      .from("source_documents")
      .select("company_source_id, cleaned_text, fetched_at")
      .in("company_source_id", srcIds)
      .order("fetched_at", { ascending: false });
    const seen = new Set<string>();
    for (const d of docs ?? []) {
      if (seen.has((d as any).company_source_id)) continue;
      seen.add((d as any).company_source_id);
      if ((d as any).cleaned_text) text += "\n\n" + (d as any).cleaned_text;
      if (text.length > 16000) break;
    }
  }
  if (text.trim().length < 200) {
    const website = (company as any).website_url || (srcs ?? []).find((s: any) => s.source_types?.name === "Website")?.url || (srcs ?? [])[0]?.url;
    if (website) {
      const snap = await fetchPage(website);
      if (snap.ok) text = snap.text;
    }
  }
  if (text.trim().length < 100) return;

  const e = await enrichFromText((company as any).name, text);
  if (!e) return;

  const now = new Date().toISOString();

  let companyTypeId: string | null = null;
  if (e.company_type) {
    const { data: ct } = await supabase.from("company_types").select("id").ilike("name", e.company_type).maybeSingle();
    companyTypeId = (ct as any)?.id ?? null;
  }

  const patch: Record<string, any> = { last_verified_at: now, last_material_change_at: now, intelligence_status: "low_confidence" };
  if (e.description) patch.description = e.description;
  if (e.headquarters) patch.headquarters = e.headquarters;
  if (companyTypeId) patch.company_type_id = companyTypeId;
  await supabase.from("companies").update(patch).eq("id", companyId);

  const { data: obs } = await supabase.from("observations").insert({
    organization_id: orgId, company_id: companyId, observation_type: "positioning",
    field_name: "enrichment", observed_value_json: e as any, supporting_text: e.description ?? null,
    confidence_score: 65, observed_at: now, extracted_by: "ai:enrich", review_status: "approved",
  }).select("id").maybeSingle();

  await supabase.from("competitive_changes").insert({
    organization_id: orgId, company_id: companyId, observation_id: (obs as any)?.id ?? null,
    change_type: "positioning_change", previous_value_json: null, new_value_json: e as any,
    significance_score: 40, confidence_score: 65, detected_at: now, approved_at: now, approved_by: userId ?? null,
    status: "auto_approved", summary: `AI enrichment: ${e.industry ?? e.description ?? "profile updated"}`.slice(0, 240),
  });

  if (e.topics?.length) {
    const { data: allTopics } = await supabase.from("topics").select("id, name").eq("active", true);
    const byName = new Map((allTopics ?? []).map((t: any) => [t.name.toLowerCase(), t.id]));
    for (const t of e.topics) {
      const topicId = byName.get(String(t).toLowerCase());
      if (topicId) {
        await supabase.from("company_topics").upsert(
          { organization_id: orgId, company_id: companyId, topic_id: topicId, first_observed_at: now, last_activity_at: now, last_verified_at: now },
          { onConflict: "company_id,topic_id" }
        );
      }
    }
  }

  revalidatePath(`/competitors/${companyId}`);
  revalidatePath("/dashboard");
  revalidatePath("/topics");
  revalidatePath("/activity");
}
