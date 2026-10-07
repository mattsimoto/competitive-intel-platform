// Server-side news retrieval for Product News briefs. Pulls reputable
// cybersecurity news feeds (no API key needed) and returns dated, linked items.

const FEEDS: { source: string; url: string }[] = [
  { source: "The Hacker News", url: "https://feeds.feedburner.com/TheHackersNews" },
  { source: "BleepingComputer", url: "https://www.bleepingcomputer.com/feed/" },
  { source: "Dark Reading", url: "https://www.darkreading.com/rss.xml" },
  { source: "SecurityWeek", url: "https://www.securityweek.com/feed/" },
  { source: "Krebs on Security", url: "https://krebsonsecurity.com/feed/" },
];

export interface NewsItem {
  source: string;
  title: string;
  link: string;
  date: string | null;
  pubMs: number;
}

function decodeEntities(s: string): string {
  return s
    .replace(/&#x([0-9a-f]+);/gi, (_, h) => String.fromCodePoint(parseInt(h, 16)))
    .replace(/&#(\d+);/g, (_, d) => String.fromCodePoint(parseInt(d, 10)))
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/&(?:apos|#39);/g, "'")
    .replace(/&nbsp;/g, " ")
    .trim();
}

function parseFeed(source: string, xml: string): NewsItem[] {
  const blocks = xml.match(/<item[\s\S]*?<\/item>/gi) || xml.match(/<entry[\s\S]*?<\/entry>/gi) || [];
  return blocks.map((b) => {
    const title = decodeEntities(b.match(/<title[^>]*>(?:<!\[CDATA\[)?([\s\S]*?)(?:\]\]>)?<\/title>/i)?.[1] ?? "");
    const link = decodeEntities(
      b.match(/<link[^>]*>(?:<!\[CDATA\[)?([\s\S]*?)(?:\]\]>)?<\/link>/i)?.[1] ??
      b.match(/<link[^>]+href=["']([^"']+)["']/i)?.[1] ?? ""
    );
    const rawDate = (b.match(/<(?:pubDate|published|updated)[^>]*>([\s\S]*?)<\//i)?.[1] ?? "").trim();
    const pubMs = rawDate ? Date.parse(rawDate) || 0 : 0;
    return { source, title, link, date: rawDate || null, pubMs };
  }).filter((i) => i.title && i.link);
}

/** Pull the latest items across all feeds, deduped and sorted newest-first. */
export async function fetchLatestNews(limit = 20): Promise<NewsItem[]> {
  if (process.env.ENABLE_NEWS_FETCH === "false") return [];
  const results = await Promise.all(
    FEEDS.map(async (f) => {
      try {
        const ctrl = new AbortController();
        const t = setTimeout(() => ctrl.abort(), 12000);
        const res = await fetch(f.url, { headers: { "user-agent": "CompetitiveIntelBot/0.1 (+news)" }, signal: ctrl.signal });
        clearTimeout(t);
        if (!res.ok) return [];
        return parseFeed(f.source, await res.text());
      } catch {
        return [];
      }
    })
  );
  const all = results.flat();
  const seen = new Set<string>();
  const deduped = all.filter((i) => {
    const key = i.title.toLowerCase().slice(0, 60);
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });
  deduped.sort((a, b) => b.pubMs - a.pubMs);
  return deduped.slice(0, limit);
}

export function headlinesMarkdown(items: NewsItem[]): string {
  const fmt = (ms: number) => (ms ? new Date(ms).toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" }) : "—");
  const lines = items.map((i) => `- [${i.title}](${i.link}) — ${i.source} · ${fmt(i.pubMs)}`);
  return `_Latest cybersecurity developments pulled from reputable feeds. Analysis (impact ranking, GTM implications, confirmed vs. inference) activates when the AI key is added._\n\n${lines.join("\n")}`;
}

export function sourcesForPrompt(items: NewsItem[]): string {
  return items
    .map((i, n) => `${n + 1}. ${i.title} — ${i.source} (${i.date ?? "undated"})\n   ${i.link}`)
    .join("\n");
}

