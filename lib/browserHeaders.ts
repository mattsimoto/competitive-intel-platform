// Shared browser-like request headers for server-side page/feed fetches.
// Many competitor sites sit behind a WAF (Cloudflare/Akamai/Imperva) that returns
// 403 to clients that don't look like a real browser — a "Bot" user-agent or a
// request missing the headers a browser always sends is enough to be blocked.
// Mirrors scripts/ingest/lib/fetch.ts, which keeps its own copy because that
// crawler is a separate package and can't import from the app.
//
// Override the UA with INGEST_USER_AGENT if you'd rather identify the crawler
// (expect more 403s from protected sites if you do).
// accept-encoding is intentionally left unset so Node's fetch manages compression
// and hands back a decoded body.

const DEFAULT_UA =
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36";

const DOC_ACCEPT =
  "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8";

/** Accept header tuned for RSS/Atom feed endpoints. */
export const FEED_ACCEPT =
  "application/rss+xml,application/atom+xml,application/xml;q=0.9,text/xml;q=0.8,*/*;q=0.7";

export function browserHeaders(accept: string = DOC_ACCEPT): Record<string, string> {
  return {
    "user-agent": process.env.INGEST_USER_AGENT || DEFAULT_UA,
    accept,
    "accept-language": "en-US,en;q=0.9",
    "upgrade-insecure-requests": "1",
    "sec-fetch-dest": "document",
    "sec-fetch-mode": "navigate",
    "sec-fetch-site": "none",
    "sec-fetch-user": "?1",
    "cache-control": "max-age=0",
  };
}
