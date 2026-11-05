import { BROWSER_HEADERS } from "./headers.js";
import { cleanHtml, looksLikeChallenge } from "./clean.js";

export interface Fetched {
  ok: boolean;
  status: number;
  title: string | null;
  metaDescription: string | null;
  text: string;
  hash: string;
  error?: string;
  /** Which path produced this result — the plain HTTP fetch or the browser fallback. */
  method?: "http" | "browser";
}

/**
 * Fetch a URL and reduce it to clean, boilerplate-stripped text + a hash.
 * Tries a plain HTTP fetch first (fast, cheap). If that is blocked (403/429/503),
 * errors out, or returns a JS/anti-bot challenge page, it escalates to a real
 * headless browser via Playwright — unless INGEST_BROWSER_FALLBACK=0.
 */
export async function fetchAndClean(url: string, timeoutMs = 20000): Promise<Fetched> {
  const browserFallback = process.env.INGEST_BROWSER_FALLBACK !== "0";
  let httpResult: Fetched;

  try {
    const ctrl = new AbortController();
    const timer = setTimeout(() => ctrl.abort(), timeoutMs);
    const res = await fetch(url, {
      headers: BROWSER_HEADERS,
      redirect: "follow",
      signal: ctrl.signal,
    });
    clearTimeout(timer);
    const html = await res.text();
    const c = cleanHtml(html);
    const challenged = looksLikeChallenge(html, c.title);
    const ok = res.ok && !challenged;

    if (ok) {
      return { ok, status: res.status, ...c, method: "http" };
    }
    httpResult = {
      ok,
      status: res.status,
      ...c,
      method: "http",
      error: challenged ? "JS/anti-bot challenge page" : `HTTP ${res.status}`,
    };
  } catch (e: unknown) {
    httpResult = {
      ok: false,
      status: 0,
      title: null,
      metaDescription: null,
      text: "",
      hash: "",
      method: "http",
      error: e instanceof Error ? e.message : String(e),
    };
  }

  if (!browserFallback) return httpResult;

  // Escalate blocked / challenged / errored fetches to a real browser.
  try {
    const { fetchWithBrowser } = await import("./browserFetch.js");
    const b = await fetchWithBrowser(url, Math.max(timeoutMs, 30000));
    return b.ok ? b : httpResult;
  } catch {
    return httpResult;
  }
}
