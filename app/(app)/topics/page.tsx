import Link from "next/link";
import { listTopics } from "@/lib/queries";
import { since } from "@/lib/format";
import { ExportDialog } from "@/components/ExportDialog";

const EXPORT_COLUMNS = [
  { key: "name", label: "Topic" },
  { key: "active_competitors", label: "Active Competitors" },
  { key: "new_30", label: "New (30d)" },
  { key: "new_90", label: "New (90d)" },
  { key: "active_products", label: "Active Products" },
  { key: "recent_activity", label: "Recent Activity" },
];

export default async function TopicsPage() {
  const topics = await listTopics();
  const anyData = topics.some((t) => t.activeCompetitors > 0 || t.activeProducts > 0);

  const exportRows = topics.map((t) => ({
    name: t.name,
    active_competitors: t.activeCompetitors,
    new_30: t.newEntrants30,
    new_90: t.newEntrants90,
    active_products: t.activeProducts,
    recent_activity: t.recentActivity,
  }));

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Markets &amp; Topics</h1>
        <div className="flex items-center gap-3">
          <span className="text-sm text-zinc-500">{topics.length} topics</span>
          <ExportDialog filename="topics" columns={EXPORT_COLUMNS} rows={exportRows} />
        </div>
      </div>

      {!anyData && (
        <div className="rounded-md border border-amber-200 bg-amber-50 px-4 py-2 text-sm text-amber-800">
          Topics are defined but not yet linked to competitors. Links are created when the ingestion
          pipeline extracts topics from monitored sources — counts below fill in automatically then.
        </div>
      )}

      <div className="overflow-x-auto rounded-xl border border-zinc-200 bg-white">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
              <th className="px-4 py-2 font-medium">Topic</th>
              <th className="px-4 py-2 font-medium">Active Competitors</th>
              <th className="px-4 py-2 font-medium">New (30d)</th>
              <th className="px-4 py-2 font-medium">New (90d)</th>
              <th className="px-4 py-2 font-medium">Active Products</th>
              <th className="px-4 py-2 font-medium">Recent Activity</th>
            </tr>
          </thead>
          <tbody>
            {topics.map((t) => (
              <tr key={t.id} className="border-b border-zinc-100 hover:bg-zinc-50">
                <td className="px-4 py-2">
                  <Link href={`/topics/${t.id}`} className="font-medium text-zinc-900 hover:underline">{t.name}</Link>
                </td>
                <td className="px-4 py-2 tabular-nums">{t.activeCompetitors}</td>
                <td className="px-4 py-2 tabular-nums">{t.newEntrants30}</td>
                <td className="px-4 py-2 tabular-nums">{t.newEntrants90}</td>
                <td className="px-4 py-2 tabular-nums">{t.activeProducts}</td>
                <td className="px-4 py-2 text-zinc-500">{since(t.recentActivity)}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
