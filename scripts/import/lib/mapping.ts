// Maps the workbook's sheets and its free-text "competes with" column onto the
// organization's internal portfolio. The compete-with cell is inconsistent
// (casing, "National Events" vs "CRA Events", stray sentences), so anything not
// recognized is returned as unmapped and surfaced in the import report rather
// than guessed at.

/** Competitor sheets to import (everything else is skipped or handled apart). */
export const COMPETITOR_SHEETS = [
  "Connect",
  "Communities",
  "Events",
  "CyberRisk TV",
  "CyberCept",
  "Founder Stories",
  "Mythbusters",
  "Podcasts",
];

/** Sheets that are NOT row-per-competitor competitor lists. */
export const SKIP_SHEETS = ["Timeline"];
export const MATRIX_SHEETS = ["Pricing Breakdown"]; // handled by a separate path (deferred)

/**
 * The internal portfolio derived from the seed sheet. These are the
 * organization's own offerings, supplied here by the administrator via the
 * spreadsheet — so it is legitimate to create them as internal_products.
 */
export const INTERNAL_PRODUCTS = [
  "Connect",
  "Communities",
  "Events",
  "CyberRisk TV",
  "CyberCept",
  "Founder Stories",
  "Podcasts",
  "Mythbusters",
  "Webinars",
  "Research",
  "Content",
  "ABM",
];

/** Sheet name -> the internal product its competitors challenge by default. */
export const SHEET_TO_INTERNAL: Record<string, string> = {
  Connect: "Connect",
  Communities: "Communities",
  Events: "Events",
  "CyberRisk TV": "CyberRisk TV",
  CyberCept: "CyberCept",
  "Founder Stories": "Founder Stories",
  Podcasts: "Podcasts",
  Mythbusters: "Mythbusters",
};

// Lowercased token -> canonical internal product name.
const COMPETES_WITH_MAP: Record<string, string> = {
  "cra connect": "Connect",
  connect: "Connect",
  "cra communities": "Communities",
  "cra community": "Communities",
  communities: "Communities",
  "ciso membership": "Communities",
  "ciso relations": "Communities",
  "cra events": "Events",
  events: "Events",
  "national events": "Events",
  "regional events": "Events",
  "virtual events": "Events",
  "virtual conferences": "Events",
  "official cybersecurity summit": "Events",
  "official cybersecurity summits": "Events",
  "ciso dinners": "Events",
  "ciso events": "Events",
  "cyberrisk tv": "CyberRisk TV",
  cybercept: "CyberCept",
  "founder stories": "Founder Stories",
  "ciso stories": "Founder Stories",
  interviews: "Founder Stories",
  podcasts: "Podcasts",
  webinars: "Webinars",
  webcasts: "Webinars",
  research: "Research",
  content: "Content",
  "custom content": "Content",
  newsletters: "Content",
  enewsletters: "Content",
  abm: "ABM",
  "digital ads": "ABM",
  "integrated marketing programs": "ABM",
};

export interface MapResult {
  internal: string | null;
  raw: string;
}

/** Map one compete-with token to a canonical internal product, or null. */
export function mapCompetesWith(token: string): MapResult {
  const key = token.trim().toLowerCase().replace(/\s+/g, " ").replace(/[.:]+$/, "");
  return { internal: COMPETES_WITH_MAP[key] ?? null, raw: token.trim() };
}

/** Split a compete-with cell into individual tokens. */
export function splitCompetesWith(text: string | null | undefined): string[] {
  if (!text) return [];
  return String(text)
    .split(/\r?\n|,/)
    .map((s) => s.trim())
    .filter((s) => s.length > 0 && s.length < 60); // drop leaked prose sentences
}
