"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";

const TAXONOMY_TABLES = new Set([
  "product_categories", "topics", "company_types", "source_types", "regions", "internal_products",
]);
const FACTORS = [
  "product_overlap", "audience_overlap", "topic_overlap", "customer_overlap",
  "pricing_competitiveness", "market_activity", "geographic_overlap", "recent_expansion",
];

/** Save all eight weights atomically and recompute scores (RLS + trigger enforce
 *  admin-only and the total-100 rule; an invalid total rolls back with no change). */
export async function saveWeights(formData: FormData) {
  const supabase = await createClient();
  const weights: Record<string, number> = {};
  for (const f of FACTORS) weights[f] = Number(formData.get(f) ?? 0);
  await supabase.rpc("set_scoring_weights", { p_weights: weights });
  revalidatePath("/admin");
  revalidatePath("/dashboard");
  revalidatePath("/competitors");
}

export async function setUserRole(formData: FormData) {
  const id = String(formData.get("id") ?? "");
  const role = String(formData.get("role") ?? "");
  if (!id || !["administrator", "analyst", "viewer"].includes(role)) return;
  const supabase = await createClient();
  await supabase.from("users").update({ role }).eq("id", id);
  revalidatePath("/admin");
}

export async function addTaxonomy(formData: FormData) {
  const table = String(formData.get("table") ?? "");
  const name = String(formData.get("name") ?? "").trim();
  if (!TAXONOMY_TABLES.has(table) || !name) return;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id").eq("id", user!.id).maybeSingle();
  const orgId = (profile as any)?.organization_id;
  if (!orgId) return;
  await supabase.from(table).insert({ organization_id: orgId, name });
  revalidatePath("/admin");
}

const CHANGE_TYPES = [
  "product_launch", "product_removal", "pricing_change", "feature_change",
  "topic_expansion", "event_launch", "audience_change", "customer_announcement",
  "partnership", "acquisition", "geographic_expansion", "rebrand",
  "positioning_change", "research_launch",
];

export async function saveAutoApproval(formData: FormData) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", user!.id).maybeSingle();
  const orgId = (profile as any)?.organization_id;
  if (!orgId || (profile as any)?.role !== "administrator") return;

  const enabled = formData.get("enabled") === "on";
  const pricingAlways = formData.get("pricing_always_review") === "on";
  const minConfidence = Number(formData.get("min_confidence") ?? 85);
  const eligible = CHANGE_TYPES.filter((t) => formData.get(`ct_${t}`) === "on");

  await supabase.from("auto_approval_settings").upsert({
    organization_id: orgId,
    enabled,
    min_confidence: minConfidence,
    eligible_change_types: eligible,
    pricing_always_review: pricingAlways,
    updated_at: new Date().toISOString(),
  }, { onConflict: "organization_id" });
  revalidatePath("/admin");
}
