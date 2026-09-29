import Link from "next/link";
import { listProducts } from "@/lib/queries";
import { ScoreBadge, ConfidenceBadge, Pill } from "@/components/badges";
import { money } from "@/lib/format";

function SourceBadge({ status, error }: { status: string | null; error: string | null }) {
  if (status === "ok") return <Pill tone="green">Live</Pill>;
  if (status === "error") return <span title={error ?? ""}><Pill tone="red">Dead / blocked</Pill></span>;
  return <Pill tone="gray">Uncrawled</Pill>;
}

export default async function ProductsPage({
  searchParams,
}: {
  searchParams: Promise<{ search?: string; view?: string }>;
}) {
  const { search, view = "all" } = await searchParams;
  const products = await listProducts(search, view);

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Products</h1>
        <span className="text-sm text-zinc-500">{products.length} shown</span>
      </div>

      <form method="get" className="flex flex-wrap gap-2">
        <input
          type="text" name="search" defaultValue={search ?? ""} placeholder="Search product name…"
          className="w-64 rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900"
        />
        <select name="view" defaultValue={view} className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm">
          <option value="all">All products</option>
          <option value="live">Crawled OK (live sources)</option>
          <option value="priced">Has a price</option>
        </select>
        <button className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm hover:bg-zinc-50">Apply</button>
      </form>

      <div className="overflow-x-auto rounded-xl border border-zinc-200 bg-white">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
              <th className="px-4 py-2 font-medium">Product</th>
              <th className="px-4 py-2 font-medium">Company</th>
              <th className="px-4 py-2 font-medium">Source</th>
              <th className="px-4 py-2 font-medium">Price</th>
              <th className="px-4 py-2 font-medium">Company Score</th>
              <th className="px-4 py-2 font-medium">Confidence</th>
            </tr>
          </thead>
          <tbody>
            {products.map((p) => (
              <tr key={p.id} className="border-b border-zinc-100 hover:bg-zinc-50">
                <td className="px-4 py-2 font-medium text-zinc-900">
                  <Link href={`/products/${p.id}`} className="hover:underline">{p.name}</Link>
                  {p.product_url && <a href={p.product_url} target="_blank" rel="noreferrer" className="ml-1 text-xs text-zinc-400 hover:text-blue-600">↗</a>}
                </td>
                <td className="px-4 py-2">
                  {p.company ? (
                    <Link href={`/competitors/${p.company.id}`} className="text-zinc-700 hover:underline">{p.company.name}</Link>
                  ) : "—"}
                </td>
                <td className="px-4 py-2"><SourceBadge status={p.sourceStatus} error={p.sourceError} /></td>
                <td className="px-4 py-2 whitespace-nowrap">
                  {p.price ? money(p.price.min, p.price.max, p.price.currency ?? "USD") : "—"}
                  {p.price?.unit ? <span className="text-xs text-zinc-400"> / {p.price.unit}</span> : null}
                </td>
                <td className="px-4 py-2"><ScoreBadge score={p.companyScore} /></td>
                <td className="px-4 py-2"><ConfidenceBadge score={p.confidence_score} /></td>
              </tr>
            ))}
          </tbody>
        </table>
        {products.length === 0 && <p className="px-4 py-6 text-sm text-zinc-500">No products match.</p>}
      </div>

      <p className="text-xs text-zinc-400">
        Many products are still URL-derived stubs from the seed. Once a product’s page is crawled, its
        name/description resolve from the page (run <code>select resolve_products_from_crawl();</code>),
        and “Dead / blocked” flags links that 404 or reject crawling. A single product with its own price
        comes from the AI extraction step once the key is added.
      </p>
    </div>
  );
}
