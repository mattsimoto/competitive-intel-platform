// Supports quoted commas, escaped quotes and multiline cells. Rejects malformed CSV.
export function parseCsv(text: string): Record<string, string>[] {
 const rows: string[][] = []; let row: string[] = []; let cell = ""; let quoted = false; let closed = false;
 text = text.replace(/^\uFEFF/, "");
 for (let i = 0; i < text.length; i++) {
  const c = text[i];
  if (quoted) { if (c === '"') { if (text[i + 1] === '"') { cell += '"'; i++; } else { quoted = false; closed = true; } } else cell += c; }
  else if (c === '"') { if (cell || closed) throw new Error("Unexpected quote."); quoted = true; }
  else if (c === ",") { row.push(cell); cell = ""; closed = false; }
  else if (c === "\n" || c === "\r") { if (c === "\r" && text[i + 1] === "\n") i++; row.push(cell); if (row.some(v => v.trim())) rows.push(row); row = []; cell = ""; closed = false; }
  else { if (closed) throw new Error("Unexpected text after closing quote."); cell += c; }
 }
 if (quoted) throw new Error("Unclosed quote."); row.push(cell); if (row.some(v => v.trim())) rows.push(row);
 const headers = rows.shift()?.map(h => h.trim().toLowerCase()) || [];
 if (!headers.includes("name") || new Set(headers).size !== headers.length || headers.some(h => !h)) throw new Error("Use unique headers, including name.");
 if (rows.length < 1 || rows.length > 500) throw new Error("Import 1–500 rows.");
 return rows.map((r, i) => { if (r.length !== headers.length) throw new Error(`Row ${i + 2} has the wrong number of cells.`); return Object.fromEntries(headers.map((h, j) => [h, r[j].trim()])); });
}
