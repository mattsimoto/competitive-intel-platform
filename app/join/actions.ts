"use server";
import { createHash } from "node:crypto";
import { createClient } from "@/lib/supabase/server";
function hash(token: string) { if (!/^[a-f0-9]{64}$/.test(token)) throw new Error("Invalid invitation link."); return createHash("sha256").update(token).digest("hex"); }
export async function inspectInvitation(token: string, email: string) {
 const db = await createClient(); const { data, error } = await db.rpc("inspect_workspace_invitation", { p_hash: hash(token), p_email: email });
 if (error || !data) return { error: "Invitation unavailable. Check the email, expiry, or ask the administrator for a new link." };
 return { workspace: String(data.workspace), role: String(data.role) };
}
export async function acceptInvitation(token: string, name: string) {
 const db = await createClient(); const { error } = await db.rpc("accept_workspace_invitation", { p_hash: hash(token), p_name: name });
 return { error: error?.message ?? "" };
}
