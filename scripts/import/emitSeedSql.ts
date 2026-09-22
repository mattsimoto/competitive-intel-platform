/**
 * Emits the seed spreadsheet as a plain .sql file you can paste straight into
 * the Supabase SQL Editor — no Node, npm, or keys needed on your side.
 *
 *   npx tsx emitSeedSql.ts --file <workbook.xlsx> --out seed_data.sql \
 *     --org-slug your-org --org-name "Your Org"
 *
 * The output opens with the organization insert (which fires the per-org
 * taxonomy + scoring-weight seed trigger), then loads companies, products,
 * pricing, relationships, customers and evidence notes — all at confidence 60
 * and intelligence_status 'pending_review' (Needs Verification). It reuses the
 * exact parsing/dedup/mapping rules of the importer via the shared lib.
 */
import { randomUUID } from "node:crypto";
import { readFileSync, writeFileSync } from "node:fs";
import XLSX from "xlsx";
import {
  cleanDisplayName,
  domainOf,
  extractUrls,
  normalizeName,
  parsePrice,
  splitCustomers,
} from "./lib/normalize.js";
import {
  COMPETITOR_SHEETS,
  INTERNAL_PRODUCTS,
  SHEET_TO_INTERNAL,
  mapCompetesWith,
  splitCompetesWith,
} from "./lib/mapping.js";

const IMPORT_CONFIDENCE = 60;
const MAX_CUSTOMERS = 40;

interface Agg {
  displayName: string;
  normalized: string;
  website: string | null;
  domain: string | null;
  productUrls: Set<string>;
  pricingTexts: string[];
  strengths: string[];
  weaknesses: string[];
  customers: Set<string>;
  socials: string[];
  internalProducts: Set<string>;
  unmappedTokens: Set<string>;
  importRefs: string[];
}

function arg(flag: string, def = ""): string {
  const a = process.argv.slice(2);
  const i = a.indexOf(flag);
  return i >= 0 && a[i + 1] ? a[i + 1] : def;
}

const findHeader = (rows: unknown[][]) =>
  rows.findIndex((r) => r?.some((c) => String(c ?? "").trim() === "Organization Name"));
const col = (h: unknown[], s: string) =>
  h.findIndex((c) => String(c ?? "").trim().toLowerCase().startsWith(s.toLowerCase()));

// ---- SQL literal helpers --------------------------------------------------
const q = (v: string | null | undefined) => (v == null ? "null" : `'${String(v).replace(/'/g, "''")}'`);
const jsonb = (o: unknown) => `'${JSON.stringify(o).replace(/'/g, "''")}'::jsonb`;
const num = (n: number | null | undefined) => (n == null ? "null" : String(n));

