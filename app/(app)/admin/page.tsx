import { createClient } from "@/lib/supabase/server";
import { getAdminData } from "@/lib/queries";
import { saveWeights, setUserRole, addTaxonomy, saveAutoApproval } from "./actions";
import { Pill } from "@/components/badges";

const FACTOR_LABELS: Record<string, string> = {
  product_overlap: "Product Overlap",
  audience_overlap: "Audience Overlap",
  topic_overlap: "Topic Overlap",
  customer_overlap: "Customer Overlap",
  pricing_competitiveness: "Pricing Competitiveness",
  market_activity: "Market Activity",
  geographic_overlap: "Geographic Overlap",
  recent_expansion: "Recent Expansion",
};
const FACTOR_ORDER = Object.keys(FACTOR_LABELS);
const TAXONOMIES: { key: string; label: string }[] = [
  { key: "product_categories", label: "Product Categories" },
  { key: "topics", label: "Topics" },
  { key: "company_types", label: "Company Types" },
  { key: "source_types", label: "Source Types" },
  { key: "regions", label: "Regions" },
  { key: "internal_products", label: "Internal Portfolio" },
];

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section className="rounded-xl border border-zinc-200 bg-white">
      <div className="border-b border-zinc-200 px-4 py-3 text-sm font-semibold">{title}</div>
      <div className="p-4">{children}</div>
    </section>
  );
}

