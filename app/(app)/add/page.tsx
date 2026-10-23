import { getCurrentUser, canEditRole } from "@/lib/auth";
import { getAddFormOptions } from "@/lib/queries";
import { addCompetitor, addProduct, addEvent } from "./actions";
import { ImportForm } from "./ImportForm";

function Section({ title, hint, children }: { title: string; hint?: string; children: React.ReactNode }) {
  return (
    <section className="rounded-xl border border-zinc-200 bg-white">
      <div className="border-b border-zinc-200 px-4 py-3">
        <div className="text-sm font-semibold">{title}</div>
        {hint && <div className="text-xs text-zinc-500">{hint}</div>}
      </div>
      <div className="p-4">{children}</div>
    </section>
  );
}

const field = "mt-1 block w-full rounded-md border border-zinc-300 px-3 py-2 text-sm outline-none focus:border-zinc-900";

export default async function AddPage() {
  const me = await getCurrentUser();
  const canEdit = canEditRole(me?.role ?? null);
  if (!canEdit) return <p className="text-sm text-zinc-500">Analysts and administrators only.</p>;

  const { internalProducts, companyTypes, categories, companies } = await getAddFormOptions();

  return (
    <div className="space-y-5">
      <h1 className="text-xl font-semibold">Add / Import</h1>

      <Section title="Bulk import competitors" hint="Upload any competitor list (.xlsx/.csv). It finds the name column, dedupes against existing companies, and categorizes them against the internal product you choose.">
        <ImportForm internalProducts={internalProducts} companyTypes={companyTypes} />
      </Section>

      <Section title="Add a competitor" hint="New competitors enter at confidence 60 / pending review. Duplicates (by name) are merged, not added again.">
        <form action={addCompetitor} className="grid gap-3 sm:grid-cols-2">
          <label className="block text-sm"><span className="text-zinc-600">Name *</span>
            <input name="name" required className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Website</span>
            <input name="website" type="url" placeholder="https://" className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Headquarters</span>
            <input name="location" placeholder="City, State" className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Company type</span>
            <select name="company_type_id" className={field}>
              <option value="">— unset —</option>
              {companyTypes.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}
            </select></label>
          <label className="block text-sm"><span className="text-zinc-600">Competes with (internal product)</span>
            <select name="internal_product_id" className={field}>
              <option value="">— none —</option>
              {internalProducts.map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}
            </select></label>
          <div className="flex items-end">
            <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">Add competitor</button>
          </div>
        </form>
      </Section>

      <Section title="Add a product" hint="Attach an offering to an existing competitor, with optional price.">
        <form action={addProduct} className="grid gap-3 sm:grid-cols-2">
          <label className="block text-sm"><span className="text-zinc-600">Company *</span>
            <select name="company_id" required className={field}>
              <option value="">— select —</option>
              {companies.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select></label>
          <label className="block text-sm"><span className="text-zinc-600">Product name *</span>
            <input name="name" required className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Category</span>
            <select name="product_category_id" className={field}>
              <option value="">— unset —</option>
              {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select></label>
          <label className="block text-sm"><span className="text-zinc-600">Product URL</span>
            <input name="product_url" type="url" placeholder="https://" className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Price min (USD)</span>
            <input name="price_min" type="number" step="1" min="0" className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Price max (USD)</span>
            <input name="price_max" type="number" step="1" min="0" className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Pricing unit</span>
            <input name="pricing_unit" placeholder="e.g. per webinar" className={field} /></label>
          <label className="block text-sm sm:col-span-2"><span className="text-zinc-600">Description</span>
            <input name="description" className={field} /></label>
          <div className="flex items-end">
            <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">Add product</button>
          </div>
        </form>
      </Section>

      <Section title="Add an event" hint="Records a competitor event; it appears in Activity as an event launch.">
        <form action={addEvent} className="grid gap-3 sm:grid-cols-2">
          <label className="block text-sm"><span className="text-zinc-600">Company *</span>
            <select name="company_id" required className={field}>
              <option value="">— select —</option>
              {companies.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select></label>
          <label className="block text-sm"><span className="text-zinc-600">Event name *</span>
            <input name="name" required className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Date</span>
            <input name="event_date" placeholder="e.g. 2026-03-15 or Mar 2026" className={field} /></label>
          <label className="block text-sm"><span className="text-zinc-600">Location</span>
            <input name="event_location" className={field} /></label>
          <label className="block text-sm sm:col-span-2"><span className="text-zinc-600">URL</span>
            <input name="event_url" type="url" placeholder="https://" className={field} /></label>
          <div className="flex items-end">
            <button className="rounded-md bg-zinc-900 px-4 py-2 text-sm font-medium text-white hover:bg-zinc-800">Add event</button>
          </div>
        </form>
      </Section>
    </div>
  );
}
