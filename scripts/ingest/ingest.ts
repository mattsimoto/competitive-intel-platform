/**
 * Daily ingestion pipeline for the Competitive Intelligence Platform.
 *
 * Runs in GitHub Actions (see .github/workflows/ingest.yml). For each due,
 * active source: fetch -> clean -> hash -> compare. Unchanged pages stop before
 * any AI runs (the cost gate). Changed pages are stored, classified (Prompt 1),
 * and if relevant, extracted (Prompt 2) into an observation + a PENDING
 * competitive_change that lands in the Review Queue. Nothing is auto-approved in
 * this version — a human verifies every detection.
 *
 * Env: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, ANTHROPIC_API_KEY,
 *      ANTHROPIC_MODEL (optional), INGEST_MAX_SOURCES (optional).
 */
import { createClient } from "@supabase/supabase-js";
import { fetchAndClean } from "./lib/fetch.js";
import { addedLines } from "./lib/diff.js";
import { classifyRelevance, extractIntelligence } from "./lib/ai.js";
import { mapObservationType } from "./lib/mapping.js";

const MAX_SOURCES = Number(process.env.INGEST_MAX_SOURCES ?? 25);
const MODEL = process.env.GROQ_MODEL || "openai/gpt-oss-120b";
const NO_AI = process.env.INGEST_NO_AI === "1" || process.argv.includes("--no-ai");

/** Decide whether a detected change auto-approves or goes to review (spec §10 step 11). */
function decideStatus(settings: any, changeType: string, confidence: number | null): "pending" | "auto_approved" {
  if (!settings?.enabled) return "pending";
  if (settings.pricing_always_review && changeType === "pricing_change") return "pending";
  if (!(settings.eligible_change_types ?? []).includes(changeType)) return "pending";
  if ((confidence ?? 0) < Number(settings.min_confidence ?? 100)) return "pending";
  return "auto_approved";
}

async function main() {
  const url = process.env.SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) throw new Error("Missing SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY");
  if (!NO_AI && !process.env.GROQ_API_KEY) throw new Error("Missing GROQ_API_KEY (or run crawl-only with INGEST_NO_AI=1)");

  const db = createClient(url, key, { auth: { persistSession: false } });

  // Auto-approval settings, cached per org.
  const settingsCache = new Map<string, any>();
  async function getSettings(orgId: string) {
    if (!settingsCache.has(orgId)) {
      const { data } = await db.from("auto_approval_settings").select("*").eq("organization_id", orgId).maybeSingle();
      settingsCache.set(orgId, data ?? null);
    }
    return settingsCache.get(orgId);
  }

  // Step 1 — Source scheduler: due, active sources by priority (product pages first).
  const { data: sources, error } = await db
    .from("company_sources")
    .select("id, organization_id, company_id, url, content_hash, companies(name)")
    .eq("active", true)
    .order("priority", { ascending: true })
    .order("last_checked_at", { ascending: true, nullsFirst: true })
    .limit(MAX_SOURCES);
  if (error) throw error;

  const stats = { checked: 0, changed: 0, detections: 0, autoApproved: 0, errors: 0, unchanged: 0 };

  for (const s of sources ?? []) {
    stats.checked++;
    const now = new Date().toISOString();

    // Step 2 — Fetch.
    const f = await fetchAndClean(s.url);
    if (!f.ok) {
      stats.errors++;
      await db.from("company_sources")
        .update({ last_checked_at: now, status: "error", last_error: f.error ?? `HTTP ${f.status}` })
        .eq("id", s.id);
      continue;
    }

    // Step 3 — Detect change via content hash (the gate before any AI).
    if (f.hash === s.content_hash) {
      stats.unchanged++;
      await db.from("company_sources").update({ last_checked_at: now, status: "ok" }).eq("id", s.id);
      continue;
    }
    stats.changed++;

    // Store the retrieved document (Step 2 record) and grab the previous text.
    const { data: prevDoc } = await db
      .from("source_documents")
      .select("cleaned_text")
      .eq("company_source_id", s.id)
      .order("fetched_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    const { data: doc } = await db
      .from("source_documents")
      .insert({
        organization_id: s.organization_id,
        company_source_id: s.id,
        fetched_at: now,
        title: f.title,
        cleaned_text: f.text,
        content_hash: f.hash,
        metadata_json: f.metaDescription ? { description: f.metaDescription } : {},
        fetch_status: "success",
      })
      .select("id")
      .single();

    await db.from("company_sources")
      .update({ last_checked_at: now, status: "ok", content_hash: f.hash, last_changed_at: now, last_success_at: now })
      .eq("id", s.id);

    if (NO_AI) continue; // crawl-only: the changed document is stored; AI half is skipped

    // Step 4-5 — Diff + relevance classification (Prompt 1).
    const delta = addedLines(prevDoc?.cleaned_text ?? null, f.text);
    const companyName = (s as any).companies?.name ?? "";
    const rel = await classifyRelevance(companyName, s.url, delta || f.text);
    if (!rel.relevant) continue; // document stored, but no intelligence change created

    // Step 6 — Structured extraction (Prompt 2).
    const extraction = await extractIntelligence(companyName, s.url, f.text);

    // Steps 9-11 — Confidence/significance are on the classification; decide review vs auto-approve.
    const decision = decideStatus(await getSettings(s.organization_id), rel.change_type, rel.confidence_score);
    const approved = decision === "auto_approved";

    const { data: obs } = await db
      .from("observations")
      .insert({
        organization_id: s.organization_id,
        company_id: s.company_id,
        source_document_id: doc?.id ?? null,
        observation_type: mapObservationType(rel.change_type),
        observed_value_json: extraction,
        supporting_text: rel.explanation,
        source_url: s.url,
        confidence_score: rel.confidence_score,
        observed_at: now,
        extracted_by: `ai:${MODEL}`,
        review_status: approved ? "approved" : "pending",
      })
      .select("id")
      .single();

    await db.from("competitive_changes").insert({
      organization_id: s.organization_id,
      company_id: s.company_id,
      observation_id: obs?.id ?? null,
      change_type: rel.change_type,
      previous_value_json: null,
      new_value_json: extraction,
      significance_score: rel.significance_score,
      confidence_score: rel.confidence_score,
      detected_at: now,
      approved_at: approved ? now : null,
      status: decision,
      summary: rel.explanation,
    });
    stats.detections++;
    if (approved) stats.autoApproved++;
  }

  console.log(JSON.stringify({ mode: NO_AI ? "crawl-only" : "full", model: NO_AI ? null : MODEL, ...stats }));
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
