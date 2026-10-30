'use client';
import Link from 'next/link';
import { useState } from 'react';
import { craDateOverlaps, eventDate, filterEvents, isConfirmed, type EventFilters, type IndustryEvent } from '@/lib/events';
import { ExportDialog } from '@/components/ExportDialog';

const empty: EventFilters = { search: '', region: '', scope: '', dates: '', owner: '', portfolio: '', review: '', month: '', overlaps: false };
const input = 'rounded-md border border-zinc-300 bg-white p-2 text-sm';
type Lens = 'competitors' | 'ours' | 'overlay';

const EXPORT_COLUMNS = [
  { key: 'name', label: 'Event' },
  { key: 'start', label: 'Start' },
  { key: 'end', label: 'End' },
  { key: 'date_status', label: 'Date status (imported)' },
  { key: 'city', label: 'City' },
  { key: 'country', label: 'Country' },
  { key: 'region', label: 'Region' },
  { key: 'scope', label: 'Scope' },
  { key: 'organizer', label: 'Organizer' },
  { key: 'ownership', label: 'Ownership status' },
  { key: 'evidence', label: 'Ownership evidence' },
  { key: 'comparisons', label: 'Portfolio comparisons' },
  { key: 'attendance', label: 'Attendance (imported)' },
  { key: 'attendance_basis', label: 'Attendance basis' },
  { key: 'reg_pricing', label: 'Registration pricing (imported)' },
  { key: 'spon_pricing', label: 'Sponsorship pricing (imported)' },
  { key: 'website', label: 'Website' },
  { key: 'row', label: 'Workbook row' },
];

