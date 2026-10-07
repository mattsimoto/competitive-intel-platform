"use client";

import Link from "next/link";
import { useActionState } from "react";
import { enrichCompany, type EnrichState } from "./actions";

const initial: EnrichState = { status: "idle", message: "" };

export function EnrichPanel({ companyId, canEdit, configured }: { companyId: string; canEdit: boolean; configured: boolean }) {
  const [state, action, pending] = useActionState(enrichCompany, initial);
  return (
    <div className="rounded-xl border border-zinc-200 bg-white p-4">
      <form action={action} className="flex flex-wrap items-center gap-3">
        <input type="hidden" name="companyId" value={companyId} />
        <button type="submit" disabled={pending || !canEdit || !configured}
          className="rounded-md bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:cursor-not-allowed disabled:opacity-50">
          {pending ? "Enriching…" : "Enrich now (AI)"}
        </button>
        <p className="text-xs text-zinc-600">
          {!canEdit ? "Administrator or Analyst access is required." : !configured ? "AI needs GROQ_API_KEY in the server environment and a redeploy." : "Reads up to 3 active sources and proposes evidence-backed findings for review."}
        </p>
      </form>
      <div aria-live="polite" aria-atomic="true" className="mt-2 text-sm">
        {pending ? <p className="text-zinc-600">Fetching source pages and analyzing them. This may take about a minute.</p> : state.message ? (
          <p className={state.status === "error" ? "text-red-700" : "text-zinc-700"}>
            {state.message} {state.created ? <Link href="/review" className="font-medium text-blue-600 underline">Open Review Queue</Link> : null}
          </p>
        ) : null}
      </div>
    </div>
  );
}