function accumulate(file: string): Map<string, Agg> {
  const wb = XLSX.read(readFileSync(file), { type: "buffer" });
  const companies = new Map<string, Agg>();
  for (const sheet of COMPETITOR_SHEETS) {
    const ws = wb.Sheets[sheet];
    if (!ws) continue;
    const rows = XLSX.utils.sheet_to_json<unknown[]>(ws, { header: 1, blankrows: false });
    const h = findHeader(rows);
    if (h < 0) continue;
    const header = rows[h];
    const idx = {
      org: col(header, "Organization Name"),
      web: col(header, "Website"),
      portfolio: col(header, "Their Product Portfolio"),
      competes: col(header, "Which Components"),
      pricing: col(header, "Pricing"),
      diff: col(header, "Unique Differentiators"),
      weak: col(header, "Areas of Inferiority"),
      customers: col(header, "Known Customer"),
      social: col(header, "Social Media"),
    };
    for (let r = h + 1; r < rows.length; r++) {
      const row = rows[r];
      const rawName = row?.[idx.org];
      if (!rawName || !String(rawName).trim()) continue;
      const normalized = normalizeName(String(rawName));
      const website = idx.web >= 0 ? cleanDisplayName(row[idx.web] as string) || null : null;
      const domain = domainOf(website);
      let key = normalized || (domain ?? `row-${sheet}-${r}`);
      if (!companies.has(key) && domain) {
        const byDomain = [...companies.values()].find((c) => c.domain === domain);
        if (byDomain) key = byDomain.normalized;
      }
      const agg: Agg =
        companies.get(key) ?? {
          displayName: cleanDisplayName(String(rawName)),
          normalized, website, domain,
          productUrls: new Set(), pricingTexts: [], strengths: [], weaknesses: [],
          customers: new Set(), socials: [], internalProducts: new Set(),
          unmappedTokens: new Set(), importRefs: [],
        };
      if (!agg.website && website) { agg.website = website; agg.domain = domain; }
      agg.importRefs.push(`${sheet}!Row${r + 1}`);
      extractUrls(row[idx.portfolio] as string).forEach((u) => agg.productUrls.add(u));
      const def = SHEET_TO_INTERNAL[sheet];
      if (def) agg.internalProducts.add(def);
      for (const token of splitCompetesWith(row[idx.competes] as string)) {
        const { internal, raw } = mapCompetesWith(token);
        if (internal) agg.internalProducts.add(internal);
        else agg.unmappedTokens.add(raw);
      }
      const pt = idx.pricing >= 0 ? (row[idx.pricing] as string) : null;
      if (pt && String(pt).trim()) agg.pricingTexts.push(String(pt));
      if (idx.diff >= 0 && row[idx.diff]) agg.strengths.push(String(row[idx.diff]).trim());
      if (idx.weak >= 0 && row[idx.weak]) agg.weaknesses.push(String(row[idx.weak]).trim());
      const custs = idx.customers >= 0 ? splitCustomers(row[idx.customers] as string) : [];
      if (custs.length <= MAX_CUSTOMERS) custs.forEach((c) => agg.customers.add(c));
      if (idx.social >= 0 && row[idx.social]) extractUrls(row[idx.social] as string).forEach((u) => agg.socials.push(u));
      companies.set(key, agg);
    }
  }
  return companies;
}

function socialCols(urls: string[]) {
  const out = { linkedin_url: null as string | null, x_url: null as string | null, youtube_url: null as string | null, facebook_url: null as string | null };
  for (const u of urls) {
    const host = domainOf(u) ?? "";
    if (host.includes("linkedin")) out.linkedin_url = u;
    else if (host.includes("x.com") || host.includes("twitter")) out.x_url = u;
    else if (host.includes("youtube")) out.youtube_url = u;
    else if (host.includes("facebook")) out.facebook_url = u;
  }
  return out;
}

