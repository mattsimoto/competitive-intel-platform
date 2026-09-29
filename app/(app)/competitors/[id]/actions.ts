"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";

async function ctx() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id, role").eq("id", user!.id).maybeSingle();
  return { supabase, userId: user?.id, orgId: (profile as any)?.organization_id, role: (profile as any)?.role };
}
const canEdit = (role: string) => ["administrator", "analyst"].includes(role);

export async function addSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const companyId = String(formData.get("companyId") ?? "");
  const url = String(formData.get("url") ?? "").trim();
  const sourceTypeId = String(formData.get("source_type_id") ?? "") || null;
  const name = String(formData.get("name") ?? "").trim() || null;
  if (!companyId || !url) return;
  await supabase.from("company_sources").insert({
    organization_id: orgId, company_id: companyId, url, source_type_id: sourceTypeId,
    name, priority: 3, active: true, status: "never_run",
  });
  revalidatePath(`/competitors/${companyId}`);
}

export async function updateSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const id = String(formData.get("id") ?? "");
  const companyId = String(formData.get("companyId") ?? "");
  const url = String(formData.get("url") ?? "").trim();
  const priority = Number(formData.get("priority") ?? 3);
  const active = formData.get("active") === "on";
  if (!id || !url) return;
  // Changing the URL invalidates the old crawl state, so reset it to crawl clean.
  const { data: cur } = await supabase.from("company_sources").select("url").eq("id", id).maybeSingle();
  const urlChanged = cur && (cur as any).url !== url;
  await supabase.from("company_sources").update({
    url, priority, active,
    ...(urlChanged ? { content_hash: null, status: "never_run", last_error: null, last_checked_at: null, last_changed_at: null } : {}),
  }).eq("id", id);
  revalidatePath(`/competitors/${companyId}`);
}

export async function deleteSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const id = String(formData.get("id") ?? "");
  const companyId = String(formData.get("companyId") ?? "");
  if (!id) return;
  await supabase.from("company_sources").delete().eq("id", id);
  revalidatePath(`/competitors/${companyId}`);
}

/** Reset crawl state so the next run re-fetches this source from scratch. */
export async function recrawlSource(formData: FormData) {
  const { supabase, orgId, role } = await ctx();
  if (!orgId || !canEdit(role)) return;
  const id = String(formData.get("id") ?? "");
  const companyId = String(formData.get("companyId") ?? "");
  if (!id) return;
  await supabase.from("company_sources").update({ content_hash: null, status: "never_run", last_error: null }).eq("id", id);
  revalidatePath(`/competitors/${companyId}`);
}
