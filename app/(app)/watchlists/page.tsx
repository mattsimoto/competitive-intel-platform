import Link from "next/link";
import { listWatchlists } from "@/lib/queries";
import { createWatchlist, deleteWatchlist } from "./actions";
import { SubmitButton } from "@/components/SubmitButton";
import { Pill } from "@/components/badges";

export default async function WatchlistsPage() {
  const watchlists = await listWatchlists();

  return (
    <div className="space-y-4">
      <h1 className="text-xl font-semibold">Watchlists</h1>

      <form action={createWatchlist} className="flex flex-wrap items-center gap-2 rounded-xl border border-zinc-200 bg-white p-4">
        <input type="text" name="name" required placeholder="New watchlist name…"
          className="min-w-[16rem] flex-1 rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900" />
        <label className="flex items-center gap-1 text-sm text-zinc-600">
          <input type="checkbox" name="shared" /> Shared with team
        </label>
        <SubmitButton pendingText="Creating…" className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">Create</SubmitButton>
      </form>

      {watchlists.length === 0 ? (
        <p className="rounded-xl border border-zinc-200 bg-white px-4 py-8 text-sm text-zinc-500">
          No watchlists yet. Create one above, then add companies, products, or topics to it.
        </p>
      ) : (
        <div className="divide-y divide-zinc-100 rounded-xl border border-zinc-200 bg-white">
          {watchlists.map((w) => (
            <div key={w.id} className="flex items-center justify-between px-4 py-3 hover:bg-zinc-50">
              <Link href={`/watchlists/${w.id}`} className="flex items-center gap-2">
                <span className="font-medium text-zinc-900">{w.name}</span>
                {w.shared && <Pill tone="blue">Shared</Pill>}
                <span className="text-xs text-zinc-400">{w.itemCount} item{w.itemCount === 1 ? "" : "s"}</span>
              </Link>
              <form action={deleteWatchlist}>
                <input type="hidden" name="id" value={w.id} />
                <SubmitButton className="rounded-md border border-red-300 px-2 py-1 text-xs text-red-700 hover:bg-red-50">Delete</SubmitButton>
              </form>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
