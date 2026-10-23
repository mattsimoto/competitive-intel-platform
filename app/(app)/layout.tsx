import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth";
import { Sidebar } from "@/components/Sidebar";
import { SignOutButton } from "@/components/SignOutButton";

export default async function AppLayout({ children }: { children: React.ReactNode }) {
  // One auth+profile lookup, shared with every page under this layout via
  // React cache() — the page no longer re-queries the user's role.
  const me = await getCurrentUser();
  if (!me) redirect("/login");

  const orgName = me.orgName ?? "Competitive Intelligence";

  return (
    <div className="flex min-h-screen">
      <aside className="w-60 shrink-0 border-r border-zinc-200 bg-white">
        <div className="px-4 py-4">
          <div className="text-sm font-semibold">{orgName}</div>
          <div className="text-xs text-zinc-500">Competitive Intelligence</div>
        </div>
        <Sidebar role={me.role ?? undefined} />
      </aside>
      <div className="flex min-w-0 flex-1 flex-col">
        <header className="flex items-center justify-between border-b border-zinc-200 bg-white px-6 py-3">
          <div className="text-sm text-zinc-500">
            {me.fullName ?? me.email}
            {me.role ? ` · ${me.role}` : ""}
          </div>
          <SignOutButton />
        </header>
        {!me.hasProfile && (
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
