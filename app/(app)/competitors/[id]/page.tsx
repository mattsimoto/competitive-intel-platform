import Link from "next/link";
import { notFound } from "next/navigation";
import { getCompanyProfile } from "@/lib/queries";
import { createClient } from "@/lib/supabase/server";
import { ScoreBadge, ConfidenceBadge, StatusChip, Pill } from "@/components/badges";
import { ScoreBreakdown } from "@/components/ScoreBreakdown";
import { addSource, updateSource, deleteSource, recrawlSource, enrichCompanyNow } from "./actions";
import { fetchSourceNow } from "../../sources/actions";
import { money, since } from "@/lib/format";

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section className="rounded-xl border border-zinc-200 bg-white">
      <div className="border-b border-zinc-200 px-4 py-3 text-sm font-semibold">{title}</div>
      <div className="p-4">{children}</div>
    </section>
  );
}

export default async function CompetitorProfile({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const data = await getCompanyProfile(id);
  if (!data) notFound();
  const { company, products, areas, relationships, topics, customers, strengths, weaknesses, score, sources, sourceTypes } = data;

  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("role").eq("id", user!.id).maybeSingle();
  const canEdit = ["administrator", "analyst"].includes((profile as any)?.role);
  const aiEnabled = !!process.env.GROQ_API_KEY;

  return (
    <div className="space-y-5">
      <div className="flex items-center justify-between">
        <Link href="/competitors" className="text-sm text-blue-600 hover:underline">← Competitors</Link>
        {canEdit && (aiEnabled ? (
          <form action={enrichCompanyNow}>
            <input type="hidden" name="companyId" value={company.id} />
            <button className="rounded-md bg-zinc-900 px-3 py-1.5 text-sm font-medium text-white hover:bg-zinc-800">
              Enrich now (AI)
            </button>
          </form>
        ) : (
          <span className="text-xs text-zinc-400" title="Set ANTHROPIC_API_KEY in Vercel to enable">
            Enrich now · needs AI key
          </span>
        ))}
      </div>

      {/* Header */}
      <div className="rounded-xl border border-zinc-200 bg-white p-5">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div>
            <h1 className="text-xl font-semibold">{company.name}</h1>
            {company.website_url && (
              <a href={company.website_url} target="_blank" rel="noreferrer"
                 className="text-sm text-blue-600 hover:underline">
                {company.website_url}
              </a>
            )}
            <div className="mt-2 flex flex-wrap items-center gap-2">
              <StatusChip status={company.intelligence_status} />
              {(company.company_types as any)?.name && <Pill>{(company.company_types as any).name}</Pill>}
              {company.original_import_reference && (
                <span className="text-xs text-zinc-400">Imported: {company.original_import_reference}</span>
              )}
            </div>
          </div>
          <div className="flex gap-6">
            <div>
              <div className="text-xs uppercase tracking-wide text-zinc-500">Competitive Score</div>
              <div className="mt-1"><ScoreBadge score={company.competitive_score} /></div>
            </div>
            <div>
              <div className="text-xs uppercase tracking-wide text-zinc-500">Confidence</div>
              <div className="mt-1"><ConfidenceBadge score={company.confidence_score} /></div>
            </div>
            <div>
              <div className="text-xs uppercase tracking-wide text-zinc-500">Last Verified</div>
              <div className="mt-1 text-sm text-zinc-700">{since(company.last_verified_at)}</div>
            </div>
          </div>
        </div>
      </div>

      {/* Score breakdown */}
      <Section title="Score Breakdown">
        <ScoreBreakdown score={score} />
      </Section>

      {/* Overview */}
      <Section title="Overview">
        {company.description ? (
          <p className="text-sm text-zinc-700">{company.description}</p>
        ) : (
          <p className="text-sm text-zinc-400">
            No AI summary yet — generated from verified intelligence once the extraction pipeline runs.
          </p>
        )}

        <div className="mt-4 grid gap-4 md:grid-cols-2">
          <div>
            <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Competitive Areas</div>
            <div className="mt-1 flex flex-wrap gap-1">
              {areas.map((a) => <Pill key={a} tone="blue">{a}</Pill>)}
              {areas.length === 0 && <span className="text-sm text-zinc-400">—</span>}
            </div>
          </div>
          <div>
            <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Topics</div>
            <div className="mt-1 flex flex-wrap gap-1">
              {topics.map((t: string) => <Pill key={t}>{t}</Pill>)}
              {topics.length === 0 && <span className="text-sm text-zinc-400">—</span>}
            </div>
          </div>
        </div>

        <div className="mt-4 grid gap-4 md:grid-cols-2">
          <div>
            <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Strengths (from source)</div>
            <ul className="mt-1 space-y-1 text-sm text-zinc-700">
              {strengths.map((s: string, i: number) => <li key={i} className="border-l-2 border-green-300 pl-2">{s}</li>)}
              {strengths.length === 0 && <li className="text-zinc-400">—</li>}
            </ul>
          </div>
          <div>
            <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Weaknesses (from source)</div>
            <ul className="mt-1 space-y-1 text-sm text-zinc-700">
              {weaknesses.map((s: string, i: number) => <li key={i} className="border-l-2 border-orange-300 pl-2">{s}</li>)}
              {weaknesses.length === 0 && <li className="text-zinc-400">—</li>}
            </ul>
          </div>
        </div>

        <div className="mt-4">
          <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Known Customers</div>
          <div className="mt-1 flex flex-wrap gap-1">
            {customers.map((c: string) => <Pill key={c}>{c}</Pill>)}
            {customers.length === 0 && <span className="text-sm text-zinc-400">—</span>}
          </div>
        </div>
      </Section>

      {/* Products */}
      <Section title={`Products (${products.length})`}>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
                <th className="px-2 py-2 font-medium">Product</th>
                <th className="px-2 py-2 font-medium">Price</th>
                <th className="px-2 py-2 font-medium">Status</th>
                <th className="px-2 py-2 font-medium">URL</th>
              </tr>
            </thead>
            <tbody>
              {products.map((p: any) => (
                <tr key={p.id} className="border-b border-zinc-100">
                  <td className="px-2 py-2 font-medium text-zinc-900">{p.name}</td>
                  <td className="px-2 py-2">{p.price ? money(p.price.price_min, p.price.price_max, p.price.currency) : "—"}</td>
                  <td className="px-2 py-2"><StatusChip status={p.intelligence_status} /></td>
                  <td className="px-2 py-2">
                    {p.product_url ? (
                      <a href={p.product_url} target="_blank" rel="noreferrer" className="text-blue-600 hover:underline">link</a>
                    ) : "—"}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          {products.length === 0 && <p className="py-4 text-sm text-zinc-400">No product records.</p>}
        </div>
      </Section>

      {/* Pricing history */}
      <Section title="Pricing History">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
                <th className="px-2 py-2 font-medium">Price</th>
                <th className="px-2 py-2 font-medium">Observed</th>
                <th className="px-2 py-2 font-medium">Confidence</th>
                <th className="px-2 py-2 font-medium">Source text</th>
              </tr>
            </thead>
            <tbody>
              {data.pricing.map((row: any) => (
                <tr key={row.id} className="border-b border-zinc-100 align-top">
                  <td className="px-2 py-2 whitespace-nowrap">{money(row.price_min, row.price_max, row.currency)}</td>
                  <td className="px-2 py-2 whitespace-nowrap text-zinc-500">{since(row.observed_at)}</td>
                  <td className="px-2 py-2"><ConfidenceBadge score={row.confidence_score} /></td>
                  <td className="px-2 py-2 max-w-md truncate text-zinc-500" title={row.raw_price_text ?? ""}>
                    {row.raw_price_text ?? "—"}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          {data.pricing.length === 0 && <p className="py-4 text-sm text-zinc-400">No pricing on file.</p>}
        </div>
      </Section>

      {/* Sources */}
      <Section title={`Sources (${sources.length})`}>
        <div className="space-y-2">
          {sources.map((s: any) => {
            const tone = s.status === "ok" ? "green" : s.status === "error" ? "red" : "gray";
            const statusLabel = s.status === "never_run" ? "Never run" : s.status.replace(/\b\w/, (c: string) => c.toUpperCase());
            return (
              <div key={s.id} className="rounded-lg border border-zinc-200 p-3">
                {canEdit ? (
                  <>
                    <form action={updateSource} className="space-y-2">
                      <input type="hidden" name="id" value={s.id} />
                      <input type="hidden" name="companyId" value={company.id} />
                      <input
                        type="url" name="url" defaultValue={s.url}
                        className="w-full rounded-md border border-zinc-300 px-2 py-1 text-sm outline-none focus:border-zinc-900"
                      />
                      <div className="flex flex-wrap items-center gap-3 text-sm">
                        {s.type && <Pill>{s.type}</Pill>}
                        <Pill tone={tone}>{statusLabel}</Pill>
                        <label className="flex items-center gap-1 text-zinc-600">
                          Priority
                          <input type="number" name="priority" defaultValue={s.priority} min={1} max={9}
                            className="w-14 rounded-md border border-zinc-300 px-2 py-0.5" />
                        </label>
                        <label className="flex items-center gap-1 text-zinc-600">
                          <input type="checkbox" name="active" defaultChecked={s.active} /> Active
                        </label>
                        <span className="text-xs text-zinc-400">checked {since(s.last_checked_at)}</span>
                        <button className="rounded-md bg-zinc-900 px-3 py-1 text-xs font-medium text-white hover:bg-zinc-800">Save</button>
                      </div>
                      {s.status === "error" && s.last_error && <div className="text-xs text-red-600">{s.last_error}</div>}
                    </form>
                    <div className="mt-2 flex flex-wrap items-center gap-2">
                      <form action={fetchSourceNow}>
                        <input type="hidden" name="sourceId" value={s.id} />
                        <input type="hidden" name="companyId" value={company.id} />
                        <input type="hidden" name="goToSnapshot" value="1" />
                        <button className="rounded-md bg-zinc-900 px-2 py-1 text-xs font-medium text-white hover:bg-zinc-800">Fetch now</button>
                      </form>
                      <Link href={`/sources/${s.id}`} className="rounded-md border border-zinc-300 px-2 py-1 text-xs hover:bg-zinc-50">Snapshot</Link>
                      <form action={recrawlSource}>
                        <input type="hidden" name="id" value={s.id} />
                        <input type="hidden" name="companyId" value={company.id} />
                        <button className="rounded-md border border-zinc-300 px-2 py-1 text-xs hover:bg-zinc-50">Reset for crawl</button>
                      </form>
                      <form action={deleteSource}>
                        <input type="hidden" name="id" value={s.id} />
                        <input type="hidden" name="companyId" value={company.id} />
                        <button className="rounded-md border border-red-300 px-2 py-1 text-xs text-red-700 hover:bg-red-50">Delete</button>
                      </form>
                    </div>
                  </>
                ) : (
                  <div className="flex flex-wrap items-center gap-3 text-sm">
                    <a href={s.url} target="_blank" rel="noreferrer" className="text-blue-600 hover:underline break-all">{s.name ?? s.url}</a>
                    {s.type && <Pill>{s.type}</Pill>}
                    <Pill tone={tone}>{statusLabel}</Pill>
                    <span className="text-xs text-zinc-400">checked {since(s.last_checked_at)}</span>
                    {s.status === "error" && s.last_error && <span className="text-xs text-red-600">{s.last_error}</span>}
                    <Link href={`/sources/${s.id}`} className="text-xs text-blue-600 hover:underline">Snapshot</Link>
                  </div>
                )}
              </div>
            );
          })}
          {sources.length === 0 && <p className="py-2 text-sm text-zinc-400">No monitored sources.</p>}
        </div>

        {canEdit && (
          <form action={addSource} className="mt-4 flex flex-wrap items-center gap-2 border-t border-zinc-200 pt-4">
            <input type="hidden" name="companyId" value={company.id} />
            <input type="url" name="url" required placeholder="https://competitor.com/pricing"
              className="min-w-[16rem] flex-1 rounded-md border border-zinc-300 px-2 py-1 text-sm outline-none focus:border-zinc-900" />
            <select name="source_type_id" className="rounded-md border border-zinc-300 bg-white px-2 py-1 text-sm">
              <option value="">Type…</option>
              {sourceTypes.map((t: any) => <option key={t.id} value={t.id}>{t.name}</option>)}
            </select>
            <button className="rounded-md border border-zinc-300 px-3 py-1 text-sm hover:bg-zinc-50">Add source</button>
          </form>
        )}

        <p className="mt-3 text-xs text-zinc-400">
          Fix a dead URL and Save to reset it for a clean re-crawl; “Re-crawl” forces a fresh fetch on the
          next run; toggle Active to stop crawling one. Changes take effect on the next pipeline run.
        </p>
      </Section>

      {relationships.length > 0 && relationships.some((r: any) => r.notes) && (
        <p className="text-xs text-zinc-400">
          Note: some competitive relationships carry unmapped source tokens routed to review.
        </p>
      )}
    </div>
  );
}
