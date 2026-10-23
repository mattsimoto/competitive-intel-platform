import Link from "next/link";
import { getCurrentUser, canEditRole } from "@/lib/auth";
import { listBriefs } from "@/lib/queries";
import { generateBrief } from "./actions";
import { Pill } from "@/components/badges";
import { since } from "@/lib/format";

export default async function NewsPage() {
  const me = await getCurrentUser();
  const canGenerate = canEditRole(me?.role ?? null);

  const briefs = await listBriefs();

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Product News</h1>
        {canGenerate && (
          <form action={generateBrief}>
            <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">
              Generate brief
            </button>
          </form>
        )}
      </div>

      <p className="text-sm text-zinc-500">
        Pulls the latest cybersecurity developments on demand. With the AI key set, each pull is analyzed
        into a ranked brief with go-to-market implications and confirmed-vs-inference tagging; without it,
        you get the dated, linked headlines.
      </p>

      {briefs.length === 0 ? (
        <p className="rounded-xl border border-zinc-200 bg-white px-4 py-8 text-sm text-zinc-500">
          No briefs yet. Click <span className="font-medium">Generate brief</span> to pull the latest news.
        </p>
      ) : (
        <div className="divide-y divide-zinc-100 rounded-xl border border-zinc-200 bg-white">
          {briefs.map((b) => (
            <Link key={b.id} href={`/news/${b.id}`} className="flex items-center justify-between px-4 py-3 hover:bg-zinc-50">
              <div className="flex items-center gap-2">
                <span className="font-medium text-zinc-900">{b.title}</span>
                <Pill tone={b.kind === "ai" ? "green" : "gray"}>{b.kind === "ai" ? "Analyzed" : "Headlines"}</Pill>
              </div>
              <span className="text-xs text-zinc-400">
                {b.source_count != null ? `${b.source_count} sources · ` : ""}{since(b.generated_at)}
              </span>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
