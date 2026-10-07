import "server-only";

export async function groqJSON(system: string, user: string): Promise<unknown> {
  const key = process.env.GROQ_API_KEY;
  if (!key) throw new Error("Add GROQ_API_KEY to the Vercel production environment, then redeploy.");
  const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
    method: "POST",
    cache: "no-store",
    signal: AbortSignal.timeout(30000),
    headers: { "content-type": "application/json", authorization: `Bearer ${key}` },
    body: JSON.stringify({
      model: process.env.GROQ_MODEL || "openai/gpt-oss-120b",
      temperature: 0.2,
      max_tokens: 2500,
      response_format: { type: "json_object" },
      messages: [{ role: "system", content: system }, { role: "user", content: user }],
    }),
  });
  if (!response.ok) {
    if (response.status === 401) throw new Error("Groq rejected the API key. Check GROQ_API_KEY in Vercel and redeploy.");
    if (response.status === 429) throw new Error("Groq's usage limit was reached. Please try again later.");
    if ([400, 404].includes(response.status)) throw new Error("Groq could not use the configured model. Check GROQ_MODEL in Vercel.");
    throw new Error(`Groq is unavailable (HTTP ${response.status}). Please try again later.`);
  }
  const body = await response.json();
  const raw = body?.choices?.[0]?.message?.content;
  if (typeof raw !== "string" || body?.choices?.[0]?.finish_reason === "length") {
    throw new Error("Groq returned incomplete results. Please try again.");
  }
  try { return JSON.parse(raw.replace(/^```(?:json)?\s*/i, "").replace(/```\s*$/, "")); }
  catch { throw new Error("Groq did not return valid structured results. Please try again."); }
}
