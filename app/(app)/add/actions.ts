"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";
import { parseCompetitorSheet, normalizeName } from "@/lib/importData";

async function ctx() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", user!.id).maybeSingle();
  return { supabase, userId: user?.id, orgId: (profile as any)?.organization_id as string | undefined, role: (profile as any)?.role as string | undefined };
}
const canEdit = (role?: string) => role === "administrator" || role === "analyst";

/** Insert a company if its normalized name is new; return its id either way.
 *  Also ensures a relationship to the given internal product (deduped). */
async function upsertCompetitor(
  supabase: any, orgId: string,
  input: { name: string; website?: string | null; location?: string | null; companyTypeId?: string | null },
  internalProductId?: string | null,
): Promise<{ id: string; created: boolean } | null> {
  const nm = normalizeName(input.name);
  if (!nm) return null;
  const { data: existing } = await supabase
    .from("companies").select("id").eq("organization_id", orgId).eq("normalized_name", nm).maybeSingle();

  let companyId: string;
  let created = false;
  if (existing) {
    companyId = (existing as any).id;
  } else {
    const { data: ins, error } = await supabase.from("companies").insert({
      organization_id: orgId,
      name: input.name.trim(),
      normalized_name: nm,
      website_url: input.website || null,
      headquarters: input.location || null,
      company_type_id: input.companyTypeId || null,
      ownership_type: "unknown",
      status: "active",
      confidence_score: 60,
      intelligence_status: "pending_review",
      first_observed_at: new Date().toISOString(),
    }).select("id").single();
    if (error || !ins) return null;
    companyId = (ins as any).id;
    created = true;
  }

  if (internalProductId) {
    const { data: rel } = await supabase
      .from("competitive_relationships").select("id")
      .eq("competitor_company_id", companyId).eq("internal_product_id", internalProductId).maybeSingle();
    if (!rel) {
      await supabase.from("competitive_relationships").insert({
        organization_id: orgId, competitor_company_id: companyId, internal_product_id: internalProductId,
        relationship_type: "direct", confidence_score: 60, first_observed_at: new Date().toISOString(), active: true,
      });
    }
  }
  return { id: companyId, created };
}

export async function addCompetitor(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const name = String(formData.get("name") ?? "").trim();
  if (!name) return;
  const res = await upsertCompetitor(supabase, orgId, {
    name,
    website: String(formData.get("website") ?? "").trim() || null,
    location: String(formData.get("location") ?? "").trim() || null,
    companyTypeId: String(formData.get("company_type_id") ?? "") || null,
  }, String(formData.get("internal_product_id") ?? "") || null);
  revalidatePath("/competitors");
  revalidatePath("/dashboard");
  if (res) revalidatePath(`/competitors/${res.id}`);
}

export async function addProduct(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const companyId = String(formData.get("company_id") ?? "");
  const name = String(formData.get("name") ?? "").trim();
  if (!companyId || !name) return;

  const priceMin = formData.get("price_min") ? Number(formData.get("price_min")) : null;
  const priceMax = formData.get("price_max") ? Number(formData.get("price_max")) : null;

  const { data: prod } = await supabase.from("products").insert({
    organization_id: orgId, company_id: companyId, name,
    normalized_name: normalizeName(name),
    product_category_id: String(formData.get("product_category_id") ?? "") || null,
    description: String(formData.get("description") ?? "").trim() || null,
    product_url: String(formData.get("product_url") ?? "").trim() || null,
    current_price_min: priceMin, current_price_max: priceMax, currency: "USD",
    pricing_unit: String(formData.get("pricing_unit") ?? "").trim() || null,
    confidence_score: 60, intelligence_status: "pending_review",
    first_observed_at: new Date().toISOString(),
  }).select("id").maybeSingle();

  // Record price history so it appears on Pricing + the product detail.
  if (prod && (priceMin != null || priceMax != null)) {
    await supabase.from("pricing_history").insert({
      organization_id: orgId, product_id: (prod as any).id,
      price_min: priceMin, price_max: priceMax, currency: "USD",
      pricing_unit: String(formData.get("pricing_unit") ?? "").trim() || null,
      confidence_score: 60, observed_at: new Date().toISOString(),
    });
  }
  revalidatePath("/products");
  revalidatePath(`/competitors/${companyId}`);
}

export async function addEvent(formData: FormData) {
  const { supabase, userId, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const companyId = String(formData.get("company_id") ?? "");
  const name = String(formData.get("name") ?? "").trim();
  if (!companyId || !name) return;
  const now = new Date().toISOString();
  const value = {
    name,
    date: String(formData.get("event_date") ?? "").trim() || null,
    url: String(formData.get("event_url") ?? "").trim() || null,
    location: String(formData.get("event_location") ?? "").trim() || null,
  };

  const { data: obs } = await supabase.from("observations").insert({
    organization_id: orgId, company_id: companyId, observation_type: "event", field_name: "event",
    observed_value_json: value, supporting_text: `Event: ${name}`,
    source_url: value.url, confidence_score: 60, observed_at: now,
    extracted_by: "human", review_status: "approved",
  }).select("id").maybeSingle();

  await supabase.from("competitive_changes").insert({
    organization_id: orgId, company_id: companyId, observation_id: (obs as any)?.id ?? null,
    change_type: "event_launch", previous_value_json: null, new_value_json: value,
    significance_score: 50, confidence_score: 60, detected_at: now,
    approved_at: now, approved_by: userId ?? null, status: "auto_approved",
    summary: `Event: ${name}${value.date ? " (" + value.date + ")" : ""}`,
  });
  revalidatePath("/activity");
  revalidatePath(`/competitors/${companyId}`);
}

export interface ImportResult {
  ok: boolean;
  nameColumn?: string | null;
  total?: number;
  created?: number;
  existed?: number;
  skipped?: number;
  error?: string;
}

/** Bulk import competitors from an uploaded sheet, linked to a chosen internal
 *  product, deduped against existing companies. No AI — pure parse + dedupe. */
export async function importCompetitors(_prev: ImportResult | null, formData: FormData): Promise<ImportResult> {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return { ok: false, error: "Not authorized." };

  const file = formData.get("file") as File | null;
  if (!file || file.size === 0) return { ok: false, error: "No file uploaded." };
  const internalProductId = String(formData.get("internal_product_id") ?? "") || null;
  const companyTypeId = String(formData.get("company_type_id") ?? "") || null;
  const override = String(formData.get("name_column") ?? "").trim() || undefined;

  let parsed;
  try {
    const buf = Buffer.from(await file.arrayBuffer());
    parsed = parseCompetitorSheet(buf, override);
  } catch (e) {
    return { ok: false, error: e instanceof Error ? e.message : "Could not read the file." };
  }
  if (!parsed.rows.length || !parsed.nameColumn) {
    return { ok: false, error: "Couldn't find a competitor-name column. Try entering the exact column header." };
  }

  // Dedupe within the file too.
  const seen = new Set<string>();
  let created = 0, existed = 0, skipped = 0;
  for (const row of parsed.rows) {
    const nm = normalizeName(row.name);
    if (!nm) { skipped++; continue; }
    if (seen.has(nm)) { skipped++; continue; }
    seen.add(nm);
    const res = await upsertCompetitor(supabase, orgId,
      { name: row.name, website: row.website, location: row.location, companyTypeId },
      internalProductId);
    if (!res) { skipped++; continue; }
    if (res.created) created++; else existed++;
  }

  revalidatePath("/competitors");
  revalidatePath("/dashboard");
  return { ok: true, nameColumn: parsed.nameColumn, total: parsed.totalRows, created, existed, skipped };
}
