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

/** Fetch a URL and reduce it to clean, boilerplate-stripped text + a hash. */
export async function fetchAndClean(url: string, timeoutMs = 20000): Promise<Fetched> {
  try {
    const ctrl = new AbortController();
    const timer = setTimeout(() => ctrl.abort(), timeoutMs);
    const res = await fetch(url, {
      headers: { "user-agent": "CompetitiveIntelBot/0.1 (+monitoring)" },
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
