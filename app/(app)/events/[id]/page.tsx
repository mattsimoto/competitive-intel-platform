import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getEvent, listEvents } from '@/lib/eventQueries';
import { craDateOverlaps, eventDate, isConfirmed, safeEventURL } from '@/lib/events';
import { createClient } from '@/lib/supabase/server';
import { getCurrentUser, canEditRole } from '@/lib/auth';
import { ComparisonForm, MatchForm, OwnerForm } from './ReviewForms';
function Source({url,label}:{url:unknown;label?:string}) { const href=safeEventURL(url); return href ? <a href={href} target="_blank" rel="noreferrer" className="break-all text-sm text-blue-700 hover:underline">{label || href}</a> : <span className="text-sm text-zinc-500">No source recorded</span>; }
function Section({title,children}:{title:string;children:React.ReactNode}) {return <section className="rounded-xl border border-zinc-200 bg-white p-5"><h2 className="mb-3 font-semibold">{title}</h2>{children}</section>;}
export default async function EventDetail({params}:{params:Promise<{id:string}>}) {
  const {id}=await params;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const event=await getEvent(id); if(!event) notFound();
  const db=await createClient();
  const me=await getCurrentUser();
  const canEdit=me?.active===true && canEditRole(me.role);
  const [companies,portfolio,history,allEvents,parent] = await Promise.all([
    canEdit && event.organizer_status==='pending' ? db.from('companies').select('id,name').order('name').limit(1000) : Promise.resolve({data:[]}),
    db.from('internal_products').select('id,name').eq('active',true).order('name'),
    db.from('event_review_log').select('id,action,details,created_at').eq('event_id',id).order('created_at',{ascending:false}).limit(30),
    listEvents(),event.companies?.parent_company_id ? db.from('companies').select('id,name').eq('id',event.companies.parent_company_id).maybeSingle() : Promise.resolve({data:null})
  ]);
  const overlaps=craDateOverlaps(event,allEvents);
  const available=(portfolio.data??[]).filter(p=>!event.event_portfolio_matches.some(m=>m.internal_product_id===p.id));
  return <div className="space-y-5">
    <Link href="/events" className="text-sm text-blue-700 hover:underline">← Industry Events</Link>
    <div className="rounded-xl border border-zinc-200 bg-white p-5"><h1 className="text-2xl font-semibold">{event.name}</h1><p className="mt-2 text-zinc-600">{eventDate(event)} · {[event.city,event.country].filter(Boolean).join(', ')}</p><p className={`mt-2 text-sm ${isConfirmed(event)?'text-green-700':'text-amber-700'}`}>{event.date_status} — workbook status; dates have not been reverified during import.</p><div className="mt-3"><Source url={event.website_url} label="Official event website"/></div></div>
    <Section title="Owner / organizer">
      <p className="text-sm">{event.scope==='internal' ? `Internal event · ${event.internal_products?.name}` : event.organizer_name || 'Organizer needs verification'}</p>
      <p className="mt-1 text-xs text-zinc-500">{event.organizer_status==='verified' ? `Organizer evidence documented ${event.owner_verified_at?.slice(0,10) || ''}. This does not verify the event date or pricing.` : 'Unresolved ownership: kept out of approved competitive scoring until documented.'}</p>
      {event.organizer_company_id && <div className="mt-3 flex flex-wrap gap-4 text-sm"><Link href={`/competitors/${event.organizer_company_id}`} className="text-blue-700 hover:underline">Organizer competitor profile →</Link>{event.product_id && <Link href={`/products/${event.product_id}`} className="text-blue-700 hover:underline">Event product →</Link>}</div>}
      {parent.data && <p className="mt-3 text-sm">Parent company: <Link className="text-blue-700 hover:underline" href={`/competitors/${parent.data.id}`}>{parent.data.name}</Link></p>}
      {event.owner_notes && <p className="mt-3 whitespace-pre-wrap text-sm text-zinc-700">{event.owner_notes}</p>}
      {event.owner_evidence_url && <div className="mt-2"><Source url={event.owner_evidence_url}/></div>}
      {canEdit && event.scope!=='internal' && event.organizer_status==='pending' && <OwnerForm eventId={id} companies={companies.data??[]}/>}
    </Section>
    <Section title={event.scope==='internal'?'internal portfolio':'Competition with portfolio offerings'}>
      {event.scope==='internal' ? <p className="text-sm">This event belongs to our {event.internal_products?.name} portfolio and is excluded from competitor products and relationships.</p> : <>
        <p className="mb-4 text-xs text-zinc-500">Comparisons evaluate attendee attention, education budgets, and sponsor demand. Imported proposals are inferences, not verified market-share claims. Approval creates an active product-level competitive relationship.</p>
        <div className="space-y-4">{event.event_portfolio_matches.map(m=><div key={m.id} className="rounded-lg border border-zinc-200 p-4"><div className="flex flex-wrap justify-between gap-2"><h3 className="font-medium">{m.internal_products?.name}</h3><span className="text-xs text-zinc-500">{m.relationship_type} · {m.review_status}</span></div>{canEdit ? <MatchForm eventId={id} match={m} ownerVerified={event.organizer_status==='verified'}/> : <p className="mt-2 text-sm">{m.rationale}</p>}</div>)}</div>
        {canEdit && available.length>0 && <details className="mt-4 rounded-lg border p-4"><summary className="cursor-pointer text-sm font-medium">Compare with another portfolio offering</summary><div className="mt-4"><ComparisonForm eventId={id} portfolio={available}/></div></details>}
      </>}
    </Section>
    {overlaps.length>0 && <Section title="Same-country internal date overlaps"><p className="mb-3 text-xs text-zinc-500">A planning signal based on imported dates and country, without implying the same city or a proven competitive relationship.</p><ul className="space-y-2">{overlaps.map(o=><li key={o.id} className="text-sm"><Link className="text-blue-700 hover:underline" href={`/events/${o.id}`}>{o.name}</Link> · {eventDate(o)} · {o.date_status}</li>)}</ul></Section>}
    <Section title="Audience, attendance & commercial details"><dl className="grid gap-4 md:grid-cols-2">{['Industry Focus','Estimated Attendance','Attendance Estimate Basis','Attendance / Registration Pricing','Sponsorship / Exhibitor Pricing','Notes'].map(field=><div key={field}><dt className="text-xs font-medium uppercase text-zinc-500">{field}</dt><dd className="mt-1 whitespace-pre-wrap text-sm">{String(event.raw_fields[field]??'Not recorded')}</dd></div>)}</dl><p className="mt-4 text-xs text-zinc-500">Imported text preserves estimates, historical prices, and inquiry-only sponsorship terms. It is not a current price quote.</p></Section>
    <Section title="Source provenance"><p className="text-sm">{event.source_workbook} · row {event.source_row}</p><p className="mt-1 text-xs text-zinc-500">Workbook “Last Verified”: {String(event.raw_fields['Last Verified']??'Not recorded')} (supplied by the workbook author)</p><ul className="mt-3 space-y-2">{event.source_urls.map(url=><li key={url}><Source url={url}/></li>)}</ul></Section>
    <Section title="Review history">{!history.data?.length ? <p className="text-sm text-zinc-500">No analyst reviews yet.</p> : <ul className="space-y-3">{history.data.map(log=><li key={log.id} className="text-sm"><div className="font-medium">{log.action.replaceAll('_',' ')} · {new Date(log.created_at).toLocaleString('en-US',{timeZone:'UTC'})} UTC</div><p className="mt-1 whitespace-pre-wrap text-zinc-600">{String(log.details?.rationale || log.details?.notes || '')}</p></li>)}</ul>}</Section>
  </div>;
}
