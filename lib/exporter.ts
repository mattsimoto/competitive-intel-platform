// Shared, serializable export helpers used by the ExportDialog.
// Columns and rows are plain data so they can cross the server/client boundary
// (no accessor functions). CSV is built dependency-free; XLSX lazy-loads the
// already-installed `xlsx` package so it never weighs down the initial bundle.

export type ExportColumn = { key: string; label: string };
export type ExportCell = string | number | boolean | null | undefined;
export type ExportRow = Record<string, ExportCell>;

function matrix(columns: ExportColumn[], rows: ExportRow[]): ExportCell[][] {
  return [columns.map((c) => c.label), ...rows.map((r) => columns.map((c) => r[c.key] ?? ""))];
}

function triggerDownload(blob: Blob, filename: string) {
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  a.remove();
  URL.revokeObjectURL(url);
}

// Prefix formula-like values so spreadsheet apps treat them as text (CSV injection guard).
function csvCell(value: ExportCell): string {
  const s = String(value ?? "");
  const guarded = /^[\s]*[=+\-@]/.test(s) ? "'" + s : s;
  return /[",\n\r]/.test(guarded) ? '"' + guarded.replace(/"/g, '""') + '"' : guarded;
}

export function exportCSV(filename: string, columns: ExportColumn[], rows: ExportRow[]) {
  const body = matrix(columns, rows)
    .map((row) => row.map(csvCell).join(","))
    .join("\r\n");
  triggerDownload(new Blob(["﻿" + body], { type: "text/csv;charset=utf-8;" }), filename + ".csv");
}

export async function exportXLSX(filename: string, columns: ExportColumn[], rows: ExportRow[]) {
  const XLSX = await import("xlsx");
  const ws = XLSX.utils.aoa_to_sheet(matrix(columns, rows));
  ws["!cols"] = columns.map((c) => ({ wch: Math.min(60, Math.max(10, c.label.length + 2)) }));
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "Export");
  XLSX.writeFile(wb, filename + ".xlsx");
}

export async function runExport(
  format: "csv" | "xlsx",
  filename: string,
  columns: ExportColumn[],
  rows: ExportRow[],
) {
  if (format === "xlsx") return exportXLSX(filename, columns, rows);
  return exportCSV(filename, columns, rows);
}
