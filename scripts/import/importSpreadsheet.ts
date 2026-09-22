/**
 * Seed-spreadsheet importer for the Competitive Intelligence Platform.
 *
 *   npx tsx importSpreadsheet.ts --file ../../Competitive_Intel_for_CRA.xlsx --dry-run
 *   npx tsx importSpreadsheet.ts --file <path> --org-slug acme --org-name "Acme"
 *
 * Dry-run parses the workbook and prints a report without touching a database.
 * A real run needs SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in the env (the
 * service role bypasses RLS, so this runs server-side only — never in a browser).
 *
 * Every imported record is marked confidence 60 and intelligence_status
 * 'pending_review' (Needs Verification): the seed data is ~2 years old and must
 * be re-verified before it is treated as current.
 */
import { readFileSync } from "node:fs";
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
const MAX_CUSTOMERS = 40; // lists longer than this are flagged, not exploded

interface Args {
  file: string;
  orgSlug: string;
  orgName: string;
  dryRun: boolean;
}

function parseArgs(): Args {
  const a = process.argv.slice(2);
  const get = (flag: string, def = "") => {
    const i = a.indexOf(flag);
    return i >= 0 && a[i + 1] ? a[i + 1] : def;
  };
  return {
    file: get("--file"),
    orgSlug: get("--org-slug", "seed-org"),
    orgName: get("--org-name", "Seed Organization"),
    dryRun: a.includes("--dry-run"),
  };
}

interface CompanyAgg {
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
  internalProducts: Set<string>; // canonical portfolio items it competes with
  unmappedTokens: Set<string>;
  importRefs: string[]; // e.g. "Events!Row37"
}

/** Find the header row index (the row containing "Organization Name"). */
function findHeaderRow(rows: unknown[][]): number {
  for (let i = 0; i < rows.length; i++) {
    if (rows[i]?.some((c) => String(c ?? "").trim() === "Organization Name")) return i;
  }
  return -1;
}

function colIndex(header: unknown[], startsWith: string): number {
  return header.findIndex((c) => String(c ?? "").trim().toLowerCase().startsWith(startsWith.toLowerCase()));
}

function main() {
  const args = parseArgs();
  if (!args.file) {
    console.error("Missing --file <path-to-xlsx>");
    process.exit(1);
  }

  const wb = XLSX.read(readFileSync(args.file), { type: "buffer" });
  const companies = new Map<string, CompanyAgg>();
  const report = {
    sheets: [] as { sheet: string; rows: number }[],
    totalRows: 0,
    unmapped: new Map<string, number>(),
    oversizedCustomerLists: [] as { company: string; count: number }[],
  };

  for (const sheetName of COMPETITOR_SHEETS) {
    const ws = wb.Sheets[sheetName];
    if (!ws) continue;
    const rows = XLSX.utils.sheet_to_json<unknown[]>(ws, { header: 1, blankrows: false });
    const h = findHeaderRow(rows);
    if (h < 0) continue;
    const header = rows[h];

    const idx = {
      org: colIndex(header, "Organization Name"),
      web: colIndex(header, "Website"),
      portfolio: colIndex(header, "Their Product Portfolio"),
      competes: colIndex(header, "Which Components"),
      pricing: colIndex(header, "Pricing"),
      diff: colIndex(header, "Unique Differentiators"),
      weak: colIndex(header, "Areas of Inferiority"),
      customers: colIndex(header, "Known Customer"),
      social: colIndex(header, "Social Media"),
    };

    let sheetRows = 0;
    for (let r = h + 1; r < rows.length; r++) {
      const row = rows[r];
      const rawName = row?.[idx.org];
      if (!rawName || !String(rawName).trim()) continue;
      sheetRows++;
      report.totalRows++;

      const normalized = normalizeName(String(rawName));
      const website = idx.web >= 0 ? cleanDisplayName(row[idx.web] as string) || null : null;
      const domain = domainOf(website);

      // Merge across sheets by normalized name (falling back to domain).
      let key = normalized || (domain ?? `row-${sheetName}-${r}`);
      if (!companies.has(key) && domain) {
        const byDomain = [...companies.values()].find((c) => c.domain && c.domain === domain);
        if (byDomain) key = byDomain.normalized;
      }

      const agg: CompanyAgg =
        companies.get(key) ??
        {
          displayName: cleanDisplayName(String(rawName)),
          normalized,
          website,
          domain,
          productUrls: new Set(),
          pricingTexts: [],
          strengths: [],
          weaknesses: [],
          customers: new Set(),
          socials: [],
          internalProducts: new Set(),
          unmappedTokens: new Set(),
          importRefs: [],
        };
      if (!agg.website && website) { agg.website = website; agg.domain = domain; }

      agg.importRefs.push(`${sheetName}!Row${r + 1}`);
      extractUrls(row[idx.portfolio] as string).forEach((u) => agg.productUrls.add(u));

      // Competitive relationships: default from the sheet, plus mapped tokens.
      const defaultInternal = SHEET_TO_INTERNAL[sheetName];
      if (defaultInternal) agg.internalProducts.add(defaultInternal);
      for (const token of splitCompetesWith(row[idx.competes] as string)) {
        const { internal, raw } = mapCompetesWith(token);
        if (internal) agg.internalProducts.add(internal);
        else {
          agg.unmappedTokens.add(raw);
          report.unmapped.set(raw, (report.unmapped.get(raw) ?? 0) + 1);
        }
      }

      const priceText = idx.pricing >= 0 ? (row[idx.pricing] as string) : null;
      if (priceText && String(priceText).trim()) agg.pricingTexts.push(String(priceText));

      if (idx.diff >= 0 && row[idx.diff]) agg.strengths.push(String(row[idx.diff]).trim());
      if (idx.weak >= 0 && row[idx.weak]) agg.weaknesses.push(String(row[idx.weak]).trim());

      const custs = idx.customers >= 0 ? splitCustomers(row[idx.customers] as string) : [];
      if (custs.length > MAX_CUSTOMERS) {
        report.oversizedCustomerLists.push({ company: agg.displayName, count: custs.length });
        // Do not explode a clearly-scraped list into hundreds of rows.
      } else {
        custs.forEach((c) => agg.customers.add(c));
      }

      if (idx.social >= 0 && row[idx.social]) {
        extractUrls(row[idx.social] as string).forEach((u) => agg.socials.push(u));
      }

      companies.set(key, agg);
    }
    report.sheets.push({ sheet: sheetName, rows: sheetRows });
  }

  printReport(companies, report);

  if (args.dryRun) {
    console.log("\nDry run — no database writes.");
    return;
  }
  void loadIntoSupabase(companies, args);
}

