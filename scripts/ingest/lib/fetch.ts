import { createHash } from "node:crypto";
import { convert } from "html-to-text";

export interface Fetched {
  ok: boolean;
  status: number;
  title: string | null;
  metaDescription: string | null;
  text: string;
  hash: string;
  error?: string;
}

// Most competitor sites sit behind a WAF (Cloudflare/Akamai/Imperva) that returns
// 403 to clients that don't look like a real browser — a "Bot" user-agent or a
// request missing the headers a browser always sends is enough to be blocked.
// Present a current-Chrome header set so public pages fetch like a normal visit.
// Override the UA with INGEST_USER_AGENT if you'd rather identify the crawler
// (expect more 403s from protected sites if you do).
const DEFAULT_UA =
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36";

const BROWSER_HEADERS: Record<string, string> = {
  "user-agent": process.env.INGEST_USER_AGENT || DEFAULT_UA,
  accept:
    "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
  "accept-language": "en-US,en;q=0.9",
  "upgrade-insecure-requests": "1",
  "sec-fetch-dest": "document",
  "sec-fetch-mode": "navigate",
  "sec-fetch-site": "none",
  "sec-fetch-user": "?1",
  "cache-control": "max-age=0",
};

/** Fetch a URL and reduce it to clean, boilerplate-stripped text + a hash. */
export async function fetchAndClean(url: string, timeoutMs = 20000): Promise<Fetched> {
  try {
    const ctrl = new AbortController();
    const timer = setTimeout(() => ctrl.abort(), timeoutMs);
    // Note: accept-encoding is intentionally left unset so Node's fetch manages
    // compression and decompresses the body for us (setting it manually would
    // hand back raw gzip/brotli bytes).
    const res = await fetch(url, {
      headers: BROWSER_HEADERS,
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
    })
      .replace(/\n{3,}/g, "\n\n")
      .trim();

    const hash = createHash("sha256").update(text).digest("hex");
    return { ok: res.ok, status: res.status, title, metaDescription, text, hash };
  } catch (e: unknown) {
    return { ok: false, status: 0, title: null, metaDescription: null, text: "", hash: "", error: e instanceof Error ? e.message : String(e) };
  }
}
