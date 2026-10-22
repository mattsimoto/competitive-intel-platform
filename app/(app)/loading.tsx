/** Shown instantly on every in-app navigation while the server renders the real
 *  page. Without this boundary the browser stays on the previous view until the
 *  next page's data is fully fetched, which makes sidebar switches feel frozen. */
export default function Loading() {
  return (
    <div className="space-y-5 animate-pulse" aria-busy="true" aria-label="Loading">
      <div className="h-7 w-48 rounded bg-zinc-200" />

      <div className="grid gap-3 sm:grid-cols-3">
        {Array.from({ length: 3 }).map((_, i) => (
          <div key={i} className="rounded-xl border border-zinc-200 bg-white p-4">
            <div className="h-4 w-20 rounded bg-zinc-200" />
            <div className="mt-3 h-6 w-16 rounded bg-zinc-200" />
          </div>
        ))}
      </div>

      <div className="rounded-xl border border-zinc-200 bg-white">
        <div className="border-b border-zinc-200 px-4 py-3">
          <div className="h-4 w-32 rounded bg-zinc-200" />
        </div>
        <div className="divide-y divide-zinc-100">
          {Array.from({ length: 6 }).map((_, i) => (
            <div key={i} className="flex items-center gap-4 px-4 py-3">
              <div className="h-4 w-40 rounded bg-zinc-200" />
              <div className="h-4 w-24 rounded bg-zinc-100" />
              <div className="ml-auto h-4 w-16 rounded bg-zinc-100" />
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
