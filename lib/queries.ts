import { createClient } from "@/lib/supabase/server";

const DAY = 24 * 60 * 60 * 1000;

async function count(table: string, build?: (q: any) => any): Promise<number> {
  const supabase = await createClient();
  let q = supabase.from(table).select("*", { count: "exact", head: true });
  if (build) q = build(q);
  const { count } = await q;
  return count ?? 0;
}

export interface DashboardStats {
  trackedCompetitors: number;
  activeOfferings: number;
  changesThisWeek: number;
  newCompetitors: number;
  pricingChangesThisMonth: number;
  pendingReviews: number;
  coverageScore: number;
}

export async function getDashboardStats(): Promise<DashboardStats> {
  const supabase = await createClient();
  const weekAgo = new Date(Date.now() - 7 * DAY).toISOString();
  const monthStart = new Date(new Date().getFullYear(), new Date().getMonth(), 1).toISOString();
  const thirtyAgo = new Date(Date.now() - 30 * DAY).toISOString();

  const [tracked, offerings, changesWeek, newComp, pricingMonth, pending] = await Promise.all([
    count("companies"),
    count("products", (q) => q.eq("status", "active")),
    count("competitive_changes", (q) => q.gte("detected_at", weekAgo)),
    count("companies", (q) => q.gte("created_at", thirtyAgo)),
    count("pricing_history", (q) => q.gte("observed_at", monthStart)),
    count("competitive_changes", (q) => q.eq("status", "pending")),
  ]);

  // Coverage: share of companies with at least one product on file.
  const { data: prodCompanies } = await supabase.from("products").select("company_id");
  const withProducts = new Set((prodCompanies ?? []).map((r: any) => r.company_id)).size;
  const coverageScore = tracked ? Math.round((withProducts / tracked) * 100) : 0;

  return {
    trackedCompetitors: tracked,
    activeOfferings: offerings,
    changesThisWeek: changesWeek,
    newCompetitors: newComp,
    pricingChangesThisMonth: pricingMonth,
    pendingReviews: pending,
    coverageScore,
  };
}

export interface LandscapeRow {
  id: string;
  name: string;
  competitive_score: number | null;
  confidence_score: number | null;
  intelligence_status: string;
  last_material_change_at: string | null;
  last_verified_at: string | null;
  areas: string[];
}

function toAreas(rels: any[] | null | undefined): string[] {
  const names = (rels ?? [])
    .map((r) => r.internal_products?.name)
    .filter((n: string | undefined): n is string => !!n);
  return Array.from(new Set(names));
}

export async function listCompanies(search?: string): Promise<LandscapeRow[]> {
  const supabase = await createClient();
  let q = supabase
    .from("companies")
    .select(
      "id, name, competitive_score, confidence_score, intelligence_status, last_material_change_at, last_verified_at, competitive_relationships(internal_products(name))"
    )
    .order("competitive_score", { ascending: false, nullsFirst: false })
    .order("confidence_score", { ascending: false, nullsFirst: false })
    .order("name", { ascending: true })
    .limit(500);
  if (search && search.trim()) q = q.ilike("name", `%${search.trim()}%`);
  const { data } = await q;
  return (data ?? []).map((c: any) => ({
    id: c.id,
    name: c.name,
    competitive_score: c.competitive_score,
    confidence_score: c.confidence_score,
    intelligence_status: c.intelligence_status,
    last_material_change_at: c.last_material_change_at,
    last_verified_at: c.last_verified_at,
    areas: toAreas(c.competitive_relationships),
  }));
}

export async function getCompanyProfile(id: string) {
  const supabase = await createClient();
  const { data: company } = await supabase
    .from("companies")
    .select("*, company_types(name)")
    .eq("id", id)
    .single();
  if (!company) return null;

  const [products, rels, topics, customers, obs, scoreRes] = await Promise.all([
    supabase.from("products").select("*").eq("company_id", id).order("name"),
    supabase
      .from("competitive_relationships")
      .select("relationship_type, notes, internal_products(name)")
      .eq("competitor_company_id", id),
    supabase.from("company_topics").select("topics(name)").eq("company_id", id),
    supabase.from("company_customers").select("customers(name)").eq("company_id", id),
    supabase
      .from("observations")
      .select("field_name, supporting_text")
      .eq("company_id", id)
      .eq("observation_type", "positioning"),
    supabase
      .from("competitive_scores")
      .select("total_score, explanation_json, calculated_at")
      .eq("company_id", id)
      .order("calculated_at", { ascending: false })
      .limit(1)
      .maybeSingle(),
  ]);

  const productIds = (products.data ?? []).map((p: any) => p.id);
  const pricing = productIds.length
    ? (
        await supabase
          .from("pricing_history")
          .select("*")
          .in("product_id", productIds)
          .order("observed_at", { ascending: false })
      ).data ?? []
    : [];

  const latestPriceByProduct = new Map<string, any>();
  for (const row of pricing) if (!latestPriceByProduct.has(row.product_id)) latestPriceByProduct.set(row.product_id, row);

  return {
    company,
    products: (products.data ?? []).map((p: any) => ({ ...p, price: latestPriceByProduct.get(p.id) ?? null })),
    pricing,
    areas: toAreas(rels.data),
    relationships: rels.data ?? [],
    topics: (topics.data ?? []).map((t: any) => t.topics?.name).filter(Boolean),
    customers: (customers.data ?? []).map((c: any) => c.customers?.name).filter(Boolean),
    strengths: (obs.data ?? []).filter((o: any) => o.field_name === "strength").map((o: any) => o.supporting_text),
    weaknesses: (obs.data ?? []).filter((o: any) => o.field_name === "weakness").map((o: any) => o.supporting_text),
    score: scoreRes.data ?? null,
  };
}

export interface ReviewItem {
  id: string;
  change_type: string;
  summary: string | null;
  significance_score: number | null;
  confidence_score: number | null;
  detected_at: string;
  previous_value_json: any;
  new_value_json: any;
  company: { id: string; name: string } | null;
  evidence: string | null;
  source_url: string | null;
}

export async function listPendingChanges(): Promise<ReviewItem[]> {
  const supabase = await createClient();
  const { data } = await supabase
    .from("competitive_changes")
    .select(
      "id, change_type, summary, significance_score, confidence_score, detected_at, previous_value_json, new_value_json, companies(id, name), observations(supporting_text, source_url)"
    )
    .eq("status", "pending")
    .order("significance_score", { ascending: false, nullsFirst: false })
    .order("confidence_score", { ascending: false, nullsFirst: false })
    .limit(100);
  return (data ?? []).map((r: any) => ({
    id: r.id,
    change_type: r.change_type,
    summary: r.summary,
    significance_score: r.significance_score,
    confidence_score: r.confidence_score,
    detected_at: r.detected_at,
    previous_value_json: r.previous_value_json,
    new_value_json: r.new_value_json,
    company: r.companies ? { id: r.companies.id, name: r.companies.name } : null,
    evidence: r.observations?.supporting_text ?? null,
    source_url: r.observations?.source_url ?? null,
  }));
}
