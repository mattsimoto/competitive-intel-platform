// Single LLM entry point for the web app. Points at Groq's OpenAI-compatible
// Chat Completions API (free, hosted). Swap provider by changing the base URL +
// key env; model is configurable via GROQ_MODEL.
const GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
const DEFAULT_MODEL = "openai/gpt-oss-120b"; // llama-3.3-70b-versatile was retired by Groq

export function llmEnabled(): boolean {
  return !!process.env.GROQ_API_KEY;
}

export async function callLLM(opts: {
  system: string;
  user: string;
  maxTokens?: number;
  json?: boolean;
}): Promise<string | null> {
  const key = process.env.GROQ_API_KEY;
  if (!key) return null;
  const model = process.env.GROQ_MODEL || DEFAULT_MODEL;
  try {
    const res = await fetch(GROQ_URL, {
      method: "POST",
      headers: { "content-type": "application/json", authorization: `Bearer ${key}` },
      body: JSON.stringify({
        model,
        temperature: 0.2,
        max_tokens: opts.maxTokens ?? 1200,
        ...(opts.json ? { response_format: { type: "json_object" } } : {}),
        messages: [
          { role: "system", content: opts.system },
          { role: "user", content: opts.user },
        ],
      }),
    });
    if (!res.ok) return null;
    const data = await res.json();
    return (data?.choices?.[0]?.message?.content ?? "").trim() || null;
  } catch {
    return null;
  }
}
