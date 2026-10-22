"use client";
import { useActionState } from "react";
import { importCompetitors, type ImportResult } from "./actions";

interface Opt { id: string; name: string }

export function ImportForm({ internalProducts, companyTypes }: { internalProducts: Opt[]; companyTypes: Opt[] }) {
  const [result, action, pending] = useActionState<ImportResult | null, FormData>(importCompetitors, null);

  return (
    <form action={action} className="space-y-3">
      <div className="grid gap-3 sm:grid-cols-2">
        <label className="block text-sm">
          <span className="text-zinc-600">Spreadsheet (.xlsx or .csv)</span>
          <input type="file" name="file" accept=".xlsx,.xls,.csv" required
            className="mt-1 block w-full text-sm file:mr-3 file:rounded-md file:border file:border-zinc-300 file:bg-white file:px-3 file:py-1.5 file:text-sm" />
        </label>
        <label className="block text-sm">
          <span className="text-zinc-600">These compete with (internal product)</span>
          <select name="internal_product_id" className="mt-1 block w-full rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm">
            <option value="">— none —</option>
            {internalProducts.map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}
          </select>
        </label>
        <label className="block text-sm">
          <span className="text-zinc-600">Company type (applied to all)</span>
          <select name="company_type_id" className="mt-1 block w-full rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm">
            <option value="">— unset —</option>
            {companyTypes.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}
          </select>
        </label>
        <label className="block text-sm">
          <span className="text-zinc-600">Name column (optional — auto-detected)</span>
          <input type="text" name="name_column" placeholder="e.g. PR FIRM"
            className="mt-1 block w-full rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900" />
        </label>
      </div>
      <button disabled={pending}
        className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800 disabled:opacity-50">
        {pending ? "Importing…" : "Import competitors"}
      </button>

      {result && (
        <div className={`rounded-md border px-4 py-3 text-sm ${result.ok ? "border-green-200 bg-green-50 text-green-800" : "border-red-200 bg-red-50 text-red-800"}`}>
          {result.ok ? (
            <>
              Imported from column <strong>{result.nameColumn}</strong>: {result.total} rows →{" "}
              <strong>{result.created}</strong> new competitors added, {result.existed} already existed
              {result.existed ? " (linked to the chosen product)" : ""}
              {result.skipped ? `, ${result.skipped} skipped (blank/duplicate)` : ""}.
            </>
          ) : (
            <>Import failed: {result.error}</>
          )}
        </div>
      )}
    </form>
  );
}
