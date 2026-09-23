import Anthropic from "@anthropic-ai/sdk";
import { CHANGE_TYPES } from "./mapping.js";

const MODEL = process.env.ANTHROPIC_MODEL || "claude-haiku-4-5-20251001";

function client() {
  return new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY });
}

function toolInput<T>(message: Anthropic.Message): T | null {
  const block = message.content.find((b) => b.type === "tool_use");
  return block && block.type === "tool_use" ? (block.input as T) : null;
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
  const msg = await client().messages.create({
    model: MODEL,
    max_tokens: 600,
    system:
      "You are a competitive intelligence analyst. Review the supplied webpage change and determine whether it contains material competitive information. Ignore formatting, navigation, copyright, cookie notices, generic promotional language, and minor editorial changes. Identify only meaningful changes involving products, services, pricing, audiences, markets, customers, partnerships, acquisitions, events, topics, positioning, or geographic expansion. Do not invent facts not present in the supplied content.",
    tools: [
      {
        name: "report_relevance",
        description: "Report whether the change is materially relevant, and classify it.",
        input_schema: {
          type: "object",
          properties: {
            relevant: { type: "boolean" },
            change_type: { type: "string", enum: [...CHANGE_TYPES] },
            significance_score: { type: "number", description: "0-100" },
            confidence_score: { type: "number", description: "0-100" },
            explanation: { type: "string", description: "One or two sentences, grounded in the content." },
          },
          required: ["relevant", "change_type", "significance_score", "confidence_score", "explanation"],
        },
      },
    ],
    tool_choice: { type: "tool", name: "report_relevance" },
    messages: [
      { role: "user", content: `Company: ${company}\nURL: ${url}\n\nChanged content:\n${content.slice(0, 12000)}` },
    ],
  });
  const out = toolInput<Relevance>(msg);
  return out ?? { relevant: false, change_type: "positioning_change", significance_score: 0, confidence_score: 0, explanation: "No structured output returned." };
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
  const msg = await client().messages.create({
    model: MODEL,
    max_tokens: 1500,
    system:
      "Extract factual competitive intelligence from the supplied source content. Only extract information explicitly supported by the content. For each extracted field include a confidence (0-100) and the supporting text. Do not infer unknown values; leave arrays empty when nothing is supported.",
    tools: [
      {
        name: "report_intelligence",
        description: "Return structured competitive intelligence extracted from the page.",
        input_schema: {
          type: "object",
          properties: {
            products: {
              type: "array",
              items: {
                type: "object",
                properties: {
                  name: { type: "string" },
                  confidence: { type: "number" },
                  supporting_text: { type: "string" },
                },
                required: ["name", "confidence", "supporting_text"],
              },
            },
            prices: {
              type: "array",
              items: {
                type: "object",
                properties: {
                  value: { type: "string" },
                  unit: { type: "string" },
                  confidence: { type: "number" },
                  supporting_text: { type: "string" },
                },
                required: ["value", "confidence", "supporting_text"],
              },
            },
            topics: { type: "array", items: { type: "string" } },
            customers: { type: "array", items: { type: "string" } },
            partners: { type: "array", items: { type: "string" } },
            events: { type: "array", items: { type: "string" } },
            locations: { type: "array", items: { type: "string" } },
            claims: {
              type: "array",
              items: {
                type: "object",
                properties: {
                  text: { type: "string" },
                  confidence: { type: "number" },
                  supporting_text: { type: "string" },
                },
                required: ["text", "confidence", "supporting_text"],
              },
            },
          },
          required: ["products", "prices", "topics", "customers", "partners", "events", "locations", "claims"],
        },
      },
    ],
    tool_choice: { type: "tool", name: "report_intelligence" },
    messages: [
      { role: "user", content: `Company: ${company}\nURL: ${url}\n\nSource content:\n${content.slice(0, 16000)}` },
    ],
  });
  const out = toolInput<Extraction>(msg);
  return out ?? { products: [], prices: [], topics: [], customers: [], partners: [], events: [], locations: [], claims: [] };
}
