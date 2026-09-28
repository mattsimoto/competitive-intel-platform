import Link from "next/link";
import { listActivity } from "@/lib/queries";
import { Pill } from "@/components/badges";
import { since } from "@/lib/format";

const STATUSES = ["all", "pending", "approved", "rejected", "deferred", "auto_approved"];
const CHANGE_TYPES = [
  "all", "product_launch", "product_removal", "pricing_change", "feature_change",
  "topic_expansion", "event_launch", "audience_change", "customer_announcement",
  "partnership", "acquisition", "geographic_expansion", "rebrand",
  "positioning_change", "research_launch",
];

const STATUS_TONE: Record<string, string> = {
  pending: "amber", approved: "green", rejected: "red", deferred: "gray", auto_approved: "blue",
};

function label(s: string) {
  return s.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
}

export default async function ActivityPage({
  searchParams,
}: {
  searchParams: Promise<{ status?: string; type?: string }>;
}) {
  const { status = "all", type = "all" } = await searchParams;
  const rows = await listActivity({ status, changeType: type });

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Activity</h1>
        <span className="text-sm text-zinc-500">{rows.length} shown{rows.length === 200 ? "+" : ""}</span>
      </div>

      <form method="get" className="flex flex-wrap items-center gap-2">
        <select name="status" defaultValue={status} className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm">
          {STATUSES.map((s) => <option key={s} value={s}>{s === "all" ? "All statuses" : label(s)}</option>)}
        </select>
        <select name="type" defaultValue={type} className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm">
          {CHANGE_TYPES.map((t) => <option key={t} value={t}>{t === "all" ? "All change types" : label(t)}</option>)}
        </select>
        <button className="rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm hover:bg-zinc-50">Filter</button>
      </form>

      {rows.length === 0 ? (
        <p className="rounded-xl border border-zinc-200 bg-white px-4 py-8 text-sm text-zinc-500">
          No activity for this filter. Detected changes (from the pipeline or imports) appear here.
        </p>
      ) : (
        <div className="space-y-2">
          {rows.map((r) => (
            <div key={r.id} className="rounded-xl border border-zinc-200 bg-white p-4">
              <div className="flex flex-wrap items-center justify-between gap-2">
                <div className="flex flex-wrap items-center gap-2">
                  {r.company ? (
                    <Link href={`/competitors/${r.company.id}`} className="font-medium text-zinc-900 hover:underline">{r.company.name}</Link>
                  ) : <span className="font-medium">Unknown</span>}
                  <Pill tone="blue">{label(r.change_type)}</Pill>
                  <Pill tone={STATUS_TONE[r.status] ?? "gray"}>{label(r.status)}</Pill>
                  <Pill tone="amber">sig {r.significance_score == null ? "—" : Math.round(r.significance_score)}</Pill>
                  <Pill tone="gray">conf {r.confidence_score == null ? "—" : Math.round(r.confidence_score)}</Pill>
                </div>
                <span className="text-xs text-zinc-400">{since(r.detected_at)}</span>
              </div>
              {r.summary && <p className="mt-2 text-sm text-zinc-700">{r.summary}</p>}
              {r.evidence && (
                <details className="mt-2">
                  <summary className="cursor-pointer text-sm text-blue-600">Supporting evidence</summary>
                  <p className="mt-2 rounded-md bg-zinc-50 p-3 text-sm text-zinc-700">{r.evidence}</p>
                  {r.source_url && (
                    <a href={r.source_url} target="_blank" rel="noreferrer" className="mt-1 inline-block text-xs text-blue-600 hover:underline">{r.source_url}</a>
                  )}
                </details>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
