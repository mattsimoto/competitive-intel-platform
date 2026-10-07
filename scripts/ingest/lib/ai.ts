// Classification + extraction via Groq (OpenAI-compatible, free hosted).
// Prompts the model for strict JSON; no provider SDK needed.
import { CHANGE_TYPES } from "./mapping.js";

const GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
const MODEL = process.env.GROQ_MODEL || "openai/gpt-oss-120b";

async function groqJSON(system: string, user: string, maxTokens: number): Promise<any | null> {
  const key = process.env.GROQ_API_KEY;
  if (!key) return null;
  try {
    const res = await fetch(GROQ_URL, {
      method: "POST",
      headers: { "content-type": "application/json", authorization: `Bearer ${key}` },
      body: JSON.stringify({
        model: MODEL,
        temperature: 0.2,
        max_tokens: maxTokens,
        response_format: { type: "json_object" },
        messages: [{ role: "system", content: system }, { role: "user", content: user }],
      }),
    });
    if (!res.ok) return null;
    const data = await res.json();
    const raw = (data?.choices?.[0]?.message?.content ?? "").trim();
    return JSON.parse(raw.replace(/^```(?:json)?\s*/i, "").replace(/```\s*$/i, "").trim());
  } catch {
    return null;
  }
}

export interface Relevance {
  relevant: boolean;
  change_type: string;
  significance_score: number;
  confidence_score: number;
  explanation: string;
}

// Prompt 1 — Page Relevance Classifier (spec §12).
export async function classifyRelevance(company: string, url: string, content: string): Promise<Relevance> {
  const system =
    "You are a competitive intelligence analyst. Review the supplied webpage change and decide whether it contains material competitive information. Ignore formatting, navigation, copyright, cookie notices, generic promotional language, and minor editorial changes. Only flag meaningful changes involving products, services, pricing, audiences, markets, customers, partnerships, acquisitions, events, topics, positioning, or geographic expansion. Do not invent facts. " +
    `Respond with a single JSON object: {"relevant": boolean, "change_type": one of [${CHANGE_TYPES.join(", ")}], "significance_score": 0-100, "confidence_score": 0-100, "explanation": one or two sentences grounded in the content}.`;
  const out = await groqJSON(system, `Company: ${company}\nURL: ${url}\n\nChanged content:\n${content.slice(0, 12000)}`, 600);
  if (!out) return { relevant: false, change_type: "positioning_change", significance_score: 0, confidence_score: 0, explanation: "No structured output returned." };
  return {
    relevant: !!out.relevant,
    change_type: CHANGE_TYPES.includes(out.change_type) ? out.change_type : "positioning_change",
    significance_score: Number(out.significance_score ?? 0),
    confidence_score: Number(out.confidence_score ?? 0),
    explanation: String(out.explanation ?? ""),
  };
}

export interface Extraction {
  products: { name: string; confidence: number; supporting_text: string }[];
  prices: { value: string; unit?: string; confidence: number; supporting_text: string }[];
  topics: string[];
  customers: string[];
  partners: string[];
  events: string[];
  locations: string[];
  claims: { text: string; confidence: number; supporting_text: string }[];
}

// Prompt 2 — Structured Intelligence Extraction (spec §12).
export async function extractIntelligence(company: string, url: string, content: string): Promise<Extraction> {
  const empty: Extraction = { products: [], prices: [], topics: [], customers: [], partners: [], events: [], locations: [], claims: [] };
  const system =
    "Extract factual competitive intelligence from the supplied source content. Only extract information explicitly supported by the content; leave arrays empty when nothing is supported. Respond with a single JSON object with keys: " +
    "products (array of {name, confidence 0-100, supporting_text}), prices (array of {value, unit, confidence, supporting_text}), topics (array of strings), customers (array of strings), partners (array of strings), events (array of strings), locations (array of strings), claims (array of {text, confidence, supporting_text}). Do not invent.";
  const out = await groqJSON(system, `Company: ${company}\nURL: ${url}\n\nSource content:\n${content.slice(0, 16000)}`, 1500);
  if (!out) return empty;
  return { ...empty, ...out };
}
