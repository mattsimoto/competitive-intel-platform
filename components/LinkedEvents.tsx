import Link from 'next/link';
import { linkedEvents } from '@/lib/eventQueries';
export async function LinkedEvents({ field, id }: { field: 'organizer_company_id' | 'product_id'; id: string }) {
  const events = await linkedEvents(field,id);
  if (!events.length) return null;
  return <section className="rounded-xl border border-zinc-200 bg-white p-4"><h2 className="mb-3 text-sm font-semibold">Linked industry events ({events.length})</h2><ul className="space-y-2">{events.map(e => <li key={e.id} className="text-sm"><Link href={`/events/${e.id}`} className="text-blue-700 hover:underline">{e.name}</Link><span className="ml-2 text-xs text-zinc-500">{e.start_date || 'Dates TBA'} · {e.date_status} (imported)</span></li>)}</ul><p className="mt-3 text-xs text-zinc-500">Open an event for organizer evidence, attendance and price estimates, and CRA portfolio comparisons.</p></section>;
}
