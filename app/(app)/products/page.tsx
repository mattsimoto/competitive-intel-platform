import Link from "next/link";
import { listProducts } from "@/lib/queries";
import { ScoreBadge, ConfidenceBadge, StatusChip, Pill } from "@/components/badges";
import { money } from "@/lib/format";

export default async function ProductsPage({
  searchParams,
}: {
  searchParams: Promise<{ search?: string }>;
}) {
  const { search } = await searchParams;
  const products = await listProducts(search);

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Products</h1>
        <span className="text-sm text-zinc-500">{products.length} shown</span>
      </div>

      <form method="get" className="flex gap-2">
        <input
          type="text" name="search" defaultValue={search ?? ""} placeholder="Search product name…"
          className="w-72 rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900"
        />
        <button className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm hover:bg-zinc-50">Search</button>
      </form>

      <div className="overflow-x-auto rounded-xl border border-zinc-200 bg-white">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
              <th className="px-4 py-2 font-medium">Product</th>
              <th className="px-4 py-2 font-medium">Company</th>
              <th className="px-4 py-2 font-medium">Category</th>
              <th className="px-4 py-2 font-medium">Price</th>
              <th className="px-4 py-2 font-medium">Company Score</th>
              <th className="px-4 py-2 font-medium">Confidence</th>
              <th className="px-4 py-2 font-medium">Status</th>
            </tr>
          </thead>
          <tbody>
            {products.map((p) => (
              <tr key={p.id} className="border-b border-zinc-100 hover:bg-zinc-50">
                <td className="px-4 py-2 font-medium text-zinc-900">
                  {p.product_url ? (
                    <a href={p.product_url} target="_blank" rel="noreferrer" className="hover:underline">{p.name}</a>
                  ) : p.name}
                </td>
                <td className="px-4 py-2">
                  {p.company ? (
                    <Link href={`/competitors/${p.company.id}`} className="text-zinc-700 hover:underline">{p.company.name}</Link>
                  ) : "—"}
                </td>
                <td className="px-4 py-2">{p.category ? <Pill tone="blue">{p.category}</Pill> : <span className="text-zinc-400">—</span>}</td>
                <td className="px-4 py-2 whitespace-nowrap">
                  {p.price ? money(p.price.min, p.price.max, p.price.currency ?? "USD") : "—"}
                  {p.price?.unit ? <span className="text-xs text-zinc-400"> / {p.price.unit}</span> : null}
                </td>
                <td className="px-4 py-2"><ScoreBadge score={p.companyScore} /></td>
                <td className="px-4 py-2"><ConfidenceBadge score={p.confidence_score} /></td>
                <td className="px-4 py-2"><StatusChip status={p.intelligence_status} /></td>
              </tr>
            ))}
          </tbody>
        </table>
        {products.length === 0 && <p className="px-4 py-6 text-sm text-zinc-500">No products match.</p>}
      </div>

      <p className="text-xs text-zinc-400">
        Category, audience, topics and geography fill in as records are verified and the pipeline enriches
        them. “Company Score” is the parent company’s competitive score (product-level scoring comes later).
      </p>
    </div>
  );
}
