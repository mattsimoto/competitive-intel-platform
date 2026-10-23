import { cache } from "react";
import { createClient } from "@/lib/supabase/server";

export interface CurrentUser {
  id: string;
  email: string | null;
  role: string | null;
  active: boolean;
  organizationId: string | null;
  fullName: string | null;
  orgName: string | null;
  hasProfile: boolean;
}

/**
 * The authenticated user plus their profile row, fetched at most ONCE per
 * request. React's cache() dedupes repeated calls within the same server
 * render, so the layout and the page it wraps share a single getUser() +
 * profile query instead of each issuing their own. Returns null when signed out.
 */
export const getCurrentUser = cache(async (): Promise<CurrentUser | null> => {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return null;

  const { data: profile } = await supabase
    .from("users")
    .select("full_name, role, active, organization_id, organizations(name)")
    .eq("id", user.id)
    .maybeSingle();

  const p = profile as any;
  return {
    id: user.id,
    email: user.email ?? null,
    role: p?.role ?? null,
    active: p?.active ?? false,
    organizationId: p?.organization_id ?? null,
    fullName: p?.full_name ?? null,
    orgName: p?.organizations?.name ?? null,
    hasProfile: !!profile,
  };
});

/** Role predicates, kept in one place so every page agrees on who can do what. */
export const canEditRole = (role: string | null) => role === "administrator" || role === "analyst";
export const canReviewRole = (role: string | null) => role === "administrator" || role === "analyst";
export const isAdminRole = (role: string | null) => role === "administrator";
