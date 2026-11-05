// HTML -> clean text + hash, plus detection of JS/anti-bot challenge pages.
// Shared by the HTTP fetch and the Playwright fallback so both produce identical output.
import { createHash } from "node:crypto";
import { convert } from "html-to-text";

export interface Cleaned {
  title: string | null;
  metaDescription: string | null;
  text: string;
  hash: string;
}

export function cleanHtml(html: string): Cleaned {
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
  return { title, metaDescription, text, hash };
}

// Signatures of interstitial challenge/anti-bot pages that return real content only
// after JavaScript runs. When one of these is served (often with a 200), the HTTP
// fetch has nothing useful and we should escalate to the browser fallback.
const CHALLENGE_SIGNS = [
  "just a moment",
  "checking your browser",
  "cf-browser-verification",
  "cf-chl-",
  "enable javascript and cookies to continue",
  "attention required",
  "captcha-delivery",
  "px-captcha",
  "_incapsula_",
  "please verify you are a human",
  "verifying you are human",
  "ddos protection by",
];

export function looksLikeChallenge(html: string, title: string | null): boolean {
  const hay = ((title ?? "") + " " + html.slice(0, 6000)).toLowerCase();
  return CHALLENGE_SIGNS.some((s) => hay.includes(s));
}
