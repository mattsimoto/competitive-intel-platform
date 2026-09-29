"use server";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";

async function me() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("organization_id").eq("id", user!.id).maybeSingle();
  return { supabase, userId: user?.id, orgId: (profile as any)?.organization_id };
}

export async function createWatchlist(formData: FormData) {
  const { supabase, userId, orgId } = await me();
  const name = String(formData.get("name") ?? "").trim();
  const shared = formData.get("shared") === "on";
  if (!name || !userId || !orgId) return;
  await supabase.from("watchlists").insert({ organization_id: orgId, user_id: userId, name, shared });
  revalidatePath("/watchlists");
}

export async function deleteWatchlist(formData: FormData) {
  const { supabase } = await me();
  const id = String(formData.get("id") ?? "");
  if (!id) return;
  await supabase.from("watchlists").delete().eq("id", id);
  revalidatePath("/watchlists");
}

export async function addWatchlistItem(formData: FormData) {
  const { supabase } = await me();
  const watchlistId = String(formData.get("watchlistId") ?? "");
  const entityType = String(formData.get("entity_type") ?? "");
  const entityId = String(formData.get("entity_id") ?? "");
  if (!watchlistId || !["company", "product", "topic"].includes(entityType) || !entityId) return;
  await supabase.from("watchlist_items").insert({ watchlist_id: watchlistId, entity_type: entityType, entity_id: entityId });
  revalidatePath(`/watchlists/${watchlistId}`);
}

export async function removeWatchlistItem(formData: FormData) {
  const { supabase } = await me();
  const itemId = String(formData.get("itemId") ?? "");
  const watchlistId = String(formData.get("watchlistId") ?? "");
  if (!itemId) return;
  await supabase.from("watchlist_items").delete().eq("id", itemId);
  revalidatePath(`/watchlists/${watchlistId}`);
}
