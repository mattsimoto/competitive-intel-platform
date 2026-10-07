import { createClient } from "@/lib/supabase/server";
import { ImportForm } from "./ImportForm";
export default async function ImportPage() {
 const db = await createClient(); const { data } = await db.rpc("auth_can_edit");
 if (!data) return <p>Analyst or administrator access required.</p>;
 return <ImportForm />;
}
