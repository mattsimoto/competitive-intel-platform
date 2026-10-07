"use client";
import { useState } from "react";
import { membershipAction } from "@/app/(app)/admin/membership-actions";
type Member = { id: string; full_name: string | null; email: string; role: string; active: boolean };
type Invitation = { id: string; email: string; role: string; expires_at: string; revoked_at: string | null; accepted_at: string | null };
const roles = ["viewer", "analyst", "administrator"];
const input = "rounded border border-zinc-300 px-2 py-1 text-sm";
export function MembershipPanel({ users, invitations, audit }: { users: Member[]; invitations: Invitation[]; audit: { id: string; action: string; created_at: string; actor_id: string | null; target_user_id: string | null; details: Record<string, unknown> }[] }) {
 const [message, setMessage] = useState(""); const [link, setLink] = useState(""); const [busy, setBusy] = useState(false);
 async function submit(form: FormData) {
  setBusy(true); setMessage("");
  try { const result = await membershipAction(form); setMessage(result.error || "Saved."); if (result.link) setLink(window.location.origin + result.link); }
  catch { setMessage("Unable to save. Try again."); } finally { setBusy(false); }
 }
 return <div className="space-y-5">
  <p className="text-sm text-zinc-600">Invite teammates to this shared workspace. Viewers read; analysts edit and review; administrators manage access. Each person uses their own account.</p>
  <form action={submit} className="flex flex-wrap gap-2">
   <input type="hidden" name="action" value="invite" />
   <input className={input} name="email" type="email" required placeholder="Teammate email" aria-label="Teammate email" />
   <select name="role" className={input} aria-label="Invitation role">{roles.map(r => <option key={r}>{r}</option>)}</select>
   <button disabled={busy} className={input}>Create invitation</button>
  </form>
  {link && <div className="rounded bg-zinc-100 p-3 text-sm"><p>Share this link with the invited teammate. It expires after seven days and can be used once. Copy it now; the secret is not stored.</p><input aria-label="Invitation link" readOnly value={link} className="my-2 w-full rounded border p-2" /><button type="button" onClick={async () => { try { await navigator.clipboard.writeText(link); setMessage("Link copied."); } catch { setMessage("Select and copy the link above."); } }}>Copy link</button></div>}
  <p role="status" className="text-sm">{message}</p>
  {users.map(u => <form action={submit} key={u.id} className="flex flex-wrap items-center gap-3 border-t pt-3">
   <input type="hidden" name="action" value="member" /><input type="hidden" name="id" value={u.id} />
   <div className="min-w-48 flex-1 text-sm">{u.full_name || u.email}<div className="text-xs text-zinc-500">{u.email}</div></div>
   <select name="role" defaultValue={u.role} className={input} aria-label={`Role for ${u.email}`}>{roles.map(r => <option key={r}>{r}</option>)}</select>
   <label className="text-sm"><input name="active" type="checkbox" defaultChecked={u.active} /> Active</label><button disabled={busy} className={input}>Update</button>
  </form>)}
  <p className="text-xs text-zinc-500">Deactivation blocks workspace access immediately, including existing sessions. Your own administrator account cannot be demoted or deactivated here.</p>
  <h3 className="text-sm font-semibold">Invitations</h3>
  {invitations.length === 0 && <p className="text-sm text-zinc-500">No invitations yet.</p>}
  {invitations.map(i => <form action={submit} key={i.id} className="flex flex-wrap items-center gap-3 text-sm"><input type="hidden" name="action" value="revoke" /><input type="hidden" name="id" value={i.id} /><span className="flex-1">{i.email} · {i.role} · {i.accepted_at ? "Accepted" : i.revoked_at ? "Revoked" : new Date(i.expires_at) <= new Date() ? "Expired" : `Expires ${new Date(i.expires_at).toLocaleDateString()}`}</span>{!i.accepted_at && !i.revoked_at && <button disabled={busy} className={input}>Revoke</button>}</form>)}
  <h3 className="text-sm font-semibold">Recent access history</h3>
  {audit.map(a => <p key={a.id} className="text-xs text-zinc-500">{a.created_at.slice(0, 19).replace("T", " ")} UTC · {a.action.replaceAll("_", " ")} · {users.find(u => u.id === a.actor_id)?.email || "Former member"}{a.details.email ? ` · ${a.details.email}` : a.target_user_id ? ` · ${users.find(u => u.id === a.target_user_id)?.email || "Former member"}` : ""}{a.details.role ? ` · ${a.details.role}` : ""}</p>)}
 </div>;
}
