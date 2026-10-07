export type PortfolioMatch = {
  id: string; internal_product_id: string; relationship_type: string; rationale: string;
  review_status: 'proposed' | 'approved' | 'rejected'; internal_products: { name: string } | null;
};
export type IndustryEvent = {
  id: string; name: string; start_date: string | null; end_date: string | null; date_status: string;
  city: string | null; country: string | null; region: string | null; industry_focus: string | null;
  website_url: string | null; source_urls: string[]; raw_fields: Record<string, string | number | null>;
  source_workbook: string; source_row: number; scope: 'internal' | 'external' | 'unresolved';
  organizer_name: string | null; organizer_company_id: string | null; organizer_status: 'pending' | 'verified';
  owner_evidence_url: string | null; owner_notes: string | null; owner_verified_at: string | null;
  product_id: string | null; internal_product_id: string | null;
  companies: { id: string; name: string; parent_company_id: string | null } | null;
  internal_products: { name: string } | null; event_portfolio_matches: PortfolioMatch[];
};

export function safeEventURL(value: unknown): string | null {
  if (typeof value !== 'string') return null;
  try { const u = new URL(value); return ['http:', 'https:'].includes(u.protocol) ? u.href : null; } catch { return null; }
}
export function isConfirmed(event: Pick<IndustryEvent, 'date_status'>) {
  return event.date_status.trim().toLowerCase() === 'confirmed';
}
export function eventDate(event: Pick<IndustryEvent, 'start_date' | 'end_date'>) {
  if (!event.start_date) return 'Dates TBA';
  const fmt = (date: string) => new Date(date + 'T12:00:00Z').toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric', timeZone: 'UTC' });
  return event.end_date && event.end_date !== event.start_date ? `${fmt(event.start_date)} – ${fmt(event.end_date)}` : fmt(event.start_date);
}
export function occursInMonth(event: Pick<IndustryEvent, 'start_date' | 'end_date'>, month: string) {
  if (!event.start_date) return false;
  const first = month + '-01';
  const date = new Date(first + 'T12:00:00Z');
  date.setUTCMonth(date.getUTCMonth() + 1);
  const next = date.toISOString().slice(0, 10);
  return event.start_date < next && (event.end_date ?? event.start_date) >= first;
}
export function craDateOverlaps(event: IndustryEvent, all: IndustryEvent[]) {
  if (event.scope === 'internal' || !event.start_date || !event.country) return [];
  return all.filter(other => other.scope === 'internal' && other.start_date && other.country === event.country &&
    event.start_date! <= (other.end_date ?? other.start_date) && (event.end_date ?? event.start_date!) >= other.start_date);
}
export type EventFilters = { search: string; region: string; scope: string; dates: string; owner: string; portfolio: string; review: string; month: string; overlaps: boolean };
export function filterEvents(events: IndustryEvent[], f: EventFilters) {
  const query = f.search.trim().toLowerCase();
  return events.filter(e => {
    const matches = e.event_portfolio_matches.filter(m => m.review_status !== 'rejected');
    return (!query || [e.name, e.organizer_name, e.city, e.country, e.industry_focus].join(' ').toLowerCase().includes(query)) &&
      (!f.region || e.region === f.region) && (!f.scope || e.scope === f.scope) &&
      (!f.dates || (f.dates === 'confirmed' ? isConfirmed(e) : !isConfirmed(e))) &&
      (!f.owner || e.organizer_status === f.owner) &&
      (!f.portfolio || e.internal_product_id === f.portfolio || matches.some(m => m.internal_product_id === f.portfolio)) &&
      (!f.review || e.event_portfolio_matches.some(m => m.review_status === f.review)) &&
      (!f.month || occursInMonth(e, f.month)) && (!f.overlaps || craDateOverlaps(e, events).length > 0);
  });
}
export function eventsCSV(events: IndustryEvent[]) {
  // Prefix formula-like values before quoting so spreadsheet apps treat them as text.
  const cell = (value: unknown) => { const s = String(value ?? ''); return '"' + (/^[\s]*[=+@-]/.test(s) ? "'" + s : s).replace(/"/g, '""') + '"'; };
  const head = ['Event','Start','End','Date status (imported)','City','Country','Region','Scope','Organizer','Ownership status','Ownership evidence','Portfolio comparisons','Attendance (imported)','Attendance basis','Registration pricing (imported)','Sponsorship pricing (imported)','Website','Workbook row'];
  return [head, ...events.map(e => [e.name,e.start_date,e.end_date,e.date_status,e.city,e.country,e.region,e.scope,e.organizer_name,e.organizer_status,e.owner_evidence_url,
    e.event_portfolio_matches.map(m => `${m.internal_products?.name}: ${m.relationship_type} (${m.review_status})`).join('; '),e.raw_fields['Estimated Attendance'],e.raw_fields['Attendance Estimate Basis'],e.raw_fields['Attendance / Registration Pricing'],e.raw_fields['Sponsorship / Exhibitor Pricing'],e.website_url,e.source_row])].map(row => row.map(cell).join(',')).join('\r\n');
}