function printReport(companies: Map<string, CompanyAgg>, report: any) {
  const rels = [...companies.values()].reduce((n, c) => n + c.internalProducts.size, 0);
  const products = [...companies.values()].reduce((n, c) => n + c.productUrls.size, 0);
  const customers = new Set<string>();
  companies.forEach((c) => c.customers.forEach((x) => customers.add(normalizeName(x))));

  console.log("=== Import report ===");
  for (const s of report.sheets) console.log(`  ${s.sheet.padEnd(16)} ${s.rows} rows`);
  console.log(`  ${"".padEnd(16)} ----`);
  console.log(`  raw competitor rows           : ${report.totalRows}`);
  console.log(`  unique companies (deduped)    : ${companies.size}`);
  console.log(`  merged duplicates             : ${report.totalRows - companies.size}`);
  console.log(`  product URLs extracted        : ${products}`);
  console.log(`  competitive relationships     : ${rels}`);
  console.log(`  distinct customers            : ${customers.size}`);
  console.log(`  internal products (portfolio) : ${INTERNAL_PRODUCTS.length}`);

  if (report.oversizedCustomerLists.length) {
    console.log(`\n  ⚠ oversized customer lists (flagged, not imported as rows):`);
    for (const o of report.oversizedCustomerLists) console.log(`      ${o.company}: ${o.count} names`);
  }
  const unmapped = [...report.unmapped.entries()].sort((a, b) => b[1] - a[1]);
  if (unmapped.length) {
    console.log(`\n  ⚠ unmapped "competes with" tokens (routed to review):`);
    for (const [tok, n] of unmapped.slice(0, 20)) console.log(`      ${String(n).padStart(3)}  ${tok}`);
    if (unmapped.length > 20) console.log(`      ... and ${unmapped.length - 20} more`);
  }
}

