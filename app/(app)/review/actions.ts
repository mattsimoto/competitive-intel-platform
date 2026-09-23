"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";

type Action = "approve" | "reject" | "defer" | "mark_duplicate";

const CHANGE_STATUS: Record<Action, string> = {
  approve: "approved",
  reject: "rejected",
  defer: "deferred",
  mark_duplicate: "rejected",
};
const OBS_STATUS: Record<Action, string> = {
  approve: "approved",
  reject: "rejected",
  defer: "deferred",
  mark_duplicate: "rejected",
};

/** Approve / reject / defer / mark-duplicate a pending change. Writes the
 *  decision, updates the linked observation, and records an audit row.
 *  RLS enforces that only analysts/admins can perform these writes. */
export async function reviewAction(formData: FormData) {
  const changeId = String(formData.get("id") ?? "");
  const action = String(formData.get("action") ?? "") as Action;
  if (!changeId || !(action in CHANGE_STATUS)) return;

  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: change } = await supabase
    .from("competitive_changes")
    .select("id, organization_id, observation_id, company_id")
    .eq("id", changeId)
    .single();
  if (!change) return;

  await supabase
    .from("competitive_changes")
    .update({
      status: CHANGE_STATUS[action],
      approved_at: action === "approve" ? new Date().toISOString() : null,
      approved_by: user?.id ?? null,
    })
    .eq("id", changeId);

  // Approving a change verifies its evidence; rejecting/deferring flows through.
  if (change.observation_id) {
    await supabase
      .from("observations")
      .update({ review_status: OBS_STATUS[action] })
      .eq("id", change.observation_id);
  }
  if (action === "approve" && change.company_id) {
    await supabase
      .from("companies")
      .update({ last_verified_at: new Date().toISOString() })
      .eq("id", change.company_id);
  }

  // Audit trail — every decision is recorded (spec §16).
  await supabase.from("review_actions").insert({
    organization_id: change.organization_id,
    competitive_change_id: changeId,
    user_id: user?.id ?? null,
    action,
  });

  revalidatePath("/review");
  revalidatePath("/dashboard");
}
