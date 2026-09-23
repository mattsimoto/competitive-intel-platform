import Link from "next/link";
import { listPricing } from "@/lib/queries";
import { ConfidenceBadge, Pill } from "@/components/badges";
import { money, since } from "@/lib/format";

export default async function PricingPage({
  searchParams,
}: {
  searchParams: Promise<{ search?: string }>;
}) {
  const { search } = await searchParams;
  const rows = await listPricing(search);

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Pricing</h1>
        <span className="text-sm text-zinc-500">{rows.length} priced offerings</span>
      </div>

      <form method="get" className="flex gap-2">
        <input
          type="text" name="search" defaultValue={search ?? ""} placeholder="Search company or product…"
          className="w-72 rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900"
        />
        <button className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm hover:bg-zinc-50">Search</button>
      </form>

      <div className="overflow-x-auto rounded-xl border border-zinc-200 bg-white">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
              <th className="px-4 py-2 font-medium">Company</th>
              <th className="px-4 py-2 font-medium">Product</th>
              <th className="px-4 py-2 font-medium">Price</th>
              <th className="px-4 py-2 font-medium">Previous</th>
              <th className="px-4 py-2 font-medium">Change</th>
              <th className="px-4 py-2 font-medium">Observed</th>
              <th className="px-4 py-2 font-medium">Confidence</th>
              <th className="px-4 py-2 font-medium">Source</th>
            </tr>
          </thead>
          <tbody>
            {rows.map((r) => (
              <tr key={r.productId} className="border-b border-zinc-100 align-top hover:bg-zinc-50">
                <td className="px-4 py-2">
                  {r.company ? (
                    <Link href={`/competitors/${r.company.id}`} className="text-zinc-700 hover:underline">{r.company.name}</Link>
                  ) : "—"}
                </td>
                <td className="px-4 py-2 font-medium text-zinc-900">{r.productName}</td>
                <td className="px-4 py-2 whitespace-nowrap">
                  {money(r.current.min, r.current.max, r.current.currency ?? "USD")}
                  {r.current.unit ? <span className="text-xs text-zinc-400"> / {r.current.unit}</span> : null}
                </td>
                <td className="px-4 py-2 whitespace-nowrap text-zinc-500">
                  {r.previous ? money(r.previous.min, r.previous.max, r.previous.currency ?? "USD") : "—"}
                </td>
                <td className="px-4 py-2">
                  {r.changePct == null ? (
                    <span className="text-zinc-400">—</span>
                  ) : (
                    <Pill tone={r.changePct > 0 ? "red" : r.changePct < 0 ? "green" : "gray"}>
                      {r.changePct > 0 ? "+" : ""}{r.changePct}%
                    </Pill>
                  )}
                </td>
                <td className="px-4 py-2 whitespace-nowrap text-zinc-500">{since(r.observedAt)}</td>
                <td className="px-4 py-2"><ConfidenceBadge score={r.confidence} /></td>
                <td className="px-4 py-2 max-w-xs truncate text-zinc-500" title={r.rawText ?? ""}>{r.rawText ?? "—"}</td>
              </tr>
            ))}
          </tbody>
        </table>
        {rows.length === 0 && <p className="px-4 py-6 text-sm text-zinc-500">No pricing on file.</p>}
      </div>

      <p className="text-xs text-zinc-400">
        Previous price and change % appear once a product has more than one observed price. Seed pricing is
        parsed from source text (shown) at confidence 60 — verify before relying on it.
      </p>
    </div>
  );
}