export default async function AdminPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  const { data: profile } = await supabase.from("users").select("role").eq("id", user!.id).maybeSingle();
  if ((profile as any)?.role !== "administrator") {
    return <p className="text-sm text-zinc-500">Administrators only.</p>;
  }

  const { weights, users, taxonomies, autoApproval } = await getAdminData();
  const aa = autoApproval ?? { enabled: false, min_confidence: 85, eligible_change_types: [], pricing_always_review: true };
  const CHANGE_TYPES = [
    "product_launch", "product_removal", "pricing_change", "feature_change",
    "topic_expansion", "event_launch", "audience_change", "customer_announcement",
    "partnership", "acquisition", "geographic_expansion", "rebrand",
    "positioning_change", "research_launch",
  ];
  const ctLabel = (t: string) => t.replace(/_/g, " ").replace(/\b\w/, (c) => c.toUpperCase());
  const weightByFactor = new Map(weights.map((w: any) => [w.factor, Number(w.weight)]));
  const total = FACTOR_ORDER.reduce((s, f) => s + (weightByFactor.get(f) ?? 0), 0);

  return (
    <div className="space-y-5">
      <h1 className="text-xl font-semibold">Admin</h1>

      <Section title="Scoring Weights">
        <form action={saveWeights} className="space-y-3">
          <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
            {FACTOR_ORDER.map((f) => (
              <label key={f} className="block">
                <span className="text-xs font-medium text-zinc-600">{FACTOR_LABELS[f]}</span>
                <input
                  type="number" name={f} step="1" min="0" max="100"
                  defaultValue={weightByFactor.get(f) ?? 0}
                  className="mt-1 w-full rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900"
                />
              </label>
            ))}
          </div>
          <div className="flex items-center gap-3">
            <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">
              Save &amp; recalculate
            </button>
            <span className={`text-sm ${total === 100 ? "text-zinc-500" : "text-red-600"}`}>
              Current total: {total} {total === 100 ? "" : "(must equal 100 to save)"}
            </span>
          </div>
        </form>
        <p className="mt-3 text-xs text-zinc-400">
          Saving recomputes every competitor’s score and writes a new score-history row. A total other
          than 100 is rejected and nothing changes.
        </p>
      </Section>

      <Section title={`Users (${users.length})`}>
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
              <th className="py-2 font-medium">User</th>
              <th className="py-2 font-medium">Role</th>
            </tr>
          </thead>
          <tbody>
            {users.map((u: any) => (
              <tr key={u.id} className="border-b border-zinc-100">
                <td className="py-2">
                  <div className="font-medium text-zinc-900">{u.full_name ?? u.email}</div>
                  <div className="text-xs text-zinc-500">{u.email}</div>
                </td>
                <td className="py-2">
                  <form action={setUserRole} className="flex items-center gap-2">
                    <input type="hidden" name="id" value={u.id} />
                    <select name="role" defaultValue={u.role} className="rounded-md border border-zinc-300 bg-white px-2 py-1 text-sm">
                      <option value="administrator">Administrator</option>
                      <option value="analyst">Analyst</option>
                      <option value="viewer">Viewer</option>
                    </select>
                    <button className="rounded-md border border-zinc-300 px-2 py-1 text-xs hover:bg-zinc-50">Update</button>
                  </form>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </Section>

      <Section title="Taxonomies">
        <div className="grid gap-5 md:grid-cols-2">
          {TAXONOMIES.map((t) => {
            const items = (taxonomies as any)[t.key] as { id: string; name: string }[];
            return (
              <div key={t.key}>
                <div className="mb-2 text-xs font-medium uppercase tracking-wide text-zinc-500">{t.label} ({items.length})</div>
                <div className="mb-2 flex flex-wrap gap-1">
                  {items.map((i) => <Pill key={i.id}>{i.name}</Pill>)}
                  {items.length === 0 && <span className="text-sm text-zinc-400">None yet</span>}
                </div>
                <form action={addTaxonomy} className="flex gap-2">
                  <input type="hidden" name="table" value={t.key} />
                  <input type="text" name="name" placeholder={`Add ${t.label.toLowerCase()}…`}
                    className="flex-1 rounded-md border border-zinc-300 px-2 py-1 text-sm outline-none focus:border-zinc-900" />
                  <button className="rounded-md border border-zinc-300 px-2 py-1 text-sm hover:bg-zinc-50">Add</button>
                </form>
              </div>
            );
          })}
        </div>
      </Section>

      <Section title="Auto-Approval Rules">
        <form action={saveAutoApproval} className="space-y-4">
          <label className="flex items-center gap-2 text-sm">
            <input type="checkbox" name="enabled" defaultChecked={aa.enabled} />
            <span className="font-medium text-zinc-800">Enable auto-approval</span>
            <span className="text-zinc-500">— eligible detections skip the Review Queue</span>
          </label>
          <label className="block text-sm">
            <span className="text-zinc-600">Minimum confidence to auto-approve</span>
            <input type="number" name="min_confidence" min={0} max={100} defaultValue={Number(aa.min_confidence)}
              className="mt-1 block w-28 rounded-md border border-zinc-300 px-3 py-2 outline-none focus:border-zinc-900" />
          </label>
          <div>
            <div className="text-sm text-zinc-600">Eligible change types</div>
            <div className="mt-2 grid grid-cols-2 gap-1 md:grid-cols-3">
              {CHANGE_TYPES.map((t) => (
                <label key={t} className="flex items-center gap-2 text-sm">
                  <input type="checkbox" name={`ct_${t}`} defaultChecked={(aa.eligible_change_types ?? []).includes(t)} />
                  {ctLabel(t)}
                </label>
              ))}
            </div>
          </div>
          <label className="flex items-center gap-2 text-sm">
            <input type="checkbox" name="pricing_always_review" defaultChecked={aa.pricing_always_review} />
            <span className="text-zinc-700">Always review pricing changes (recommended)</span>
          </label>
          <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">Save rules</button>
        </form>
        <p className="mt-3 text-xs text-zinc-400">
          Applies to changes the ingestion pipeline detects (AI half). A change auto-approves only when
          enabled, its confidence meets the minimum, and its type is eligible — pricing stays in review
          while that box is checked. Existing queued items are unaffected; clear those with bulk-approve.
        </p>
      </Section>

      <Section title="Pipeline Configuration">
        <div className="space-y-2 text-sm text-zinc-600">
          <p><span className="font-medium text-zinc-800">Ingestion:</span> daily via GitHub Actions (08:00 UTC), crawl-only by default; 25 sources per run. Configured in <code>.github/workflows/ingest.yml</code>.</p>
          <p><span className="font-medium text-zinc-800">AI:</span> Claude Haiku 4.5 for classification + extraction, keys held server-side in Actions secrets.</p>
        </div>
      </Section>
    </div>
  );
}
