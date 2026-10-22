// On-demand AI enrichment via the shared LLM (Groq). Returns null when no key
// is set or parsing fails — the caller then does nothing (safe no-op).
import { callLLM } from "@/lib/llm";

export interface Enrichment {
  description?: string | null;
  company_type?: string | null;
  industry?: string | null;
  headquarters?: string | null;
  topics?: string[];
  products?: { name: string; price?: string | null }[];
  events?: string[];
  customers?: string[];
}

const SYSTEM =
  "You are a competitive intelligence analyst. From the supplied web page content for one company, extract ONLY facts explicitly supported by the text. Respond with a single JSON object (no markdown, no prose) with these keys: " +
  "description (1-2 factual sentences, no marketing language), " +
  "company_type (one of: Media, Research, Community, Events, Marketing Services, Analyst, Training, Software, Agency, Association; else null), " +
  "industry (short phrase, e.g. 'Cybersecurity media'; else null), " +
  "headquarters (City, Country; else null), " +
  "topics (array of short topic strings the company covers), " +
  "products (array of {name, price}; price as written or null), " +
  "events (array of event names), " +
  "customers (array of named customers). " +
  "Use null or [] when unsupported. Never invent.";

export async function enrichFromText(companyName: string, text: string): Promise<Enrichment | null> {
  const raw = await callLLM({
    system: SYSTEM,
    user: `Company: ${companyName}\n\nPage content:\n${text.slice(0, 16000)}`,
    maxTokens: 1200,
    json: true,
  });
  if (!raw) return null;
  try {
    const json = raw.replace(/^```(?:json)?\s*/i, "").replace(/```\s*$/i, "").trim();
    return JSON.parse(json) as Enrichment;
  } catch {
    return null;
  }
}
