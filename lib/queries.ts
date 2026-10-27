import { createClient } from "@/lib/supabase/server";
import { money } from "@/lib/format";

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

  const [products, rels, topics, customers, obs, scoreRes, sourcesRes, sourceTypesRes] = await Promise.all([
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
    supabase
      .from("company_sources")
      .select("id, name, url, priority, active, status, last_checked_at, last_changed_at, last_error, content_hash, source_type_id, source_types(name)")
      .eq("company_id", id)
      .order("priority", { ascending: true }),
    supabase.from("source_types").select("id, name").order("name"),
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
    sources: (sourcesRes.data ?? []).map((s: any) => ({
      id: s.id,
      name: s.name,
      url: s.url,
      priority: s.priority,
      active: s.active,
      status: s.status,
      last_checked_at: s.last_checked_at,
      last_changed_at: s.last_changed_at,
      last_error: s.last_error,
      hasSnapshot: !!s.content_hash,
      sourceTypeId: s.source_type_id,
      type: s.source_types?.name ?? null,
    })),
    sourceTypes: (sourceTypesRes.data ?? []) as { id: string; name: string }[],
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

// ---- Products screen -------------------------------------------------------
export interface ProductRow {
  id: string;
  name: string;
  product_url: string | null;
  confidence_score: number | null;
  intelligence_status: string;
  company: { id: string; name: string } | null;
  companyScore: number | null;
  category: string | null;
  price: { min: number | null; max: number | null; currency: string | null; unit: string | null } | null;
  sourceStatus: string | null;
  sourceError: string | null;
}

export async function listProducts(search?: string, view?: string): Promise<ProductRow[]> {
  const supabase = await createClient();
  let q = supabase
    .from("products")
    .select(
      "id, name, product_url, confidence_score, intelligence_status, companies(id, name, competitive_score), product_categories(name)"
    )
    .order("name")
    .limit(500);
  if (search && search.trim()) q = q.ilike("name", `%${search.trim()}%`);
  const { data } = await q;

  const ids = (data ?? []).map((p: any) => p.id);
  const prices = ids.length
    ? (
        await supabase
          .from("pricing_history")
          .select("product_id, price_min, price_max, currency, pricing_unit, observed_at")
          .in("product_id", ids)
          .order("observed_at", { ascending: false })
      ).data ?? []
    : [];
  const latest = new Map<string, any>();
  for (const pr of prices) if (!latest.has(pr.product_id)) latest.set(pr.product_id, pr);

  // Crawl status per product: match its URL to a Product Page source.
  const urls = (data ?? []).map((p: any) => p.product_url).filter(Boolean);
  const sources = urls.length
    ? (await supabase.from("company_sources").select("company_id, url, status, last_error").in("url", urls)).data ?? []
    : [];
  const sourceByKey = new Map<string, any>();
  for (const s of sources) sourceByKey.set(`${s.company_id}|${s.url}`, s);

  let rows = (data ?? []).map((p: any) => {
    const src = p.companies ? sourceByKey.get(`${p.companies.id}|${p.product_url}`) : null;
    return {
      id: p.id,
      name: p.name,
      product_url: p.product_url,
      confidence_score: p.confidence_score,
      intelligence_status: p.intelligence_status,
      company: p.companies ? { id: p.companies.id, name: p.companies.name } : null,
      companyScore: p.companies?.competitive_score ?? null,
      category: p.product_categories?.name ?? null,
      price: latest.get(p.id)
        ? { min: latest.get(p.id).price_min, max: latest.get(p.id).price_max, currency: latest.get(p.id).currency, unit: latest.get(p.id).pricing_unit }
        : null,
      sourceStatus: src?.status ?? null,
      sourceError: src?.last_error ?? null,
    };
  });

  if (view === "live") rows = rows.filter((r) => r.sourceStatus === "ok");
  else if (view === "priced") rows = rows.filter((r) => r.price != null);
  return rows;
}

// ---- Pricing screen --------------------------------------------------------
function priceMid(a: number | null, b: number | null): number | null {
  if (a == null && b == null) return null;
  if (a != null && b != null) return (a + b) / 2;
  return (a ?? b)!;
}

export interface PricingRow {
  productId: string;
  productName: string;
  company: { id: string; name: string } | null;
  category: string | null;
  current: { min: number | null; max: number | null; currency: string | null; unit: string | null };
  previous: { min: number | null; max: number | null; currency: string | null } | null;
  changePct: number | null;
  observedAt: string;
  confidence: number | null;
  rawText: string | null;
}

export async function listPricing(search?: string): Promise<PricingRow[]> {
  const supabase = await createClient();
  const { data } = await supabase
    .from("pricing_history")
    .select(
      "id, product_id, price_min, price_max, currency, pricing_unit, raw_price_text, observed_at, confidence_score, products(id, name, companies(id, name), product_categories(name))"
    )
    .order("observed_at", { ascending: false })
    .limit(1000);

  const byProduct = new Map<string, any[]>();
  for (const r of data ?? []) {
    const arr = byProduct.get(r.product_id) ?? [];
    arr.push(r);
    byProduct.set(r.product_id, arr);
  }

  const rows: PricingRow[] = [];
  for (const [pid, arr] of byProduct) {
    const cur = arr[0];
    const prev = arr[1] ?? null;
    const p = cur.products;
    const curMid = priceMid(cur.price_min, cur.price_max);
    const prevMid = prev ? priceMid(prev.price_min, prev.price_max) : null;
    const changePct = curMid != null && prevMid != null && prevMid !== 0 ? Math.round(((curMid - prevMid) / prevMid) * 100) : null;
    rows.push({
      productId: pid,
      productName: p?.name ?? "—",
      company: p?.companies ? { id: p.companies.id, name: p.companies.name } : null,
      category: p?.product_categories?.name ?? null,
      current: { min: cur.price_min, max: cur.price_max, currency: cur.currency, unit: cur.pricing_unit },
      previous: prev ? { min: prev.price_min, max: prev.price_max, currency: prev.currency } : null,
      changePct,
      observedAt: cur.observed_at,
      confidence: cur.confidence_score,
      rawText: cur.raw_price_text,
    });
  }
  rows.sort((a, b) => (a.company?.name ?? "").localeCompare(b.company?.name ?? "") || a.productName.localeCompare(b.productName));
  const q = search?.trim().toLowerCase();
  return q ? rows.filter((r) => r.productName.toLowerCase().includes(q) || (r.company?.name ?? "").toLowerCase().includes(q)) : rows;
}

// ---- Markets & Topics ------------------------------------------------------
const DAY_MS = 24 * 60 * 60 * 1000;

export interface TopicRow {
  id: string;
  name: string;
  activeCompetitors: number;
  activeProducts: number;
  newEntrants30: number;
  newEntrants90: number;
  recentActivity: string | null;
}

export async function listTopics(): Promise<TopicRow[]> {
  const supabase = await createClient();
  const [topicsRes, ctRes, ptRes] = await Promise.all([
    supabase.from("topics").select("id, name").eq("active", true).order("name"),
    supabase.from("company_topics").select("topic_id, company_id, first_observed_at, last_activity_at"),
    supabase.from("product_topics").select("topic_id, product_id"),
  ]);
  const now = Date.now();
  const ct = ctRes.data ?? [];
  const pt = ptRes.data ?? [];

  return (topicsRes.data ?? []).map((t: any) => {
    const links = ct.filter((r: any) => r.topic_id === t.id);
    const prods = pt.filter((r: any) => r.topic_id === t.id);
    const companies = new Set(links.map((r: any) => r.company_id));
    const within = (days: number) =>
      new Set(links.filter((r: any) => r.first_observed_at && now - new Date(r.first_observed_at).getTime() <= days * DAY_MS).map((r: any) => r.company_id)).size;
    const lastActivity = links
      .map((r: any) => r.last_activity_at)
      .filter(Boolean)
      .sort()
      .pop() ?? null;
    return {
      id: t.id,
      name: t.name,
      activeCompetitors: companies.size,
      activeProducts: new Set(prods.map((r: any) => r.product_id)).size,
      newEntrants30: within(30),
      newEntrants90: within(90),
      recentActivity: lastActivity,
    };
  });
}

export async function getTopicDetail(id: string) {
  const supabase = await createClient();
  const { data: topic } = await supabase.from("topics").select("id, name, description").eq("id", id).single();
  if (!topic) return null;
  const [companies, products] = await Promise.all([
    supabase.from("company_topics").select("companies(id, name, competitive_score, confidence_score)").eq("topic_id", id),
    supabase.from("product_topics").select("products(id, name, companies(name))").eq("topic_id", id),
  ]);
  return {
    topic,
    companies: (companies.data ?? []).map((r: any) => r.companies).filter(Boolean),
    products: (products.data ?? []).map((r: any) => r.products).filter(Boolean),
  };
}

// ---- Activity --------------------------------------------------------------
export interface ActivityRow {
  id: string;
  change_type: string;
  summary: string | null;
  significance_score: number | null;
  confidence_score: number | null;
  detected_at: string;
  status: string;
  company: { id: string; name: string } | null;
  evidence: string | null;
  source_url: string | null;
}

export async function listActivity(opts: { status?: string; changeType?: string } = {}): Promise<ActivityRow[]> {
  const supabase = await createClient();
  let q = supabase
    .from("competitive_changes")
    .select("id, change_type, summary, significance_score, confidence_score, detected_at, status, companies(id, name), observations(supporting_text, source_url)")
    .order("detected_at", { ascending: false })
    .limit(200);
  if (opts.status && opts.status !== "all") q = q.eq("status", opts.status);
  if (opts.changeType && opts.changeType !== "all") q = q.eq("change_type", opts.changeType);
  const { data } = await q;
  return (data ?? []).map((r: any) => ({
    id: r.id,
    change_type: r.change_type,
    summary: r.summary,
    significance_score: r.significance_score,
    confidence_score: r.confidence_score,
    detected_at: r.detected_at,
    status: r.status,
    company: r.companies ? { id: r.companies.id, name: r.companies.name } : null,
    evidence: r.observations?.supporting_text ?? null,
    source_url: r.observations?.source_url ?? null,
  }));
}

// ---- Admin -----------------------------------------------------------------
export async function getAdminData() {
  const supabase = await createClient();
  const [weights, users, cats, topics, ctypes, stypes, regions, internal, autoApproval] = await Promise.all([
    supabase.from("scoring_weights").select("factor, weight, active").order("weight", { ascending: false }),
    supabase.from("users").select("id, email, full_name, role, active").order("email"),
    supabase.from("product_categories").select("id, name").order("name"),
    supabase.from("topics").select("id, name").order("name"),
    supabase.from("company_types").select("id, name").order("name"),
    supabase.from("source_types").select("id, name").order("name"),
    supabase.from("regions").select("id, name").order("name"),
    supabase.from("internal_products").select("id, name").order("name"),
    supabase.from("auto_approval_settings").select("*").maybeSingle(),
  ]);
  return {
    weights: weights.data ?? [],
    users: users.data ?? [],
    taxonomies: {
      product_categories: cats.data ?? [],
      topics: topics.data ?? [],
      company_types: ctypes.data ?? [],
      source_types: stypes.data ?? [],
      regions: regions.data ?? [],
      internal_products: internal.data ?? [],
    },
    autoApproval: (autoApproval.data as any) ?? null,
  };
}

/** Pending/past invitations and recent access history for the Team panel.
 *  RLS restricts both tables to administrators of the caller's org. */
export async function getWorkspaceMembership() {
  const supabase = await createClient();
  const [invitations, audit] = await Promise.all([
    supabase.from("workspace_invitations")
      .select("id, email, role, expires_at, revoked_at, accepted_at")
      .order("created_at", { ascending: false }),
    supabase.from("membership_audit")
      .select("id, action, created_at, actor_id, target_user_id, details")
      .order("created_at", { ascending: false })
      .limit(20),
  ]);
  return { invitations: invitations.data ?? [], audit: audit.data ?? [] };
}

// ---- Ask Intelligence (deterministic structured query) ---------------------
export interface AskRecord { label: string; sublabel?: string; href?: string }
export interface AskResult { intent: string; summary: string; records: AskRecord[]; caveat?: string }

async function companiesInAllAreas(
  supabase: any,
  areas: { id: string; name: string }[],
  names: string[]
): Promise<AskRecord[]> {
  const ids = names
    .map((n) => areas.find((a) => a.name.toLowerCase() === n.toLowerCase())?.id)
    .filter(Boolean) as string[];
  if (!ids.length) return [];
  const { data } = await supabase
    .from("competitive_relationships")
    .select("competitor_company_id, internal_product_id, companies(id, name, competitive_score)")
    .in("internal_product_id", ids)
    .eq("active", true);
  const byCompany = new Map<string, { company: any; areas: Set<string> }>();
  for (const r of data ?? []) {
    const entry = byCompany.get(r.competitor_company_id) ?? { company: r.companies, areas: new Set<string>() };
    entry.areas.add(r.internal_product_id);
    byCompany.set(r.competitor_company_id, entry);
  }
  const recs: AskRecord[] = [];
  for (const [cid, v] of byCompany) {
    if (ids.every((id) => v.areas.has(id))) {
      recs.push({
        label: v.company?.name ?? "Company",
        sublabel: `Score ${v.company?.competitive_score == null ? "—" : Math.round(v.company.competitive_score)}`,
        href: `/competitors/${cid}`,
      });
    }
  }
  return recs.sort((a, b) => a.label.localeCompare(b.label));
}

export async function askIntelligence(q: string): Promise<AskResult> {
  const supabase = await createClient();
  const text = q.trim().toLowerCase();
  const caveat = "Answered from imported structured data (confidence 60, pending verification).";
  const { data: areas } = await supabase.from("internal_products").select("id, name");
  const areaList = (areas ?? []) as { id: string; name: string }[];
  const foundAreas = areaList.map((a) => a.name).filter((n) => text.includes(n.toLowerCase()));

  // 1) Price threshold: "under $20,000"
  const priceMatch = text.match(/(?:under|below|less than|cheaper than)\s*\$?\s*([\d,]+)/);
  if (priceMatch) {
    const n = Number(priceMatch[1].replace(/,/g, ""));
    const { data: ph } = await supabase
      .from("pricing_history")
      .select("product_id, price_min, price_max, currency, products(name, companies(id, name))")
      .order("observed_at", { ascending: false });
    const seen = new Set<string>();
    const recs: AskRecord[] = [];
    for (const r of ph ?? []) {
      if (seen.has(r.product_id)) continue;
      seen.add(r.product_id);
      const val = r.price_max ?? r.price_min;
      if (val != null && val <= n) {
        const p: any = r.products;
        recs.push({
          label: p?.name ?? "Product",
          sublabel: `${p?.companies?.name ?? ""} · ${money(r.price_min, r.price_max, r.currency ?? "USD")}`,
          href: p?.companies?.id ? `/competitors/${p.companies.id}` : undefined,
        });
      }
    }
    return { intent: "pricing", summary: `${recs.length} offering(s) at or under $${n.toLocaleString()}, from observed pricing.`, records: recs.slice(0, 50), caveat };
  }

  // 2) Overlap across two areas
  if ((text.includes("overlap") || text.includes("both")) && foundAreas.length >= 2) {
    const recs = await companiesInAllAreas(supabase, areaList, [foundAreas[0], foundAreas[1]]);
    return { intent: "overlap", summary: `${recs.length} companies compete across both ${foundAreas[0]} and ${foundAreas[1]}.`, records: recs, caveat };
  }

  // 3) Single-area query
  if (foundAreas.length >= 1) {
    const recs = await companiesInAllAreas(supabase, areaList, [foundAreas[0]]);
    return { intent: "area", summary: `${recs.length} companies compete in ${foundAreas[0]}.`, records: recs, caveat };
  }

  // 4) Top scores
  if (/(top|highest|strongest|biggest|leading|best)/.test(text) || text.includes("score")) {
    const { data } = await supabase.from("companies").select("id, name, competitive_score").order("competitive_score", { ascending: false, nullsFirst: false }).limit(10);
    const recs = (data ?? []).map((c: any) => ({ label: c.name, sublabel: `Score ${c.competitive_score == null ? "—" : Math.round(c.competitive_score)}`, href: `/competitors/${c.id}` }));
    return { intent: "top", summary: "Competitors with the highest competitive scores.", records: recs, caveat };
  }

  // 5) Fallback: company-name search
  const { data } = await supabase.from("companies").select("id, name, competitive_score").ilike("name", `%${q.trim()}%`).limit(20);
  if ((data ?? []).length) {
    const recs = (data ?? []).map((c: any) => ({ label: c.name, sublabel: `Score ${c.competitive_score == null ? "—" : Math.round(c.competitive_score)}`, href: `/competitors/${c.id}` }));
    return { intent: "search", summary: `${recs.length} companies match “${q.trim()}”.`, records: recs, caveat };
  }
  return { intent: "none", summary: "I couldn't map that to the structured data. Try one of the examples below — free-form questions unlock when the AI key is added.", records: [] };
}

// ---- Product News ----------------------------------------------------------
export interface BriefRow {
  id: string;
  title: string;
  kind: string;
  period_label: string | null;
  generated_at: string;
  source_count: number | null;
}

export async function listBriefs(): Promise<BriefRow[]> {
  const supabase = await createClient();
  const { data } = await supabase
    .from("market_briefs")
    .select("id, title, kind, period_label, generated_at, source_count")
    .order("generated_at", { ascending: false })
    .limit(100);
  return (data ?? []) as BriefRow[];
}

export async function getBrief(id: string) {
  const supabase = await createClient();
  const { data } = await supabase.from("market_briefs").select("*").eq("id", id).single();
  return data ?? null;
}

// ---- Watchlists ------------------------------------------------------------
export interface WatchlistRow {
  id: string;
  name: string;
  description: string | null;
  shared: boolean;
  itemCount: number;
}

export async function listWatchlists(): Promise<WatchlistRow[]> {
  const supabase = await createClient();
  const { data } = await supabase
    .from("watchlists")
    .select("id, name, description, shared, watchlist_items(count)")
    .order("created_at", { ascending: false });
  return (data ?? []).map((w: any) => ({
    id: w.id, name: w.name, description: w.description, shared: w.shared,
    itemCount: w.watchlist_items?.[0]?.count ?? 0,
  }));
}

export async function getWatchlist(id: string) {
  const supabase = await createClient();
  const { data: watchlist } = await supabase.from("watchlists").select("*").eq("id", id).single();
  if (!watchlist) return null;

  const { data: items } = await supabase.from("watchlist_items").select("id, entity_type, entity_id").eq("watchlist_id", id);
  const of = (t: string) => (items ?? []).filter((i: any) => i.entity_type === t);
  const companyItems = of("company"), productItems = of("product"), topicItems = of("topic");

  const [companies, products, topics] = await Promise.all([
    companyItems.length ? supabase.from("companies").select("id, name, competitive_score").in("id", companyItems.map((i: any) => i.entity_id)) : Promise.resolve({ data: [] as any[] }),
    productItems.length ? supabase.from("products").select("id, name, companies(name)").in("id", productItems.map((i: any) => i.entity_id)) : Promise.resolve({ data: [] as any[] }),
    topicItems.length ? supabase.from("topics").select("id, name").in("id", topicItems.map((i: any) => i.entity_id)) : Promise.resolve({ data: [] as any[] }),
  ]);

  const companyList = companyItems.map((i: any) => {
    const c = (companies.data ?? []).find((x: any) => x.id === i.entity_id);
    return { itemId: i.id, id: i.entity_id, name: c?.name ?? "(removed)", score: c?.competitive_score ?? null };
  });
  const productList = productItems.map((i: any) => {
    const p = (products.data ?? []).find((x: any) => x.id === i.entity_id);
    return { itemId: i.id, id: i.entity_id, name: p?.name ?? "(removed)", company: p?.companies?.name ?? null };
  });
  const topicList = topicItems.map((i: any) => {
    const t = (topics.data ?? []).find((x: any) => x.id === i.entity_id);
    return { itemId: i.id, id: i.entity_id, name: t?.name ?? "(removed)" };
  });

  let activity: any[] = [];
  const companyIds = companyList.map((c) => c.id);
  if (companyIds.length) {
    const { data } = await supabase
      .from("competitive_changes")
      .select("id, change_type, summary, detected_at, status, companies(id, name)")
      .in("company_id", companyIds)
      .order("detected_at", { ascending: false })
      .limit(50);
    activity = data ?? [];
  }
  return { watchlist, companyList, productList, topicList, activity };
}

/** Minimal option lists for the watchlist add-pickers. */
export async function getPickerOptions() {
  const supabase = await createClient();
  const [companies, products, topics] = await Promise.all([
    supabase.from("companies").select("id, name").order("name").limit(500),
    supabase.from("products").select("id, name").order("name").limit(500),
    supabase.from("topics").select("id, name").eq("active", true).order("name"),
  ]);
  return { companies: companies.data ?? [], products: products.data ?? [], topics: topics.data ?? [] };
}

// ---- Product Detail --------------------------------------------------------
export async function getProduct(id: string) {
  const supabase = await createClient();
  const { data: product } = await supabase
    .from("products")
    .select("*, companies(id, name), product_categories(name)")
    .eq("id", id)
    .single();
  if (!product) return null;

  const [pricing, features, ptopics] = await Promise.all([
    supabase.from("pricing_history").select("*").eq("product_id", id).order("observed_at", { ascending: false }),
    supabase.from("product_features").select("feature_name, feature_value").eq("product_id", id),
    supabase.from("product_topics").select("topics(name)").eq("product_id", id),
  ]);

  let source: any = null;
  if ((product as any).product_url) {
    const { data: cs } = await supabase
      .from("company_sources")
      .select("status, last_error, last_checked_at")
      .eq("company_id", (product as any).company_id)
      .eq("url", (product as any).product_url)
      .maybeSingle();
    source = cs;
  }

  return {
    product,
    pricing: pricing.data ?? [],
    features: features.data ?? [],
    topics: (ptopics.data ?? []).map((t: any) => t.topics?.name).filter(Boolean),
    source,
  };
}

// ---- Source snapshot (on-demand fetch preview) -----------------------------
export async function getSourceSnapshot(id: string) {
  const supabase = await createClient();
  const { data: source } = await supabase
    .from("company_sources")
    .select("id, name, url, status, last_error, last_checked_at, company_id, companies(id, name), source_types(name)")
    .eq("id", id)
    .maybeSingle();
  if (!source) return null;
  const { data: doc } = await supabase
    .from("source_documents")
    .select("title, cleaned_text, metadata_json, fetched_at")
    .eq("company_source_id", id)
    .order("fetched_at", { ascending: false })
    .limit(1)
    .maybeSingle();
  return { source, doc };
}

// ---- Add / Import form options ----------------------------------------------
export async function getAddFormOptions() {
  const supabase = await createClient();
  const [internal, ctypes, cats, companies] = await Promise.all([
    supabase.from("internal_products").select("id, name").order("name"),
    supabase.from("company_types").select("id, name").order("name"),
    supabase.from("product_categories").select("id, name").order("name"),
    supabase.from("companies").select("id, name").order("name").limit(1000),
  ]);
  return {
    internalProducts: internal.data ?? [],
    companyTypes: ctypes.data ?? [],
    categories: cats.data ?? [],
    companies: companies.data ?? [],
  };
}
