// Flexible competitor-list parsing for the Add / Import page. Reads any xlsx or
// csv, finds the column most likely to hold competitor names, and extracts rows.
// No AI — pure heuristics, so it works without the Groq key.
import * as XLSX from "xlsx";

const LEGAL = /\b(inc|inc\.|llc|l\.l\.c|ltd|ltd\.|limited|co|co\.|corp|corp\.|corporation|company|gmbh|sa|s\.a|plc|group)\b/gi;

/** Canonical key for deduping company names — matches the seed importer. */
export function normalizeName(raw: string | null | undefined): string {
  if (!raw) return "";
  const first = String(raw).split(/\r?\n/)[0];
  return first
    .toLowerCase()
    .replace(/&/g, " and ")
    .replace(LEGAL, " ")
    .replace(/[^a-z0-9 ]+/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

const NAME_HINTS = ["company", "organization", "organisation", "competitor", "firm", "vendor", "account", "name", "brand", "supplier"];
const SITE_HINTS = ["website", "url", "domain", "site", "web"];
const CITY_HINTS = ["city", "town"];
const STATE_HINTS = ["state", "province", "region", "country"];

function headerMatch(header: string, hints: string[]): boolean {
  const h = header.toLowerCase().trim();
  return hints.some((x) => h.includes(x));
}

export interface ParsedImport {
  headers: string[];
  nameColumn: string | null;
  siteColumn: string | null;
  cityColumn: string | null;
  stateColumn: string | null;
  rows: { name: string; website: string | null; location: string | null }[];
  totalRows: number;
}

/** Parse a workbook/csv buffer and extract competitor rows.
 *  overrideNameHeader lets the caller force which column is the name column. */
export function parseCompetitorSheet(buf: Buffer, overrideNameHeader?: string): ParsedImport {
  const wb = XLSX.read(buf, { type: "buffer" });
  // Use the first sheet that has data.
  let grid: unknown[][] = [];
  for (const sn of wb.SheetNames) {
    const g = XLSX.utils.sheet_to_json<unknown[]>(wb.Sheets[sn], { header: 1, blankrows: false });
    if (g.length > 1) { grid = g; break; }
    if (g.length && !grid.length) grid = g;
  }
  if (!grid.length) return { headers: [], nameColumn: null, siteColumn: null, cityColumn: null, stateColumn: null, rows: [], totalRows: 0 };

  // Header row = the first row whose cells are mostly short text.
  const headerRow = grid[0].map((c) => String(c ?? "").trim());
  const dataRows = grid.slice(1);

  const col = (hints: string[]) => headerRow.findIndex((h) => headerMatch(h, hints));
  let nameIdx = overrideNameHeader
    ? headerRow.findIndex((h) => h.toLowerCase() === overrideNameHeader.toLowerCase().trim())
    : col(NAME_HINTS);

  // Fallback: no header hint matched — pick the column with the most distinct short text values.
  if (nameIdx < 0) {
    let best = -1, bestScore = -1;
    for (let c = 0; c < headerRow.length; c++) {
      const vals = dataRows.map((r) => String(r[c] ?? "").trim()).filter((v) => v && v.length < 60);
      const distinct = new Set(vals.map((v) => v.toLowerCase())).size;
      const score = distinct - vals.filter((v) => /^https?:\/\//i.test(v) || v.includes("@")).length;
      if (score > bestScore) { bestScore = score; best = c; }
    }
    nameIdx = best;
  }

  const siteIdx = col(SITE_HINTS);
  const cityIdx = col(CITY_HINTS);
  const stateIdx = col(STATE_HINTS);

  const rows: ParsedImport["rows"] = [];
  for (const r of dataRows) {
    const name = nameIdx >= 0 ? String(r[nameIdx] ?? "").trim() : "";
    if (!name) continue;
    const website = siteIdx >= 0 && r[siteIdx] ? String(r[siteIdx]).trim() : null;
    const city = cityIdx >= 0 && r[cityIdx] ? String(r[cityIdx]).trim().replace(/,\s*$/, "") : "";
    const state = stateIdx >= 0 && r[stateIdx] ? String(r[stateIdx]).trim() : "";
    const location = [city, state].filter(Boolean).join(", ") || null;
    rows.push({ name, website, location });
  }

  return {
    headers: headerRow,
    nameColumn: nameIdx >= 0 ? headerRow[nameIdx] : null,
    siteColumn: siteIdx >= 0 ? headerRow[siteIdx] : null,
    cityColumn: cityIdx >= 0 ? headerRow[cityIdx] : null,
    stateColumn: stateIdx >= 0 ? headerRow[stateIdx] : null,
    rows,
    totalRows: rows.length,
  };
}
