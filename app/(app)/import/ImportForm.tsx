"use client";
import { useState } from "react";
import { parseCsv } from "@/lib/csv";
import { importRows } from "./actions";
export function ImportForm() {
 const [kind, setKind] = useState("companies"); const [rows, setRows] = useState<Record<string,string>[]>([]); const [file, setFile] = useState(""); const [message,setMessage] = useState(""); const [busy,setBusy] = useState(false);
 return <div className="max-w-4xl space-y-4"><h1 className="text-xl font-semibold">Import your data</h1><p className="text-sm text-zinc-600">CSV imports add records to your workspace. Import companies before their products. Events start with unresolved organizers; document ownership in Industry Events before creating competitor products. Nothing is auto-approved. Duplicate companies or products reject the whole import.</p>
 <label className="block text-sm">Record type<select className="ml-3 rounded border p-2" value={kind} onChange={e => { setKind(e.target.value); setRows([]); }}>{["companies","products","events"].map(k => <option key={k}>{k}</option>)}</select></label>
 <a className="block text-sm text-blue-700" href={`/templates/${kind}.csv`} download>Download CSV template</a>
 <input aria-label="CSV file" type="file" accept=".csv,text/csv" disabled={busy} onChange={async e => { setRows([]); const f=e.target.files?.[0]; if(!f)return; try { if(f.size>1000000)throw new Error("Use a CSV smaller than 1 MB."); setRows(parseCsv(await f.text())); setFile(f.name); setMessage(""); } catch(error) { setMessage(error instanceof Error?error.message:"Could not read CSV."); } }} />
 {rows.length>0 && <><p className="text-sm">{rows.length} rows ready. Preview of the first five:</p><div className="overflow-auto"><table className="w-full text-sm"><thead><tr>{Object.keys(rows[0]).map(h=><th className="border p-2 text-left" key={h}>{h}</th>)}</tr></thead><tbody>{rows.slice(0,5).map((r,i)=><tr key={i}>{Object.values(r).map((v,j)=><td className="border p-2" key={j}>{v}</td>)}</tr>)}</tbody></table></div><button disabled={busy} className="rounded bg-zinc-900 px-4 py-2 text-white" onClick={async()=>{setBusy(true);try{const result=await importRows(kind,rows,file);setMessage(result.error||`Imported ${result.count} rows.`);if(!result.error)setRows([]);}catch{setMessage("Import failed. Try again.");}finally{setBusy(false);}}}>{busy?"Importing…":"Import into workspace"}</button></>}
 <p role="status" className="text-sm">{message}</p></div>;
}
