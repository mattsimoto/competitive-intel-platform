import Link from "next/link";
import { getDashboardStats, listCompanies } from "@/lib/queries";
import { ScoreBadge, ConfidenceBadge, Pill } from "@/components/badges";
import { since } from "@/lib/format";

function Kpi({ label, value, hint }: { label: string; value: number | string; hint?: string }) {
  return (
    <div className="rounded-xl border border-zinc-200 bg-white p-4">
      <div className="text-2xl font-semibold tabular-nums">{value}</div>
      <div className="mt-1 text-sm text-zinc-600">{label}</div>
      {hint && <div className="mt-0.5 text-xs text-zinc-400">{hint}</div>}
    </div>
  );
}

export default async function DashboardPage() {
  const [stats, companies] = await Promise.all([getDashboardStats(), listCompanies()]);
  const top = companies.slice(0, 15);

  return (
    <div className="space-y-6">
      <h1 className="text-xl font-semibold">Dashboard</h1>

      <div className="grid grid-cols-2 gap-3 md:grid-cols-4 lg:grid-cols-7">
        <Kpi label="Tracked Competitors" value={stats.trackedCompetitors} />
        <Kpi label="Active Offerings" value={stats.activeOfferings} />
        <Kpi label="Changes This Week" value={stats.changesThisWeek} />
        <Kpi label="New Competitors (30d)" value={stats.newCompetitors} />
        <Kpi label="Pricing Changes (mo)" value={stats.pricingChangesThisMonth} />
        <Kpi label="Requiring Review" value={stats.pendingReviews} />
        <Kpi label="Coverage Score" value={`${stats.coverageScore}%`} hint="have product data" />
      </div>

      <section className="rounded-xl border border-zinc-200 bg-white">
        <div className="flex items-center justify-between border-b border-zinc-200 px-4 py-3">
          <h2 className="text-sm font-semibold">Competitive Landscape</h2>
          <Link href="/competitors" className="text-sm text-blue-600 hover:underline">View all →</Link>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
                <th className="px-4 py-2 font-medium">Company</th>
                <th className="px-4 py-2 font-medium">Score</th>
                <th className="px-4 py-2 font-medium">Confidence</th>
                <th className="px-4 py-2 font-medium">Primary Competitive Areas</th>
                <th className="px-4 py-2 font-medium">Last Verified</th>
              </tr>
            </thead>
            <tbody>
              {top.map((c) => (
                <tr key={c.id} className="border-b border-zinc-100 hover:bg-zinc-50">
                  <td className="px-4 py-2">
                    <Link href={`/competitors/${c.id}`} className="font-medium text-zinc-900 hover:underline">
                      {c.name}
                    </Link>
                  </td>
                  <td className="px-4 py-2"><ScoreBadge score={c.competitive_score} /></td>
                  <td className="px-4 py-2"><ConfidenceBadge score={c.confidence_score} /></td>
                  <td className="px-4 py-2">
                    <div className="flex flex-wrap gap-1">
                      {c.areas.slice(0, 4).map((a) => <Pill key={a} tone="blue">{a}</Pill>)}
                      {c.areas.length === 0 && <span className="text-zinc-400">—</span>}
                    </div>
                  </td>
                  <td className="px-4 py-2 text-zinc-500">{since(c.last_verified_at)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {top.length === 0 && (
          <p className="px-4 py-6 text-sm text-zinc-500">
            No companies visible. Confirm the seed loaded and that your account has a row in
            <code> public.users</code> for this organization.
          </p>
        )}
      </section>

      <p className="text-xs text-zinc-400">
        Competitive scores show “Not yet scored” until the scoring engine (a later sprint) runs.
        Confidence reflects the imported records’ default of 60 (Needs Verification).
      </p>
    </div>
  );
}
