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
  const { data: change } = await supabase
    .from("competitive_changes")
    .select("id, organization_id, observation_id, company_id")
    .eq("id", changeId)
    .single();
  if (!change) return;

  await supabase.from("competitive_changes").update({
    status: CHANGE_STATUS[action],
    approved_at: action === "approve" ? new Date().toISOString() : null,
    approved_by: userId ?? null,
  }).eq("id", changeId);

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
