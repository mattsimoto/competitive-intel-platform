"use server";
import { randomBytes, createHash } from "node:crypto";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";
const roles = ["administrator", "analyst", "viewer"];
export async function membershipAction(form: FormData) {
 const db = await createClient();
 const action = String(form.get("action"));
 const role = String(form.get("role"));
 let token = "";
 let result;
 if (action === "invite") {
  if (!roles.includes(role)) return { error: "Choose a valid role." };
  token = randomBytes(32).toString("hex");
  result = await db.rpc("create_workspace_invitation", { p_email: String(form.get("email")).trim().toLowerCase(), p_role: role, p_hash: createHash("sha256").update(token).digest("hex") });
 } else if (action === "member") {
  if (!roles.includes(role)) return { error: "Choose a valid role." };
  result = await db.rpc("manage_workspace_member", { p_user: String(form.get("id")), p_role: role, p_active: form.get("active") === "on" });
 } else if (action === "revoke") {
  result = await db.rpc("revoke_workspace_invitation", { p_id: String(form.get("id")) });
 } else return { error: "Unknown action." };
 if (result.error) return { error: result.error.message };
 revalidatePath("/admin");
 return { link: token ? `/join#invite=${token}` : "", error: "" };
}
