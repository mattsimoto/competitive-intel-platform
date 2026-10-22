import Link from "next/link";
import { notFound } from "next/navigation";
import { getProduct } from "@/lib/queries";
import { ConfidenceBadge, StatusChip, Pill } from "@/components/badges";
import { money, since } from "@/lib/format";

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section className="rounded-xl border border-zinc-200 bg-white">
      <div className="border-b border-zinc-200 px-4 py-3 text-sm font-semibold">{title}</div>
      <div className="p-4">{children}</div>
    </section>
  );
}

export default async function ProductDetail({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const data = await getProduct(id);
  if (!data) notFound();
  const { product, pricing, features, topics, source } = data;
  const current = pricing[0] ?? null;
  const sourceTone = source?.status === "ok" ? "green" : source?.status === "error" ? "red" : "gray";

  return (
    <div className="space-y-5">
      <Link href="/products" className="text-sm text-blue-600 hover:underline">← Products</Link>

      <div className="rounded-xl border border-zinc-200 bg-white p-5">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div>
            <h1 className="text-xl font-semibold">{product.name}</h1>
            <div className="mt-1 text-sm text-zinc-500">
              {product.companies ? (
                <>by <Link href={`/competitors/${product.companies.id}`} className="text-blue-600 hover:underline">{product.companies.name}</Link></>
              ) : "—"}
            </div>
            <div className="mt-2 flex flex-wrap items-center gap-2">
              <StatusChip status={product.intelligence_status} />
              {product.product_categories?.name && <Pill tone="blue">{product.product_categories.name}</Pill>}
              {source && <Pill tone={sourceTone}>{source.status === "ok" ? "Source live" : source.status === "error" ? "Source dead/blocked" : "Uncrawled"}</Pill>}
              {product.product_url && (
                <a href={product.product_url} target="_blank" rel="noreferrer" className="text-xs text-blue-600 hover:underline break-all">{product.product_url}</a>
              )}
            </div>
          </div>
          <div className="text-right">
            <div className="text-xs uppercase tracking-wide text-zinc-500">Current Price</div>
            <div className="mt-1 text-lg font-semibold">
              {current ? money(current.price_min, current.price_max, current.currency ?? "USD") : "—"}
              {current?.pricing_unit ? <span className="text-sm font-normal text-zinc-400"> / {current.pricing_unit}</span> : null}
            </div>
            <div className="mt-1"><ConfidenceBadge score={product.confidence_score} /></div>
          </div>
        </div>
      </div>

      <Section title="Overview">
        {product.description ? (
          <p className="text-sm text-zinc-700">{product.description}</p>
        ) : (
          <p className="text-sm text-zinc-400">No description yet — resolves from the crawled page title/meta, or the AI extraction step.</p>
        )}
        <div className="mt-4 grid gap-4 md:grid-cols-2">
          <div>
            <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Topics</div>
            <div className="mt-1 flex flex-wrap gap-1">
              {topics.map((t: string) => <Pill key={t}>{t}</Pill>)}
              {topics.length === 0 && <span className="text-sm text-zinc-400">—</span>}
            </div>
          </div>
          <div>
            <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Audience / Geography</div>
            <div className="mt-1 text-sm text-zinc-700">
              {product.audience_description || product.geography || <span className="text-zinc-400">—</span>}
            </div>
          </div>
        </div>
      </Section>

      <Section title="Features">
        {features.length === 0 ? (
          <p className="text-sm text-zinc-400">No features recorded yet (populated by AI extraction).</p>
        ) : (
          <ul className="space-y-1 text-sm text-zinc-700">
            {features.map((f: any, i: number) => (
              <li key={i}><span className="font-medium">{f.feature_name}</span>{f.feature_value ? `: ${f.feature_value}` : ""}</li>
            ))}
          </ul>
        )}
      </Section>

      <Section title="Price History">
        {pricing.length === 0 ? (
          <p className="text-sm text-zinc-400">No pricing on file.</p>
        ) : (
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
                <th className="py-2 font-medium">Price</th>
                <th className="py-2 font-medium">Observed</th>
                <th className="py-2 font-medium">Confidence</th>
                <th className="py-2 font-medium">Source text</th>
              </tr>
            </thead>
            <tbody>
              {pricing.map((row: any) => (
                <tr key={row.id} className="border-b border-zinc-100 align-top">
                  <td className="py-2 whitespace-nowrap">{money(row.price_min, row.price_max, row.currency ?? "USD")}</td>
                  <td className="py-2 whitespace-nowrap text-zinc-500">{since(row.observed_at)}</td>
                  <td className="py-2"><ConfidenceBadge score={row.confidence_score} /></td>
                  <td className="py-2 max-w-md truncate text-zinc-500" title={row.raw_price_text ?? ""}>{row.raw_price_text ?? "—"}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </Section>
    </div>
  );
}
