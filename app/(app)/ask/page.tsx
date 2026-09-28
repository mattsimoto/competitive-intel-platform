import Link from "next/link";
import { askIntelligence } from "@/lib/queries";

const EXAMPLES = [
  "Who competes in Events?",
  "Show offerings under $20,000",
  "Which companies overlap across Events and Communities?",
  "Who has the highest competitive scores?",
  "Show competitors in Webinars",
];

export default async function AskPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string }>;
}) {
  const { q } = await searchParams;
  const result = q ? await askIntelligence(q) : null;

  return (
    <div className="mx-auto max-w-3xl space-y-5">
      <div>
        <h1 className="text-xl font-semibold">Ask Intelligence</h1>
        <p className="mt-1 text-sm text-zinc-500">
          Answers come straight from your verified structured data with citations — never invented.
          This build understands the question types below; free-form natural language unlocks when the
          AI key is added.
        </p>
      </div>

      <form method="get" className="flex gap-2">
        <input
          type="text" name="q" defaultValue={q ?? ""} placeholder="Ask about competitors, areas, or pricing…"
          className="flex-1 rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900"
        />
        <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">Ask</button>
      </form>

      <div className="flex flex-wrap gap-2">
        {EXAMPLES.map((ex) => (
          <Link key={ex} href={`/ask?q=${encodeURIComponent(ex)}`}
            className="rounded-full border border-zinc-300 bg-white px-3 py-1 text-xs text-zinc-700 hover:bg-zinc-50">
            {ex}
          </Link>
        ))}
      </div>

      {result && (
        <div className="rounded-xl border border-zinc-200 bg-white p-5">
          <p className="text-sm font-medium text-zinc-900">{result.summary}</p>
          {result.records.length > 0 && (
            <ul className="mt-3 divide-y divide-zinc-100">
              {result.records.map((r, i) => (
                <li key={i} className="flex items-center justify-between py-2">
                  <span className="text-sm">
                    {r.href ? (
                      <Link href={r.href} className="font-medium text-zinc-900 hover:underline">{r.label}</Link>
                    ) : (
                      <span className="font-medium text-zinc-900">{r.label}</span>
                    )}
                  </span>
                  {r.sublabel && <span className="text-xs text-zinc-500">{r.sublabel}</span>}
                </li>
              ))}
            </ul>
          )}
          {result.caveat && (
            <p className="mt-3 border-t border-zinc-100 pt-3 text-xs text-zinc-400">{result.caveat}</p>
          )}
        </div>
      )}
    </div>
  );
}
