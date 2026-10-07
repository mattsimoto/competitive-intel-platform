"use server";
import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";
export async function importRows(kind: string, rows: Record<string, string>[], file: string) {
 if (!Array.isArray(rows) || rows.length > 500 || JSON.stringify(rows).length > 1000000) return { error: "Import is too large." };
 const db = await createClient(); const { data, error } = await db.rpc("import_workspace_rows", { p_kind: kind, p_rows: rows, p_file: file });
 if (error) return { error: error.message };
 ["/competitors", "/products", "/events", "/dashboard"].forEach(path => revalidatePath(path));
 return { count: Number(data), error: "" };
}
