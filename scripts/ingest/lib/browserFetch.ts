// Playwright fallback: render a URL in a real headless Chromium so JS-gated and
// challenge-protected pages (Cloudflare, DataDome, Akamai) resolve to real content.
// Used only when the plain HTTP fetch is blocked/challenged, so the cost (a few
// seconds per page) is bounded to the sites that actually need it.
//
// Requires `playwright` + a Chromium binary. The ingest workflow installs it with
// `npx playwright install --with-deps chromium`. If either is missing this returns
// a normal failure and the caller keeps the HTTP result.
import { cleanHtml } from "./clean.js";
import { userAgent } from "./headers.js";
import type { Fetched } from "./fetch.js";

export async function fetchWithBrowser(url: string, timeoutMs = 30000): Promise<Fetched> {
  // Non-literal specifier so the type-checker doesn't require playwright to be
  // installed in environments (like the web app) that never call this.
  const mod = "playwright";
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  let browser: any;
  try {
    const { chromium } = (await import(mod)) as any;
    browser = await chromium.launch({
      headless: true,
      args: ["--no-sandbox", "--disable-blink-features=AutomationControlled"],
    });
    const context = await browser.newContext({
      userAgent: userAgent(),
      locale: "en-US",
      viewport: { width: 1366, height: 900 },
    });
    const page = await context.newPage();
    const resp = await page.goto(url, { waitUntil: "domcontentloaded", timeout: timeoutMs });
    // Give an interstitial challenge a moment to clear, then let the page settle.
    await page.waitForTimeout(2500);
    try {
      await page.waitForLoadState("networkidle", { timeout: 5000 });
    } catch {
      /* networkidle is best-effort */
    }
    const status: number = resp?.status() ?? 0;
    const html: string = await page.content();
    const c = cleanHtml(html);
    const ok = status > 0 && status < 400 && c.text.length > 0;
    return {
      ok,
      status,
      title: c.title,
      metaDescription: c.metaDescription,
      text: c.text,
      hash: c.hash,
      method: "browser",
      error: ok ? undefined : `browser fetch status ${status}`,
    };
  } catch (e: unknown) {
    return {
      ok: false,
      status: 0,
      title: null,
      metaDescription: null,
      text: "",
      hash: "",
      method: "browser",
      error: e instanceof Error ? e.message : String(e),
    };
  } finally {
    await browser?.close().catch(() => {});
  }
}
