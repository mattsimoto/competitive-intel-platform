// Normalization + parsing helpers for the seed-spreadsheet importer.

const LEGAL_SUFFIXES =
  /\b(inc|inc\.|llc|l\.l\.c|ltd|ltd\.|limited|co|co\.|corp|corp\.|corporation|company|gmbh|sa|s\.a|plc|group)\b/gi;

/** Canonical key for deduping company / customer names across sheets. */
export function normalizeName(raw: string | null | undefined): string {
  if (!raw) return "";
  // Some cells carry a name plus a subtitle on a second line — keep line one.
  const firstLine = String(raw).split(/\r?\n/)[0];
  return firstLine
    .toLowerCase()
    .replace(/&/g, " and ")
    .replace(LEGAL_SUFFIXES, " ")
    .replace(/[^a-z0-9 ]+/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

/** Human-facing display name: first line, trimmed. */
export function cleanDisplayName(raw: string | null | undefined): string {
  if (!raw) return "";
  return String(raw).split(/\r?\n/)[0].trim();
}

/** Lowercased registrable-ish host, used as a secondary dedup key. */
export function domainOf(url: string | null | undefined): string | null {
  if (!url) return null;
  const first = String(url).split(/\r?\n/)[0].trim();
  try {
    const u = new URL(first.startsWith("http") ? first : `https://${first}`);
    return u.hostname.replace(/^www\./, "").toLowerCase();
  } catch {
    return null;
  }
}

/** Pull the http(s) URLs out of a multi-line portfolio cell. */
export function extractUrls(text: string | null | undefined): string[] {
  if (!text) return [];
  const matches = String(text).match(/https?:\/\/[^\s)]+/gi) ?? [];
  return Array.from(new Set(matches.map((u) => u.replace(/[.,;]+$/, ""))));
}

/** Split a known-customers cell into individual names. */
export function splitCustomers(text: string | null | undefined): string[] {
  if (!text) return [];
  const parts = String(text)
    .split(/\r?\n|,|;|\u2022/)
    .map((s) => s.trim())
    .filter((s) => s.length > 1 && !/^https?:\/\//i.test(s));
  return Array.from(new Set(parts));
}

export interface ParsedPrice {
  priceMin: number | null;
  priceMax: number | null;
  currency: string;
  raw: string;
  parsed: boolean;
}

/**
 * Best-effort price parse from free text. Pulls $ amounts; if several appear,
 * uses the min and max. Anything unparseable is kept as raw text at low
 * confidence — we never invent a number.
 */
export function parsePrice(text: string | null | undefined): ParsedPrice | null {
  if (!text || !String(text).trim()) return null;
  const raw = String(text).trim();
  const amounts: number[] = [];
  const re = /\$\s?([\d]{1,3}(?:[,\d]{0,12})(?:\.\d{1,2})?)/g;
  let m: RegExpExecArray | null;
  while ((m = re.exec(raw)) !== null) {
    const n = Number(m[1].replace(/,/g, ""));
    if (!Number.isNaN(n) && n > 0) amounts.push(n);
  }
  if (amounts.length === 0) {
    return { priceMin: null, priceMax: null, currency: "USD", raw, parsed: false };
  }
  return {
    priceMin: Math.min(...amounts),
    priceMax: Math.max(...amounts),
    currency: "USD",
    raw,
    parsed: true,
  };
}
