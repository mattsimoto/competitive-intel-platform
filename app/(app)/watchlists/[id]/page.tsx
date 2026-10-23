import Link from "next/link";
import { notFound } from "next/navigation";
import { getWatchlist, getPickerOptions } from "@/lib/queries";
import { addWatchlistItem, removeWatchlistItem } from "../actions";
import { SubmitButton } from "@/components/SubmitButton";
import { Pill, ScoreBadge } from "@/components/badges";
import { since } from "@/lib/format";

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section className="rounded-xl border border-zinc-200 bg-white">
      <div className="border-b border-zinc-200 px-4 py-3 text-sm font-semibold">{title}</div>
      <div className="p-4">{children}</div>
    </section>
  );
}

function AddForm({ watchlistId, type, options, label }: { watchlistId: string; type: string; options: any[]; label: string }) {
  return (
    <form action={addWatchlistItem} className="mt-3 flex gap-2 border-t border-zinc-100 pt-3">
      <input type="hidden" name="watchlistId" value={watchlistId} />
      <input type="hidden" name="entity_type" value={type} />
      <select name="entity_id" className="flex-1 rounded-md border border-zinc-300 bg-white px-2 py-1 text-sm">
        <option value="">{label}</option>
        {options.map((o) => <option key={o.id} value={o.id}>{o.name}</option>)}
      </select>
      <SubmitButton className="rounded-md border border-zinc-300 px-3 py-1 text-sm hover:bg-zinc-50">Add</SubmitButton>
    </form>
  );
}

function RemoveBtn({ itemId, watchlistId }: { itemId: string; watchlistId: string }) {
  return (
    <form action={removeWatchlistItem} className="inline">
      <input type="hidden" name="itemId" value={itemId} />
      <input type="hidden" name="watchlistId" value={watchlistId} />
      <SubmitButton className="text-xs text-red-600 hover:underline">remove</SubmitButton>
    </form>
  );
}

const label = (s: string) => s.replace(/_/g, " ").replace(/\b\w/, (c) => c.toUpperCase());

export default async function WatchlistDetail({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const [data, options] = await Promise.all([getWatchlist(id), getPickerOptions()]);
  if (!data) notFound();
  const { watchlist, companyList, productList, topicList, activity } = data;

  return (
    <div className="space-y-5">
      <Link href="/watchlists" className="text-sm text-blue-600 hover:underline">← Watchlists</Link>
      <div className="flex items-center gap-2">
        <h1 className="text-xl font-semibold">{watchlist.name}</h1>
        {watchlist.shared && <Pill tone="blue">Shared</Pill>}
      </div>

      <div className="grid gap-5 md:grid-cols-3">
        <Section title={`Companies (${companyList.length})`}>
          <ul className="space-y-1 text-sm">
            {companyList.map((c: any) => (
              <li key={c.itemId} className="flex items-center justify-between">
                <Link href={`/competitors/${c.id}`} className="text-zinc-900 hover:underline">{c.name}</Link>
                <span className="flex items-center gap-2"><ScoreBadge score={c.score} /><RemoveBtn itemId={c.itemId} watchlistId={id} /></span>
              </li>
            ))}
            {companyList.length === 0 && <li className="text-zinc-400">None</li>}
          </ul>
          <AddForm watchlistId={id} type="company" options={options.companies} label="Add a company…" />
        </Section>

        <Section title={`Products (${productList.length})`}>
          <ul className="space-y-1 text-sm">
            {productList.map((p: any) => (
              <li key={p.itemId} className="flex items-center justify-between">
                <Link href={`/products/${p.id}`} className="text-zinc-900 hover:underline">{p.name}</Link>
                <RemoveBtn itemId={p.itemId} watchlistId={id} />
              </li>
            ))}
            {productList.length === 0 && <li className="text-zinc-400">None</li>}
          </ul>
          <AddForm watchlistId={id} type="product" options={options.products} label="Add a product…" />
        </Section>

        <Section title={`Topics (${topicList.length})`}>
          <ul className="space-y-1 text-sm">
            {topicList.map((t: any) => (
              <li key={t.itemId} className="flex items-center justify-between">
                <Link href={`/topics/${t.id}`} className="text-zinc-900 hover:underline">{t.name}</Link>
                <RemoveBtn itemId={t.itemId} watchlistId={id} />
              </li>
            ))}
            {topicList.length === 0 && <li className="text-zinc-400">None</li>}
          </ul>
          <AddForm watchlistId={id} type="topic" options={options.topics} label="Add a topic…" />
        </Section>
      </div>

      <Section title="Watchlist Activity">
        {activity.length === 0 ? (
          <p className="text-sm text-zinc-400">No activity for the companies on this watchlist yet.</p>
        ) : (
          <div className="space-y-2">
            {activity.map((a: any) => (
              <div key={a.id} className="flex flex-wrap items-center gap-2 border-b border-zinc-100 pb-2 text-sm">
                {a.companies && <Link href={`/competitors/${a.companies.id}`} className="font-medium text-zinc-900 hover:underline">{a.companies.name}</Link>}
                <Pill tone="blue">{label(a.change_type)}</Pill>
                <Pill tone={a.status === "approved" ? "green" : a.status === "pending" ? "amber" : "gray"}>{label(a.status)}</Pill>
                <span className="text-zinc-600">{a.summary}</span>
                <span className="ml-auto text-xs text-zinc-400">{since(a.detected_at)}</span>
              </div>
            ))}
          </div>
        )}
      </Section>
    </div>
  );
}