function emit() {
  const file = arg("--file");
  const out = arg("--out", "seed_data.sql");
  const orgName = arg("--org-name", "Seed Organization");
  const orgSlug = arg("--org-slug", "seed-org");
  if (!file) { console.error("Missing --file"); process.exit(1); }

  const companies = accumulate(file);
  const orgId = randomUUID();
  const internalIds = new Map<string, string>();
  const customerIds = new Map<string, { id: string; name: string }>();
  const L: string[] = [];

  L.push("-- Seed data for the Competitive Intelligence Platform.");
  L.push("-- Paste into the Supabase SQL Editor AFTER running migrations 0001-0003.");
  L.push("-- Every record is confidence 60 / pending_review (Needs Verification).");
  L.push("begin;");
  L.push(`insert into organizations (id, name, slug) values (${q(orgId)}, ${q(orgName)}, ${q(orgSlug)});`);

  L.push("\n-- Internal portfolio (the org's own offerings).");
  for (const name of INTERNAL_PRODUCTS) {
    const id = randomUUID();
    internalIds.set(name, id);
    L.push(`insert into internal_products (id, organization_id, name) values (${q(id)}, ${q(orgId)}, ${q(name)});`);
  }

  for (const c of companies.values()) {
    const companyId = randomUUID();
    const s = socialCols(c.socials);
    L.push(`\n-- ${c.displayName}`);
    L.push(
      `insert into companies (id, organization_id, name, normalized_name, website_url, ` +
        `linkedin_url, x_url, youtube_url, facebook_url, confidence_score, intelligence_status, ` +
        `original_import_reference, status, first_observed_at) values (` +
        `${q(companyId)}, ${q(orgId)}, ${q(c.displayName)}, ${q(c.normalized)}, ${q(c.website)}, ` +
        `${q(s.linkedin_url)}, ${q(s.x_url)}, ${q(s.youtube_url)}, ${q(s.facebook_url)}, ${IMPORT_CONFIDENCE}, ` +
        `'pending_review', ${q(c.importRefs.join("; "))}, 'active', now());`
    );

    for (const [kind, list] of [["strength", c.strengths], ["weakness", c.weaknesses]] as const) {
      for (const text of list) {
        if (!text) continue;
        L.push(
          `insert into observations (organization_id, company_id, observation_type, field_name, ` +
            `observed_value_json, supporting_text, confidence_score, extracted_by, review_status) values (` +
            `${q(orgId)}, ${q(companyId)}, 'positioning', ${q(kind)}, ${jsonb({ kind, text })}, ` +
            `${q(text)}, ${IMPORT_CONFIDENCE}, 'import', 'pending');`
        );
      }
    }

    const firstPrice = c.pricingTexts.map(parsePrice).find((p) => p && p.parsed) ?? null;
    for (const url of c.productUrls) {
      const productId = randomUUID();
      const pname = url.replace(/^https?:\/\//, "").replace(/\/$/, "").split("/").slice(0, 2).join("/");
      L.push(
        `insert into products (id, organization_id, company_id, name, normalized_name, product_url, ` +
          `confidence_score, intelligence_status, original_import_reference, first_observed_at) values (` +
          `${q(productId)}, ${q(orgId)}, ${q(companyId)}, ${q(pname)}, ${q(normalizeName(pname))}, ${q(url)}, ` +
          `${IMPORT_CONFIDENCE}, 'pending_review', ${q(c.importRefs[0])}, now());`
      );
      if (firstPrice) {
        L.push(
          `insert into pricing_history (organization_id, product_id, price_min, price_max, currency, ` +
            `raw_price_text, confidence_score, observed_at) values (` +
            `${q(orgId)}, ${q(productId)}, ${num(firstPrice.priceMin)}, ${num(firstPrice.priceMax)}, ` +
            `${q(firstPrice.currency)}, ${q(firstPrice.raw.slice(0, 4000))}, ${IMPORT_CONFIDENCE}, now());`
        );
      }
    }

    for (const internalName of c.internalProducts) {
      const internalId = internalIds.get(internalName);
      if (!internalId) continue;
      const notes = c.unmappedTokens.size ? `Unmapped source tokens: ${[...c.unmappedTokens].join(", ")}` : null;
      L.push(
        `insert into competitive_relationships (organization_id, competitor_company_id, internal_product_id, ` +
          `relationship_type, confidence_score, notes, first_observed_at, active) values (` +
          `${q(orgId)}, ${q(companyId)}, ${q(internalId)}, 'adjacent', ${IMPORT_CONFIDENCE}, ${q(notes)}, now(), true);`
      );
    }

    for (const custName of c.customers) {
      const nkey = normalizeName(custName);
      if (!nkey) continue;
      if (!customerIds.has(nkey)) customerIds.set(nkey, { id: randomUUID(), name: custName });
      const cust = customerIds.get(nkey)!;
      L.push(
        `insert into company_customers (organization_id, company_id, customer_id, relationship_type, ` +
          `confidence_score, first_observed_at) values (` +
          `${q(orgId)}, ${q(companyId)}, ${q(cust.id)}, 'unknown', ${IMPORT_CONFIDENCE}, now());`
      );
    }
  }

  // Customers must exist before company_customers references them: emit them
  // first by prepending, using a deterministic block inserted after the org.
  const custLines = [...customerIds.values()].map(
    (c) => `insert into customers (id, organization_id, name, normalized_name) values (` +
      `${q(c.id)}, ${q(orgId)}, ${q(c.name)}, ${q(normalizeName(c.name))});`
  );
  const marker = L.indexOf(L.find((l) => l.startsWith("\n-- Internal portfolio"))!);
  L.splice(marker, 0, "\n-- Customers (deduped across companies).", ...custLines);

  L.push("commit;");
  writeFileSync(out, L.join("\n") + "\n");
  console.log(`Wrote ${out}: ${companies.size} companies, ${customerIds.size} customers, ${internalIds.size} internal products.`);
}

emit();
