// Server-side, on-demand page fetch for the "Fetch now" button. No API key —
// pure retrieval + cleaning + a price-suggestion helper for pricing pages.
import { createHash } from "node:crypto";
import { convert } from "html-to-text";

export interface Snapshot {
  ok: boolean;
  status: number;
  title: string | null;
  metaDescription: string | null;
  text: string;
  hash: string;
  error?: string;
}

export async function fetchPage(url: string, timeoutMs = 15000): Promise<Snapshot> {
  try {
    const ctrl = new AbortController();
    const timer = setTimeout(() => ctrl.abort(), timeoutMs);
    const res = await fetch(url, {
      headers: { "user-agent": "CompetitiveIntelBot/0.1 (+manual-fetch)" },
      redirect: "follow",
      signal: ctrl.signal,
    });
    clearTimeout(timer);
    const html = await res.text();
    const title = (html.match(/<title[^>]*>([^<]*)<\/title>/i)?.[1] ?? "").trim() || null;
    const metaDescription = (
      html.match(/<meta[^>]+name=["']description["'][^>]+content=["']([^"']*)["']/i)?.[1] ??
      html.match(/<meta[^>]+content=["']([^"']*)["'][^>]+name=["']description["']/i)?.[1] ??
      html.match(/<meta[^>]+property=["']og:description["'][^>]+content=["']([^"']*)["']/i)?.[1] ??
      ""
    ).trim() || null;
    const text = convert(html, {
      wordwrap: false,
      selectors: [
        { selector: "nav", format: "skip" },
        { selector: "header", format: "skip" },
        { selector: "footer", format: "skip" },
        { selector: "script", format: "skip" },
        { selector: "style", format: "skip" },
        { selector: "img", format: "skip" },
        { selector: "a", options: { ignoreHref: true } },
      ],
    }).replace(/\n{3,}/g, "\n\n").trim();
    const hash = createHash("sha256").update(text).digest("hex");
    return { ok: res.ok, status: res.status, title, metaDescription, text, hash };
  } catch (e: unknown) {
    return { ok: false, status: 0, title: null, metaDescription: null, text: "", hash: "", error: e instanceof Error ? e.message : String(e) };
  }
}

/** Heuristic: pull plausible $ amounts from cleaned text for the analyst to confirm. */
export function suggestPrices(text: string): string[] {
  const found = text.match(/\$\s?\d{1,3}(?:[,\d]{0,12})(?:\.\d{1,2})?/g) ?? [];
  const uniq = Array.from(new Set(found.map((s) => s.replace(/\s/g, ""))));
  return uniq.filter((s) => Number(s.replace(/[$,]/g, "")) > 0).slice(0, 24);
}
