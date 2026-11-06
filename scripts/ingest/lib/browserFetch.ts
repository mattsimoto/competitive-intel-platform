// Anti-detect browser fallback using Camoufox (a hardened Firefox) driven by
// Playwright. Plain headless Chromium is detected and blocked by Cloudflare-class
// bot management ("Just a moment…" 403), which is why this uses Camoufox: it
// presents a genuine, non-automated browser fingerprint and clears the passive JS
// challenges those sites serve.
//
// Two layers of blocking exist: (1) browser/headless fingerprinting — Camoufox
// handles this; (2) datacenter-IP reputation — for the hardest sites, set
// CAMOUFOX_PROXY to a residential/ISP proxy (http(s)://user:pass@host:port) and the
// browser egresses through it. Without a proxy this still clears most sites, but a
// few aggressive ones may remain blocked from a datacenter IP.
//
// Requires `camoufox-js` + `playwright-core`, and the Camoufox browser downloaded
// via `npx camoufox-js fetch` (the ingest workflow does this and caches it). If any
// of that is missing, this returns a normal failure and the caller keeps the HTTP
// result.
import { cleanHtml, looksLikeChallenge } from "./clean.js";
import type { Fetched } from "./fetch.js";

function proxyFromEnv() {
  const raw = process.env.CAMOUFOX_PROXY;
  if (!raw) return undefined;
  try {
    const u = new URL(raw);
    return {
      server: `${u.protocol}//${u.host}`,
      username: u.username ? decodeURIComponent(u.username) : undefined,
      password: u.password ? decodeURIComponent(u.password) : undefined,
    };
  } catch {
    return undefined;
  }
}

export async function fetchWithBrowser(url: string, timeoutMs = 45000): Promise<Fetched> {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  let browser: any;
  try {
    // Non-literal specifiers so the type-checker doesn't require these (native)
    // packages to be installed in environments that never run the fallback.
    const camoufoxMod = "camoufox-js";
    const pwMod = "playwright-core";
    const { launchOptions } = (await import(camoufoxMod)) as any;
    const { firefox } = (await import(pwMod)) as any;

    const proxy = proxyFromEnv();
    const headless =
      process.env.CAMOUFOX_HEADLESS === "virtual" ? ("virtual" as const) : true;

    const opts = await launchOptions({
      headless,
      humanize: true,
      block_images: true,
      ...(proxy ? { proxy, geoip: process.env.CAMOUFOX_GEOIP === "1" } : {}),
    });

    browser = await firefox.launch(opts as any);
    const context = await browser.newContext();
    const page = await context.newPage();
    const resp = await page.goto(url, { waitUntil: "domcontentloaded", timeout: timeoutMs });
    // Give an interstitial challenge time to clear, then let the page settle.
    await page.waitForTimeout(3500);
    try {
      await page.waitForLoadState("networkidle", { timeout: 6000 });
    } catch {
      /* best-effort */
    }

    const status: number = resp?.status() ?? 0;
    const html: string = await page.content();
    const c = cleanHtml(html);
    const challenged = looksLikeChallenge(html, c.title);
    const ok = status > 0 && status < 400 && c.text.length > 0 && !challenged;
    return {
      ok,
      status,
      title: c.title,
      metaDescription: c.metaDescription,
      text: c.text,
      hash: c.hash,
      method: "browser",
      error: ok
        ? undefined
        : challenged
          ? "anti-bot challenge not cleared (try CAMOUFOX_PROXY)"
          : `browser fetch status ${status}`,
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
