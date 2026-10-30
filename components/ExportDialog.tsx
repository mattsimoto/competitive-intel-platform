"use client";

import { useEffect, useRef, useState } from "react";
import { runExport, type ExportColumn, type ExportRow } from "@/lib/exporter";

/**
 * Reusable export control: a button that opens a modal where the user picks
 * which columns to include and whether to download CSV or Excel (.xlsx).
 * Pages pass plain, serializable columns ({key,label}) and flattened rows.
 */
export function ExportDialog({
  filename,
  columns,
  rows,
  label = "Export",
  className,
}: {
  filename: string;
  columns: ExportColumn[];
  rows: ExportRow[];
  label?: string;
  className?: string;
}) {
  const [open, setOpen] = useState(false);
  const [selected, setSelected] = useState<string[]>(() => columns.map((c) => c.key));
  const [format, setFormat] = useState<"csv" | "xlsx">("csv");
  const [busy, setBusy] = useState(false);
  const closeRef = useRef<HTMLButtonElement>(null);

  // Keep selection valid if the column set changes between opens.
  useEffect(() => {
    if (open) {
      setSelected(columns.map((c) => c.key));
      closeRef.current?.focus();
    }
  }, [open, columns]);

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && setOpen(false);
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [open]);

  const toggle = (key: string) =>
    setSelected((s) => (s.includes(key) ? s.filter((k) => k !== key) : [...s, key]));

  const ordered = columns.filter((c) => selected.includes(c.key));

  async function doExport() {
    if (ordered.length === 0) return;
    setBusy(true);
    try {
      await runExport(format, filename, ordered, rows);
      setOpen(false);
    } finally {
      setBusy(false);
    }
  }

  const btn = className ?? "rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm hover:bg-zinc-50";

  return (
    <>
      <button type="button" onClick={() => setOpen(true)} className={btn} aria-haspopup="dialog">
        {label}
      </button>

      {open && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-zinc-900/40 p-4"
          onMouseDown={(e) => e.target === e.currentTarget && setOpen(false)}
        >
          <div
            role="dialog"
            aria-modal="true"
            aria-label="Export options"
            className="flex max-h-[85vh] w-full max-w-md flex-col rounded-xl border border-zinc-200 bg-white shadow-xl"
          >
            <div className="flex items-center justify-between border-b border-zinc-200 px-4 py-3">
              <h2 className="text-sm font-semibold">Export {rows.length} row{rows.length === 1 ? "" : "s"}</h2>
              <button ref={closeRef} onClick={() => setOpen(false)} className="text-zinc-400 hover:text-zinc-700" aria-label="Close">✕</button>
            </div>

            <div className="flex items-center justify-between px-4 pt-3 text-xs text-zinc-500">
              <span>Columns ({selected.length}/{columns.length})</span>
              <span className="flex gap-3">
                <button type="button" onClick={() => setSelected(columns.map((c) => c.key))} className="hover:text-zinc-900">Select all</button>
                <button type="button" onClick={() => setSelected([])} className="hover:text-zinc-900">Clear</button>
              </span>
            </div>

            <div className="grid flex-1 gap-1 overflow-y-auto px-4 py-2 sm:grid-cols-2">
              {columns.map((c) => (
                <label key={c.key} className="flex items-center gap-2 rounded px-1 py-1 text-sm hover:bg-zinc-50">
                  <input type="checkbox" checked={selected.includes(c.key)} onChange={() => toggle(c.key)} />
                  <span className="truncate" title={c.label}>{c.label}</span>
                </label>
              ))}
            </div>

            <div className="flex items-center justify-between gap-3 border-t border-zinc-200 px-4 py-3">
              <div className="flex items-center gap-3 text-sm">
                <label className="flex items-center gap-1.5">
                  <input type="radio" name="export-format" checked={format === "csv"} onChange={() => setFormat("csv")} /> CSV
                </label>
                <label className="flex items-center gap-1.5">
                  <input type="radio" name="export-format" checked={format === "xlsx"} onChange={() => setFormat("xlsx")} /> Excel
                </label>
              </div>
              <div className="flex gap-2">
                <button type="button" onClick={() => setOpen(false)} className="rounded-md border border-zinc-300 px-3 py-2 text-sm hover:bg-zinc-50">Cancel</button>
                <button
                  type="button"
                  onClick={doExport}
                  disabled={busy || selected.length === 0}
                  className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800 disabled:opacity-50"
                >
                  {busy ? "Preparing…" : `Download ${format === "csv" ? "CSV" : "Excel"}`}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