export function EventExplorer({ events, portfolio }: { events: IndustryEvent[]; portfolio: { id: string; name: string }[] }) {
  const [lens, setLens] = useState<Lens>('competitors');
  const [filters, setFilters] = useState(empty);
  const [view, setView] = useState<'list' | 'calendar'>('list');
  const [month, setMonth] = useState(events.find(e => e.start_date)?.start_date?.slice(0, 7) || new Date().toISOString().slice(0, 7));

  // Primary split: Our Events (internal) vs Competitor Events (external/unresolved); overlay shows both together.
  const effectiveView = lens === 'overlay' ? 'calendar' : view;
  const scoped = lens === 'ours' ? events.filter(e => e.scope === 'internal')
    : lens === 'competitors' ? events.filter(e => e.scope !== 'internal')
    : events;
  const rows = filterEvents(scoped, { ...filters, month: effectiveView === 'calendar' ? month : filters.month });
  const regions = Array.from(new Set(scoped.map(e => e.region).filter((r): r is string => !!r))).sort();
  const set = (key: keyof EventFilters, value: string | boolean) => setFilters(f => ({ ...f, [key]: value }));
  const first = new Date(month + '-01T12:00:00Z');
  const days = new Date(first.getUTCFullYear(), first.getUTCMonth() + 1, 0).getDate();
  const undated = filterEvents(scoped, { ...filters, month: '' }).filter(e => !e.start_date);

  const ourCount = events.filter(e => e.scope === 'internal').length;
  const compCount = events.length - ourCount;
  const dayHasBoth = (date: string) => {
    const de = events.filter(e => e.start_date && e.start_date <= date && (e.end_date ?? e.start_date) >= date);
    return de.some(e => e.scope === 'internal') && de.some(e => e.scope !== 'internal');
  };
  const conflictDays = Array.from({ length: days }, (_, i) => `${month}-${String(i + 1).padStart(2, '0')}`).filter(dayHasBoth).length;

  const exportRows = rows.map(e => ({
    name: e.name,
    start: e.start_date,
    end: e.end_date,
    date_status: e.date_status,
    city: e.city,
    country: e.country,
    region: e.region,
    scope: e.scope,
    organizer: e.organizer_name,
    ownership: e.organizer_status,
    evidence: e.owner_evidence_url,
    comparisons: e.event_portfolio_matches.map(m => `${m.internal_products?.name}: ${m.relationship_type} (${m.review_status})`).join('; '),
    attendance: e.raw_fields['Estimated Attendance'] ?? '',
    attendance_basis: e.raw_fields['Attendance Estimate Basis'] ?? '',
    reg_pricing: e.raw_fields['Attendance / Registration Pricing'] ?? '',
    spon_pricing: e.raw_fields['Sponsorship / Exhibitor Pricing'] ?? '',
    website: e.website_url,
    row: e.source_row,
  }));
  function card(e: IndustryEvent, compact = false) {
    const comparisons = e.event_portfolio_matches.filter(m => m.review_status !== 'rejected');
    const overlaps = craDateOverlaps(e, events);
    return <article key={e.id} className={`rounded-lg border p-3 ${e.scope === 'internal' ? 'border-blue-300 bg-blue-50' : 'border-zinc-200 bg-white'}`}>
      <Link href={`/events/${e.id}`} className="font-medium text-blue-700 hover:underline">{e.name}</Link>
      <p className="mt-1 text-xs text-zinc-600">{eventDate(e)} · {e.city || e.country || 'Location TBA'}</p>
      <p className="mt-1 text-xs"><span className={isConfirmed(e) ? 'text-green-700' : 'text-amber-700'}>{e.date_status} (imported)</span> · {e.scope === 'internal' ? 'our event' : e.organizer_status === 'verified' ? 'Organizer documented' : 'Organizer review needed'}</p>
      {!compact && <>
        {e.organizer_company_id ? <Link href={`/competitors/${e.organizer_company_id}`} className="mt-2 block text-sm text-blue-700 hover:underline">{e.organizer_name}</Link> : <p className="mt-2 text-sm text-zinc-500">{e.scope === 'internal' ? 'CyberRisk Alliance' : e.organizer_name || 'Owner / organizer not yet verified'}</p>}
        <p className="mt-1 text-xs text-zinc-600">{e.internal_products?.name || comparisons.map(m => `${m.internal_products?.name} (${m.relationship_type}, ${m.review_status})`).join(' · ') || 'Portfolio comparison needed'}</p>
        {overlaps.length > 0 && <p className="mt-2 text-xs text-amber-800" title={overlaps.map(o => o.name).join('; ')}>Conflicts with {overlaps.length} of our event(s) — same country & dates{!isConfirmed(e) || overlaps.some(o => !isConfirmed(o)) ? ' · tentative' : ''}</p>}
      </>}
    </article>;
  }
  const lensTab = (key: Lens, label: string, n: number) =>
    <button aria-pressed={lens === key} onClick={() => setLens(key)}
      className={`rounded-md border px-3 py-2 text-sm ${lens === key ? 'border-zinc-900 bg-zinc-900 text-white' : 'border-zinc-300 bg-white hover:bg-zinc-50'}`}>
      {label} <span className={lens === key ? 'opacity-80' : 'text-zinc-400'}>({n})</span>
    </button>;

  const stats: [string, number][] = lens === 'overlay'
    ? [['Our events', ourCount], ['Competitor events', compCount], ['Conflict days (this month)', conflictDays], ['Shown', rows.length]]
    : lens === 'ours'
    ? [['Our events', ourCount], ['Shown', rows.length], ['Tentative / TBA dates', scoped.filter(e => !isConfirmed(e)).length], ['Competitor events', compCount]]
    : [['Competitor events', compCount], ['Shown', rows.length], ['Organizer review needed', scoped.filter(e => e.organizer_status === 'pending').length], ['Tentative / TBA dates', scoped.filter(e => !isConfirmed(e)).length]];

  return <div className="space-y-5">
    <div className="flex flex-wrap justify-between gap-3">
      <div><h1 className="text-2xl font-semibold">Events</h1><p className="mt-1 text-sm text-zinc-600">Competitor events, our own CyberRisk Alliance events, and a calendar overlay to spot scheduling conflicts.</p></div>
      <ExportDialog filename="events" columns={EXPORT_COLUMNS} rows={exportRows} label="Export…" className={input} />
    </div>

    {/* Primary lens: our events vs competitor events vs overlay */}
    <div className="flex flex-wrap gap-2">
      {lensTab('competitors', 'Competitor Events', compCount)}
      {lensTab('ours', 'Our Events', ourCount)}
      {lensTab('overlay', 'Calendar Overlay', events.length)}
    </div>
    {lens === 'overlay' && <p className="text-xs text-amber-800">Overlay shows our events and competitor events on one calendar. Days with <span className="rounded bg-amber-500 px-1 text-[10px] font-medium text-white">conflict</span> have at least one of each.</p>}

    <div className="grid grid-cols-2 gap-3 md:grid-cols-4">{stats.map(([label, value]) =>
      <div key={label} className="rounded-lg border border-zinc-200 bg-white p-3"><div className="text-2xl font-semibold">{value}</div><div className="text-xs text-zinc-500">{label}</div></div>)}
    </div>

    <div className="space-y-3 rounded-xl border border-zinc-200 bg-white p-4">
      <label className="block text-sm">Search events, organizers, places, or topics<input value={filters.search} onChange={e => set('search', e.target.value)} className={`${input} mt-1 block w-full`} placeholder="e.g. Gartner, identity, or Boston" /></label>
      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        <label className="text-xs">Region<select className={`${input} mt-1 w-full`} value={filters.region} onChange={e => set('region', e.target.value)}><option value="">All regions</option>{regions.map(r => <option key={r}>{r}</option>)}</select></label>
        {lens === 'competitors' && <label className="text-xs">Organizer link<select className={`${input} mt-1 w-full`} value={filters.scope} onChange={e => set('scope', e.target.value)}><option value="">All competitor events</option><option value="external">Organizer linked</option><option value="unresolved">Organizer not linked</option></select></label>}
        <label className="text-xs">Dates<select className={`${input} mt-1 w-full`} value={filters.dates} onChange={e => set('dates', e.target.value)}><option value="">All date statuses</option><option value="confirmed">Confirmed in workbook</option><option value="tentative">Tentative / TBA / watch</option></select></label>
        {lens !== 'ours' && <label className="text-xs">Organizer evidence<select className={`${input} mt-1 w-full`} value={filters.owner} onChange={e => set('owner', e.target.value)}><option value="">All ownership statuses</option><option value="verified">Documented</option><option value="pending">Needs review</option></select></label>}
        <label className="text-xs">Portfolio offering<select className={`${input} mt-1 w-full`} value={filters.portfolio} onChange={e => set('portfolio', e.target.value)}><option value="">All portfolio offerings</option>{portfolio.map(p => <option key={p.id} value={p.id}>{p.name}</option>)}</select></label>
        <label className="text-xs">Competition review<select className={`${input} mt-1 w-full`} value={filters.review} onChange={e => set('review', e.target.value)}><option value="">All comparisons</option><option value="proposed">Proposed</option><option value="approved">Approved</option><option value="rejected">Rejected</option></select></label>
        {effectiveView === 'list' && <label className="text-xs">Month<input type="month" value={filters.month} onChange={e => set('month', e.target.value)} className={`${input} mt-1 w-full`} /></label>}
        <label className="flex items-center gap-2 text-xs"><input type="checkbox" checked={filters.overlaps} onChange={e => set('overlaps', e.target.checked)} />Only events that conflict with one of ours</label>
      </div>
      <div className="flex flex-wrap items-center gap-2">
        <button onClick={() => setFilters(empty)} className={input}>Clear filters</button>
        {lens !== 'overlay' && <><button aria-pressed={view === 'list'} onClick={() => setView('list')} className={`${input} ${view === 'list' ? 'font-semibold bg-zinc-100' : ''}`}>List</button><button aria-pressed={view === 'calendar'} onClick={() => setView('calendar')} className={`${input} ${view === 'calendar' ? 'font-semibold bg-zinc-100' : ''}`}>Calendar</button></>}
        <span role="status" className="text-sm text-zinc-500">{rows.length} of {scoped.length} events</span>
      </div>
    </div>

    {effectiveView === 'calendar' && <label className="block text-sm">Calendar month<input type="month" required value={month} onChange={e => { if (e.target.value) setMonth(e.target.value); }} className={`${input} ml-2`} /></label>}

    {effectiveView === 'list' ? <div className="grid gap-3 lg:grid-cols-2">{rows.map(e => card(e))}</div> : <>
      <div className="overflow-x-auto"><div className="grid min-w-[800px] grid-cols-7 gap-2">{['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map(day => <div key={day} className="text-center text-xs font-medium text-zinc-500">{day}</div>)}
        {Array.from({ length: first.getUTCDay() }, (_, i) => <div key={`pad-${i}`} />)}
        {Array.from({ length: days }, (_, i) => {
          const date = `${month}-${String(i + 1).padStart(2, '0')}`;
          const dayEvents = rows.filter(e => e.start_date && e.start_date <= date && (e.end_date ?? e.start_date) >= date);
          const conflict = lens === 'overlay' && dayEvents.some(e => e.scope === 'internal') && dayEvents.some(e => e.scope !== 'internal');
          return <div key={date} className={`min-h-28 space-y-2 rounded-md border p-2 ${conflict ? 'border-amber-400 bg-amber-50' : 'border-zinc-200 bg-zinc-50'}`}>
            <div className="flex items-center justify-between text-xs font-semibold">{i + 1}{conflict && <span className="rounded bg-amber-500 px-1 text-[10px] font-medium text-white" title="One of our events and a competitor event on the same day">conflict</span>}</div>
            {dayEvents.map(e => card(e, true))}
          </div>;
        })}
      </div></div>
      {undated.length > 0 && <section><h2 className="mb-3 font-semibold">Undated / watchlist events ({undated.length})</h2><div className="grid gap-3 lg:grid-cols-2">{undated.map(e => card(e))}</div></section>}
    </>}
    {rows.length === 0 && <p className="rounded-lg border p-5 text-sm text-zinc-500">No dated events match these filters{effectiveView === 'calendar' ? ' in this month' : ''}. Try clearing a filter or switching lens.</p>}
  </div>;
}
