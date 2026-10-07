"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";

type Action = "approve" | "reject" | "defer" | "mark_duplicate";

const CHANGE_STATUS: Record<Action, string> = {
  approve: "approved", reject: "rejected", defer: "deferred", mark_duplicate: "rejected",
};
const OBS_STATUS: Record<Action, string> = {
  approve: "approved", reject: "rejected", defer: "deferred", mark_duplicate: "rejected",
};

/** Apply one review decision: update the change, its observation, and audit it. */
async function applyReview(supabase: any, changeId: string, action: Action, userId: string | undefined) {
  if (!userId) throw new Error("Please sign in again.");
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", userId).single();
  if (!profile || !["administrator", "analyst"].includes(profile.role)) throw new Error("Review requires Administrator or Analyst access.");
  const { data: change } = await supabase
    .from("competitive_changes")
    .select("id, organization_id, observation_id, company_id, new_value_json, previous_value_json, status")
    .eq("id", changeId)
    .eq("organization_id", profile.organization_id)
    .single();
  if (!change) return;

  // Only an explicitly approved, evidence-backed enrichment can update the overview.
  const proposal = change.new_value_json;
  if (action === "approve" && proposal?.kind === "company_enrichment" && proposal.field === "description" && change.company_id && change.status !== "approved") {
    if (typeof proposal.text !== "string" || !proposal.text.trim() || !change.observation_id) throw new Error("The enrichment proposal is incomplete.");
    const { data: evidence } = await supabase.from("observations").select("id, supporting_text, source_url, field_name")
      .eq("id", change.observation_id).eq("company_id", change.company_id).eq("organization_id", profile.organization_id).single();
    if (!evidence?.supporting_text || !evidence.source_url || evidence.field_name !== "description") throw new Error("This proposal is missing source evidence.");
    const { data: current } = await supabase.from("companies").select("description").eq("id", change.company_id).eq("organization_id", profile.organization_id).single();
    if (!current || ((current.description ?? "") !== (change.previous_value_json?.text ?? "") && current.description !== proposal.text)) {
      throw new Error("The company overview changed since this proposal was created. Reject this proposal and enrich again.");
    }
    let update = supabase.from("companies").update({ description: proposal.text }).eq("id", change.company_id).eq("organization_id", profile.organization_id);
    update = current.description === null ? update.is("description", null) : update.eq("description", current.description);
    const { data: applied, error } = await update.select("id").single();
    if (error || !applied) throw new Error("Could not apply the approved overview. The item remains pending.");
  }

  const { error: reviewError } = await supabase.from("competitive_changes").update({
    status: CHANGE_STATUS[action],
    approved_at: action === "approve" ? new Date().toISOString() : null,
    approved_by: userId ?? null,
  }).eq("id", changeId);
  if (reviewError) throw new Error("Could not save the review decision.");

  if (change.observation_id) {
    await supabase.from("observations").update({ review_status: OBS_STATUS[action] }).eq("id", change.observation_id);
  }
  if (action === "approve" && change.company_id) {
    await supabase.from("companies").update({ last_verified_at: new Date().toISOString() }).eq("id", change.company_id);
  }
  await supabase.from("review_actions").insert({
    organization_id: change.organization_id,
    competitive_change_id: changeId,
    user_id: userId ?? null,
    action,
  });
  if (change.company_id) revalidatePath(`/competitors/${change.company_id}`);
  revalidatePath("/competitors");
  revalidatePath("/activity");
}

export async function reviewAction(formData: FormData) {
  const changeId = String(formData.get("id") ?? "");
  const action = String(formData.get("action") ?? "") as Action;
  if (!changeId || !(action in CHANGE_STATUS)) return;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  await applyReview(supabase, changeId, action, user?.id);
  revalidatePath("/review");
  revalidatePath("/dashboard");
}

/** Bulk apply to all checked changes (approve or reject selected). */
export async function bulkReview(formData: FormData) {
  const ids = formData.getAll("ids").map(String).filter(Boolean);
  const action = String(formData.get("bulkAction") ?? "") as Action;
  if (!ids.length || !(action in CHANGE_STATUS)) return;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  for (const id of ids) await applyReview(supabase, id, action, user?.id);
  revalidatePath("/review");
  revalidatePath("/dashboard");
}
