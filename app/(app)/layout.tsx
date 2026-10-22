import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Sidebar } from "@/components/Sidebar";
import { SignOutButton } from "@/components/SignOutButton";

export default async function AppLayout({ children }: { children: React.ReactNode }) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  // The public.users row carries org + role; without it RLS returns no data.
  const { data: profile } = await supabase
    .from("users")
    .select("full_name, role, organization_id, organizations(name)")
    .eq("id", user.id)
    .maybeSingle();

  const orgName = (profile as any)?.organizations?.name ?? "Competitive Intelligence";

  return (
    <div className="flex min-h-screen">
      <aside className="w-60 shrink-0 border-r border-zinc-200 bg-white">
        <div className="px-4 py-4">
          <div className="text-sm font-semibold">{orgName}</div>
          <div className="text-xs text-zinc-500">Competitive Intelligence</div>
        </div>
        <Sidebar role={(profile as any)?.role} />
      </aside>
      <div className="flex min-w-0 flex-1 flex-col">
        <header className="flex items-center justify-between border-b border-zinc-200 bg-white px-6 py-3">
          <div className="text-sm text-zinc-500">
            {(profile as any)?.full_name ?? user.email}
            {(profile as any)?.role ? ` · ${(profile as any).role}` : ""}
          </div>
          <SignOutButton />
        </header>
        {!profile && (
          <div className="border-b border-amber-200 bg-amber-50 px-6 py-2 text-sm text-amber-800">
            No profile row found for your account. Add a row to <code>public.users</code> linking this
            auth user to your organization (and set a role) so records become visible.
          </div>
        )}
        <main className="flex-1 p-6">{children}</main>
      </div>
    </div>
  );
}
