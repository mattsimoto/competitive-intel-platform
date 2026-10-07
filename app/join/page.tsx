"use client";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { inspectInvitation, acceptInvitation } from "./actions";
export default function JoinPage() {
 const [token, setToken] = useState(""); const [email, setEmail] = useState(""); const [name, setName] = useState(""); const [password, setPassword] = useState(""); const [mode, setMode] = useState("create"); const [workspace, setWorkspace] = useState(""); const [message, setMessage] = useState(""); const [busy, setBusy] = useState(false);
 useEffect(() => { setToken(new URLSearchParams(window.location.hash.slice(1)).get("invite") || ""); }, []);
 async function submit(e: React.FormEvent) {
  e.preventDefault(); setBusy(true); setMessage("");
  try {
   const preview = await inspectInvitation(token, email);
   if (preview.error) { setMessage(preview.error); return; }
   setWorkspace(preview.workspace || "");
   const db = createClient();
   const { data: { user } } = await db.auth.getUser();
   if (!user || user.email?.toLowerCase() !== email.trim().toLowerCase()) {
    if (mode === "create") {
     const { data, error } = await db.auth.signUp({ email, password, options: { emailRedirectTo: window.location.origin + "/auth/callback" } });
     if (error) { setMessage(error.message); return; }
     if (!data.session) { setMessage("Check your email to confirm your account, then reopen this invitation link and choose Sign in."); return; }
    } else {
     const { error } = await db.auth.signInWithPassword({ email, password });
     if (error) { setMessage(error.message); return; }
    }
   }
   const result = await acceptInvitation(token, name);
   if (result.error === "Email link verification required") {
    const { error } = await db.auth.signInWithOtp({ email, options: { shouldCreateUser: false, emailRedirectTo: window.location.origin + "/auth/callback" } });
    setMessage(error?.message || "Verify using the email link just sent to you, then reopen this invitation link and accept it. No workspace access is granted until verification.");
   } else if (result.error) setMessage(result.error); else window.location.assign("/dashboard");
  } catch { setMessage("Unable to join. Check your invitation and try again."); } finally { setBusy(false); }
 }
 return <main className="mx-auto max-w-md space-y-4 p-8"><h1 className="text-xl font-semibold">Join a workspace</h1><p className="text-sm text-zinc-600">An invitation grants access only to its intended, verified email address.</p>{workspace && <p>{workspace}</p>}
 {!token ? <p>Open the full invitation link shared by your administrator.</p> : <form onSubmit={submit} className="space-y-3">
 <label className="block text-sm">Invited email<input required type="email" value={email} onChange={e => setEmail(e.target.value)} className="block w-full rounded border p-2" /></label>
 <label className="block text-sm">Your name<input required maxLength={200} value={name} onChange={e => setName(e.target.value)} className="block w-full rounded border p-2" /></label>
 <label className="block text-sm">Account<select value={mode} onChange={e => setMode(e.target.value)} className="block w-full rounded border p-2"><option value="create">Create account</option><option value="login">Sign in</option></select></label>
 <label className="block text-sm">Password<input required minLength={8} autoComplete={mode === "create" ? "new-password" : "current-password"} type="password" value={password} onChange={e => setPassword(e.target.value)} className="block w-full rounded border p-2" /></label>
 <button disabled={busy} className="rounded bg-zinc-900 px-4 py-2 text-white">{busy ? "Working…" : "Accept invitation"}</button></form>}<p role="status" className="text-sm">{message}</p></main>;
}