async function loadIntoSupabase(companies: Map<string, CompanyAgg>, args: Args) {
  const url = process.env.SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) {
    console.error("Set SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY for a real run.");
    process.exit(1);
  }
  const { createClient } = await import("@supabase/supabase-js");
  const db = createClient(url, key, { auth: { persistSession: false } });

  // Org (insert fires the per-org taxonomy + weights seed trigger).
  let { data: org } = await db.from("organizations").select("id").eq("slug", args.orgSlug).maybeSingle();
  if (!org) {
    const ins = await db.from("organizations").insert({ name: args.orgName, slug: args.orgSlug }).select("id").single();
    if (ins.error) throw ins.error;
    org = ins.data;
  }
  const orgId = org!.id as string;

  // Internal portfolio.
  const internalIds = new Map<string, string>();
  for (const name of INTERNAL_PRODUCTS) {
    const up = await db.from("internal_products").upsert(
      { organization_id: orgId, name }, { onConflict: "organization_id,name" }
    ).select("id,name").single();
    if (up.error) throw up.error;
    internalIds.set(name, up.data.id);
  }

  const now = new Date().toISOString();
  for (const c of companies.values()) {
    const socials = dedupeSocials(c.socials);
    const companyIns = await db.from("companies").upsert({
      organization_id: orgId,
      name: c.displayName,
      normalized_name: c.normalized,
      website_url: c.website,
      confidence_score: IMPORT_CONFIDENCE,
      intelligence_status: "pending_review",
      original_import_reference: c.importRefs.join("; "),
      first_observed_at: now,
      status: "active",
      ...socials,
    }, { onConflict: "organization_id,normalized_name" }).select("id").single();
    if (companyIns.error) { console.error("company", c.displayName, companyIns.error.message); continue; }
    const companyId = companyIns.data.id as string;

    // Strengths / weaknesses -> observations (positioning), kept as evidence notes.
    for (const [kind, list] of [["strength", c.strengths], ["weakness", c.weaknesses]] as const) {
      for (const text of list) {
        if (!text) continue;
        await db.from("observations").insert({
          organization_id: orgId, company_id: companyId, observation_type: "positioning",
          field_name: kind, observed_value_json: { kind, text },
          supporting_text: text, confidence_score: IMPORT_CONFIDENCE,
          extracted_by: "import", review_status: "pending",
        });
      }
    }

    // Products from portfolio URLs.
    for (const purl of c.productUrls) {
      const pname = purl.replace(/^https?:\/\//, "").replace(/\/$/, "").split("/").slice(0, 2).join("/");
      const prodIns = await db.from("products").upsert({
        organization_id: orgId, company_id: companyId, name: pname, normalized_name: normalizeName(pname),
        product_url: purl, confidence_score: IMPORT_CONFIDENCE, intelligence_status: "pending_review",
        original_import_reference: c.importRefs[0], first_observed_at: now,
      }, { onConflict: "organization_id,normalized_name" }).select("id").maybeSingle();
      if (prodIns.error || !prodIns.data) continue;

      // Pricing (raw + best-effort parse) at low confidence.
      for (const pt of c.pricingTexts) {
        const parsed = parsePrice(pt);
        if (!parsed) continue;
        await db.from("pricing_history").insert({
          organization_id: orgId, product_id: prodIns.data.id,
          price_min: parsed.priceMin, price_max: parsed.priceMax, currency: parsed.currency,
          raw_price_text: parsed.raw, confidence_score: IMPORT_CONFIDENCE, observed_at: now,
        });
        break; // one pricing snapshot per product from the seed
      }
    }

    // Competitive relationships.
    for (const internalName of c.internalProducts) {
      const internalId = internalIds.get(internalName);
      if (!internalId) continue;
      await db.from("competitive_relationships").insert({
        organization_id: orgId, competitor_company_id: companyId, internal_product_id: internalId,
        relationship_type: "adjacent", confidence_score: IMPORT_CONFIDENCE,
        notes: c.unmappedTokens.size ? `Unmapped source tokens: ${[...c.unmappedTokens].join(", ")}` : null,
        first_observed_at: now, active: true,
      });
    }

    // Customers.
    for (const custName of c.customers) {
      const cust = await db.from("customers").upsert(
        { organization_id: orgId, name: custName, normalized_name: normalizeName(custName) },
        { onConflict: "organization_id,normalized_name" }
      ).select("id").single();
      if (cust.error) continue;
      await db.from("company_customers").insert({
        organization_id: orgId, company_id: companyId, customer_id: cust.data.id,
        relationship_type: "unknown", confidence_score: IMPORT_CONFIDENCE, first_observed_at: now,
      });
    }
  }
  console.log(`Loaded ${companies.size} companies into org ${args.orgSlug}.`);
}

function dedupeSocials(urls: string[]) {
  const out: Record<string, string> = {};
  for (const u of urls) {
    const h = domainOf(u) ?? "";
    if (h.includes("linkedin")) out.linkedin_url = u;
    else if (h.includes("x.com") || h.includes("twitter")) out.x_url = u;
    else if (h.includes("youtube")) out.youtube_url = u;
    else if (h.includes("facebook")) out.facebook_url = u;
  }
  return out;
}

main();
