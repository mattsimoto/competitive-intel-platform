"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";
import { fetchLatestNews, headlinesMarkdown, sourcesForPrompt } from "@/lib/news";

const ANALYSIS_PROMPT =
  "Research consequential cybersecurity market developments since the previous brief using current, dated sources. Brief me on changes that could affect product marketing and go-to-market work, especially buyer priorities, vendor positioning, media and events, packaging, pricing, and product launches. Prioritize material U.S. market implications while including global developments when relevant. For each significant development, state what changed, why it matters, and concrete implications for positioning, sales enablement, and launch planning. Link directly to primary announcements, research, pricing pages, event information, or reliable reporting; distinguish confirmed changes from inference. Keep the brief concise and ranked by impact, avoid repeating prior items without a substantive update, and say briefly if there are no consequential developments.";

async function analyzeWithClaude(sources: string, previous: string | null): Promise<string | null> {
  const { callLLM } = await import("@/lib/llm");
  return callLLM({
    system:
      ANALYSIS_PROMPT +
      "\n\nOutput GitHub-flavored Markdown. Rank items by impact (most material first). Use only the links from the provided sources. Label each item's confidence as Confirmed or Inference.",
    user:
      `Current dated sources:\n${sources}\n\n` +
      `Previous brief (avoid repeating without a substantive update):\n${previous ?? "None on file."}\n\n` +
      `Write the brief now.`,
    maxTokens: 2000,
  });
}

/** On-demand: pull latest news; analyze with Claude if the key is set; store a brief. */
export async function generateBrief() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", user!.id).maybeSingle();
  const orgId = (profile as any)?.organization_id;
  const role = (profile as any)?.role;
  if (!orgId || !["administrator", "analyst"].includes(role)) return;

  const items = await fetchLatestNews(24);
  const today = new Date().toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" });

  const { data: prev } = await supabase
    .from("market_briefs")
    .select("body_markdown")
    .eq("organization_id", orgId)
    .order("generated_at", { ascending: false })
    .limit(1)
    .maybeSingle();

  const analyzed = await analyzeWithClaude(sourcesForPrompt(items), (prev as any)?.body_markdown?.slice(0, 4000) ?? null);
  const kind = analyzed ? "ai" : "headlines";
  const title = analyzed ? `Market brief — ${today}` : `News pull — ${today}`;
  const body = analyzed ?? headlinesMarkdown(items);

  await supabase.from("market_briefs").insert({
    organization_id: orgId,
    title,
    kind,
    period_label: today,
    body_markdown: body,
    source_count: items.length,
    created_by: user!.id,
  });

  revalidatePath("/news");
}
