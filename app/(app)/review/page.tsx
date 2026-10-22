import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { listPendingChanges, type ReviewItem } from "@/lib/queries";
import { reviewAction, bulkReview } from "./actions";
import { Pill } from "@/components/badges";
import { since } from "@/lib/format";

function ActionButton({
  id, action, label, tone, disabled,
}: { id: string; action: string; label: string; tone: string; disabled: boolean }) {
  const tones: Record<string, string> = {
    green: "bg-green-600 text-white hover:bg-green-700",
    red: "border border-red-300 text-red-700 hover:bg-red-50",
    zinc: "border border-zinc-300 text-zinc-700 hover:bg-zinc-50",
  };
  return (
    <form action={reviewAction}>
      <input type="hidden" name="id" value={id} />
      <input type="hidden" name="action" value={action} />
      <button
        type="submit" disabled={disabled}
        className={`rounded-md px-3 py-1.5 text-sm font-medium disabled:opacity-40 ${tones[tone]}`}
      >
        {label}
      </button>
    </form>
  );
}

function Card({ item, canReview }: { item: ReviewItem; canReview: boolean }) {
  const suggested = item.new_value_json?.text ?? (item.new_value_json ? JSON.stringify(item.new_value_json) : "—");
  const previous = item.previous_value_json?.text ?? (item.previous_value_json ? JSON.stringify(item.previous_value_json) : null);
  return (
    <div className="rounded-xl border border-zinc-200 bg-white p-4">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <div className="flex flex-wrap items-center gap-2">
          {canReview && (
            <input type="checkbox" name="ids" value={item.id} form="bulk" aria-label="Select for bulk action" />
          )}
          {item.company ? (
            <Link href={`/competitors/${item.company.id}`} className="font-medium text-zinc-900 hover:underline">
              {item.company.name}
            </Link>
          ) : (
            <span className="font-medium">Unknown company</span>
          )}
          <Pill tone="blue">{item.change_type.replace(/_/g, " ")}</Pill>
          <Pill tone="amber">sig {item.significance_score == null ? "—" : Math.round(item.significance_score)}</Pill>
          <Pill tone="gray">conf {item.confidence_score == null ? "—" : Math.round(item.confidence_score)}</Pill>
        </div>
        <span className="text-xs text-zinc-400">detected {since(item.detected_at)}</span>
      </div>

      <div className="mt-3 grid gap-3 md:grid-cols-2">
        <div>
          <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Previous value</div>
          <div className="mt-1 text-sm text-zinc-500">{previous ?? "— (first import)"}</div>
        </div>
        <div>
          <div className="text-xs font-medium uppercase tracking-wide text-zinc-500">Suggested value</div>
          <div className="mt-1 text-sm text-zinc-800">{suggested}</div>
        </div>
      </div>

      {item.evidence && (
        <details className="mt-3">
          <summary className="cursor-pointer text-sm text-blue-600">Supporting evidence</summary>
          <p className="mt-2 rounded-md bg-zinc-50 p-3 text-sm text-zinc-700">{item.evidence}</p>
          {item.source_url && (
            <a href={item.source_url} target="_blank" rel="noreferrer" className="mt-1 inline-block text-xs text-blue-600 hover:underline">
              {item.source_url}
            </a>
          )}
        </details>
      )}

      <div className="mt-4 flex flex-wrap gap-2">
        <ActionButton id={item.id} action="approve" label="Approve" tone="green" disabled={!canReview} />
        <ActionButton id={item.id} action="reject" label="Reject" tone="red" disabled={!canReview} />
        <ActionButton id={item.id} action="defer" label="Defer" tone="zinc" disabled={!canReview} />
        <ActionButton id={item.id} action="mark_duplicate" label="Mark duplicate" tone="zinc" disabled={!canReview} />
      </div>
    </div>
  );
}

export default async function ReviewQueuePage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("role").eq("id", user!.id).maybeSingle();
  const canReview = (profile as any)?.role === "administrator" || (profile as any)?.role === "analyst";

  const items = await listPendingChanges();

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Review Queue</h1>
        <span className="text-sm text-zinc-500">{items.length} pending{items.length === 100 ? "+" : ""}</span>
      </div>

      {!canReview && (
        <div className="rounded-md border border-amber-200 bg-amber-50 px-4 py-2 text-sm text-amber-800">
          Your role is read-only. Approving or rejecting requires the Analyst or Administrator role.
        </div>
      )}

      {canReview && items.length > 0 && (
        <form id="bulk" action={bulkReview} className="flex items-center gap-2 rounded-md border border-zinc-200 bg-white px-3 py-2 text-sm">
          <span className="text-zinc-500">With selected:</span>
          <button name="bulkAction" value="approve" className="rounded-md bg-green-600 px-3 py-1.5 font-medium text-white hover:bg-green-700">
            Approve selected
          </button>
          <button name="bulkAction" value="reject" className="rounded-md border border-red-300 px-3 py-1.5 font-medium text-red-700 hover:bg-red-50">
            Reject selected
          </button>
          <span className="text-xs text-zinc-400">Tick the boxes on the items below, then choose an action.</span>
        </form>
      )}

      {items.length === 0 ? (
        <p className="rounded-xl border border-zinc-200 bg-white px-4 py-8 text-sm text-zinc-500">
          Nothing pending. Detected changes and unverified imports appear here for approval.
        </p>
      ) : (
        <div className="space-y-3">
          {items.map((item) => <Card key={item.id} item={item} canReview={canReview} />)}
        </div>
      )}

      <p className="text-xs text-zinc-400">
        Approving verifies the linked evidence and clears the item; rejecting leaves the verified
        database unchanged. Every decision is recorded in the audit trail.
      </p>
    </div>
  );
}
