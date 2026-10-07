import "server-only";
import { lookup } from "node:dns/promises";
import { isIP } from "node:net";
import { get as httpGet } from "node:http";
import { get as httpsGet } from "node:https";
import { createHash } from "node:crypto";

export function isPublicIPv4(address: string): boolean {
  if (isIP(address) !== 4) return false;
  const [a, b] = address.split(".").map(Number);
  return !(a === 0 || a === 10 || a === 127 || a >= 224 ||
    (a === 100 && b >= 64 && b <= 127) || (a === 169 && b === 254) ||
    (a === 172 && b >= 16 && b <= 31) || (a === 192 && [0, 168].includes(b)) ||
    (a === 198 && [18, 19, 51].includes(b)) || (a === 203 && b === 0));
}

export function cleanHTML(html: string): string {
  const entities: Record<string, string> = { amp: "&", lt: "<", gt: ">", quot: '"', apos: "'", nbsp: " ", ndash: "–", mdash: "—", rsquo: "’", lsquo: "‘", rdquo: "”", ldquo: "“" };
  return html.replace(/<!--[^]*?-->/g, " ")
    .replace(/<(script|style|nav|header|footer|noscript|svg)\b[^>]*>[^]*?<\/\1\s*>/gi, " ")
    .replace(/<[^>]+>/g, " ")
    .replace(/&(#x[0-9a-f]+|#\d+|[a-z]+);/gi, (match, entity: string) => {
      if (!entity.startsWith("#")) return entities[entity.toLowerCase()] ?? match;
      const code = entity[1].toLowerCase() === "x" ? parseInt(entity.slice(2), 16) : Number(entity.slice(1));
      return code > 0 && code <= 0x10ffff ? String.fromCodePoint(code) : " ";
    }).replace(/\s+/g, " ").trim();
}

/** Resolve and pin a public address; revalidate every redirect. Never forward credentials. */
export async function fetchPage(rawURL: string) {
  const signal = AbortSignal.timeout(10000);
  let url = new URL(rawURL);
  for (let redirect = 0; redirect <= 3; redirect++) {
    if (!["http:", "https:"].includes(url.protocol) || url.username || url.password ||
      (url.port && !["80", "443"].includes(url.port))) throw new Error("Only public HTTP/HTTPS sources are supported.");
    const hostname = url.hostname;
    const addresses = isIP(hostname) ? [{ address: hostname, family: isIP(hostname) }] :
      await lookup(hostname, { all: true, family: 4 });
    if (!addresses.length || addresses.some(a => !isPublicIPv4(a.address))) throw new Error("This source does not resolve to a public website.");
    signal.throwIfAborted();
    const result = await new Promise<{ status: number; location?: string; html: string; contentType: string }>((resolve, reject) => {
      const get = url.protocol === "https:" ? httpsGet : httpGet;
      const req = get(url, {
        signal, agent: false, family: 4,
        headers: { "user-agent": "CompetitiveIntelBot/0.2", accept: "text/html,text/plain", "accept-encoding": "identity" },
        lookup: (_host, _options, callback) => callback(null, addresses[0].address, 4),
      }, res => {
        const status = res.statusCode ?? 0;
        if (status >= 300 && status < 400 && res.headers.location) {
          res.resume(); resolve({ status, location: res.headers.location, html: "", contentType: "" }); return;
        }
        let size = 0;
        const chunks: Buffer[] = [];
        res.on("data", (chunk: Buffer) => {
          size += chunk.length;
          if (size > 1500000) res.destroy(new Error("The source page is too large."));
          else chunks.push(chunk);
        });
        res.on("error", reject);
        res.on("end", () => resolve({ status, html: Buffer.concat(chunks).toString("utf8"), contentType: res.headers["content-type"] ?? "" }));
      });
      req.on("error", reject);
    });
    if (result.location) { url = new URL(result.location, url); continue; }
    if (result.status < 200 || result.status >= 300) throw new Error(`The source returned HTTP ${result.status}.`);
    if (!/text\/(html|plain)|application\/xhtml/i.test(result.contentType)) throw new Error("The source is not a readable web page.");
    const text = cleanHTML(result.html).slice(0, 50000);
    if (text.length < 150 || /^(just a moment|access denied|verify you are human)/i.test(text)) throw new Error("The source is blocked or has too little readable text.");
    return { url: url.href, text, title: cleanHTML(result.html.match(/<title[^>]*>([^]*?)<\/title>/i)?.[1] ?? "") || null,
      hash: createHash("sha256").update(text).digest("hex"), fetchedAt: new Date().toISOString() };
  }
  throw new Error("The source redirected too many times.");
}
