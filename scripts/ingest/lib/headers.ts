// Browser-like request headers shared by the HTTP fetch and the Playwright fallback.
// A "Bot" user-agent or a request missing the headers a browser always sends gets a
// 403 from most WAFs (Cloudflare/Akamai/Imperva). Override the UA with
// INGEST_USER_AGENT to identify the crawler (expect more 403s from protected sites).
export const DEFAULT_UA =
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36";

export function userAgent(): string {
  return process.env.INGEST_USER_AGENT || DEFAULT_UA;
}

// accept-encoding is intentionally unset so Node's fetch manages compression and
// hands back a decoded body.
export const BROWSER_HEADERS: Record<string, string> = {
  "user-agent": userAgent(),
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
