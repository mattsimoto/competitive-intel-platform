import Link from "next/link";
import { notFound } from "next/navigation";
import { getSourceSnapshot } from "@/lib/queries";
import { fetchSourceNow } from "../actions";
import { suggestPrices } from "@/lib/fetchPage";
import { Pill } from "@/components/badges";
import { since } from "@/lib/format";

export default async function SnapshotPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const data = await getSourceSnapshot(id);
  if (!data) notFound();
  const { source, doc } = data as any;

  const tone = source.status === "ok" ? "green" : source.status === "error" ? "red" : "gray";
  const text: string = doc?.cleaned_text ?? "";
  const prices = text ? suggestPrices(text) : [];
  const metaDesc = doc?.metadata_json?.description ?? null;

  return (
    <div className="mx-auto max-w-3xl space-y-4">
      {source.companies && (
        <Link href={`/competitors/${source.companies.id}`} className="text-sm text-blue-600 hover:underline">
          ← {source.companies.name}
        </Link>
      )}

      <div className="rounded-xl border border-zinc-200 bg-white p-5">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div className="min-w-0">
            <div className="flex flex-wrap items-center gap-2">
              {source.source_types?.name && <Pill>{source.source_types.name}</Pill>}
              <Pill tone={tone}>{source.status === "never_run" ? "Never run" : source.status.replace(/\b\w/, (c: string) => c.toUpperCase())}</Pill>
              <span className="text-xs text-zinc-400">checked {since(source.last_checked_at)}</span>
            </div>
            <a href={source.url} target="_blank" rel="noreferrer" className="mt-1 block break-all text-sm text-blue-600 hover:underline">{source.url}</a>
            {source.status === "error" && source.last_error && <p className="mt-1 text-sm text-red-600">{source.last_error}</p>}
          </div>
          <form action={fetchSourceNow}>
            <input type="hidden" name="sourceId" value={source.id} />
            <input type="hidden" name="companyId" value={source.company_id} />
            <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">Fetch now</button>
          </form>
        </div>
      </div>

      {!doc ? (
        <p className="rounded-xl border border-zinc-200 bg-white px-4 py-8 text-sm text-zinc-500">
          No snapshot yet. Click <span className="font-medium">Fetch now</span> to pull this page.
        </p>
      ) : (
        <>
          {prices.length > 0 && (
            <div className="rounded-xl border border-amber-200 bg-amber-50 p-4">
              <div className="text-sm font-medium text-amber-900">Prices detected on the page</div>
              <div className="mt-2 flex flex-wrap gap-1">
                {prices.map((p) => <Pill key={p} tone="amber">{p}</Pill>)}
              </div>
              <p className="mt-2 text-xs text-amber-800">
                Heuristic only — verify against the page, then enter the real price via the product’s
                pricing (this does not save anything automatically).
              </p>
            </div>
          )}

          <div className="rounded-xl border border-zinc-200 bg-white p-5">
            <div className="text-xs uppercase tracking-wide text-zinc-500">Snapshot · fetched {since(doc.fetched_at)}</div>
            {doc.title && <h1 className="mt-1 text-lg font-semibold">{doc.title}</h1>}
            {metaDesc && <p className="mt-1 text-sm text-zinc-600">{metaDesc}</p>}
            <div className="mt-4 max-h-[28rem] overflow-y-auto whitespace-pre-wrap rounded-md bg-zinc-50 p-4 text-sm leading-relaxed text-zinc-800">
              {text.slice(0, 12000) || "(no text extracted — the page may be JavaScript-rendered or blocked)"}
              {text.length > 12000 && <div className="mt-2 text-xs text-zinc-400">… preview truncated ({text.length.toLocaleString()} chars total)</div>}
            </div>
          </div>

          <p className="text-xs text-zinc-400">
            Read the snapshot, then update the competitor, product, or pricing yourself using the edit
            controls on their pages. Nothing here is auto-written — analysis stays with you (or the AI key).
          </p>
        </>
      )}
    </div>
  );
}
