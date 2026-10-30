import Link from "next/link";
import { listCompanies } from "@/lib/queries";
import { ScoreBadge, ConfidenceBadge, StatusChip, Pill } from "@/components/badges";
import { since } from "@/lib/format";
import { ExportDialog } from "@/components/ExportDialog";

const EXPORT_COLUMNS = [
  { key: "name", label: "Company" },
  { key: "score", label: "Competitive Score" },
  { key: "confidence", label: "Confidence" },
  { key: "status", label: "Status" },
  { key: "areas", label: "Competitive Areas" },
  { key: "last_verified", label: "Last Verified" },
];

export default async function CompetitorsPage({
  searchParams,
}: {
  searchParams: Promise<{ search?: string }>;
}) {
  const { search } = await searchParams;
  const companies = await listCompanies(search);

  const exportRows = companies.map((c) => ({
    name: c.name,
    score: c.competitive_score,
    confidence: c.confidence_score,
    status: c.intelligence_status,
    areas: c.areas.join("; "),
    last_verified: c.last_verified_at,
  }));

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Competitors</h1>
        <div className="flex items-center gap-3">
          <span className="text-sm text-zinc-500">{companies.length} shown</span>
          <ExportDialog filename="competitors" columns={EXPORT_COLUMNS} rows={exportRows} />
        </div>
      </div>

      <form method="get" className="flex gap-2">
        <input
          type="text" name="search" defaultValue={search ?? ""} placeholder="Search company name…"
          className="w-72 rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900"
        />
        <button className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm hover:bg-zinc-50">
          Search
        </button>
      </form>

      <div className="overflow-x-auto rounded-xl border border-zinc-200 bg-white">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
              <th className="px-4 py-2 font-medium">Company</th>
              <th className="px-4 py-2 font-medium">Score</th>
              <th className="px-4 py-2 font-medium">Confidence</th>
              <th className="px-4 py-2 font-medium">Status</th>
              <th className="px-4 py-2 font-medium">Competitive Areas</th>
              <th className="px-4 py-2 font-medium">Last Verified</th>
            </tr>
          </thead>
          <tbody>
            {companies.map((c) => (
              <tr key={c.id} className="border-b border-zinc-100 hover:bg-zinc-50">
                <td className="px-4 py-2">
                  <Link href={`/competitors/${c.id}`} className="font-medium text-zinc-900 hover:underline">
                    {c.name}
                  </Link>
                </td>
                <td className="px-4 py-2"><ScoreBadge score={c.competitive_score} /></td>
                <td className="px-4 py-2"><ConfidenceBadge score={c.confidence_score} /></td>
                <td className="px-4 py-2"><StatusChip status={c.intelligence_status} /></td>
                <td className="px-4 py-2">
                  <div className="flex flex-wrap gap-1">
                    {c.areas.slice(0, 3).map((a) => <Pill key={a} tone="blue">{a}</Pill>)}
                    {c.areas.length > 3 && <span className="text-xs text-zinc-400">+{c.areas.length - 3}</span>}
                    {c.areas.length === 0 && <span className="text-zinc-400">—</span>}
                  </div>
                </td>
                <td className="px-4 py-2 text-zinc-500">{since(c.last_verified_at)}</td>
              </tr>
            ))}
          </tbody>
        </table>
        {companies.length === 0 && (
          <p className="px-4 py-6 text-sm text-zinc-500">No companies match.</p>
        )}
      </div>
    </div>
  );
}
