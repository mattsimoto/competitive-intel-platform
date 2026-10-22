"use server";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { fetchPage } from "@/lib/fetchPage";

/** Fetch a single source right now, store the snapshot, update its crawl status. */
export async function fetchSourceNow(formData: FormData) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", user!.id).maybeSingle();
  const orgId = (profile as any)?.organization_id;
  const role = (profile as any)?.role;
  if (!orgId || !["administrator", "analyst"].includes(role)) return;

  const sourceId = String(formData.get("sourceId") ?? "");
  const companyId = String(formData.get("companyId") ?? "");
  const goToSnapshot = formData.get("goToSnapshot") === "1";
  if (!sourceId) return;

  const { data: src } = await supabase.from("company_sources").select("id, url, content_hash").eq("id", sourceId).maybeSingle();
  if (!src) return;

  const now = new Date().toISOString();
  const snap = await fetchPage((src as any).url);

  if (!snap.ok) {
    await supabase.from("company_sources")
      .update({ status: "error", last_error: snap.error ?? `HTTP ${snap.status}`, last_checked_at: now })
      .eq("id", sourceId);
  } else {
    await supabase.from("source_documents").insert({
      organization_id: orgId, company_source_id: sourceId, fetched_at: now,
      title: snap.title, cleaned_text: snap.text, content_hash: snap.hash,
      metadata_json: snap.metaDescription ? { description: snap.metaDescription } : {},
      fetch_status: "success",
    });
    await supabase.from("company_sources").update({
      status: "ok", content_hash: snap.hash, last_checked_at: now, last_success_at: now, last_error: null,
      ...((src as any).content_hash !== snap.hash ? { last_changed_at: now } : {}),
    }).eq("id", sourceId);
  }

  revalidatePath(`/competitors/${companyId}`);
  revalidatePath(`/sources/${sourceId}`);
  if (goToSnapshot) redirect(`/sources/${sourceId}`);
}
