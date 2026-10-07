import 'server-only';
import { createClient } from '@/lib/supabase/server';
import type { IndustryEvent } from '@/lib/events';
const selection = '*, companies(id,name,parent_company_id), internal_products(name), event_portfolio_matches(id,internal_product_id,relationship_type,rationale,review_status,internal_products(name))';
export async function listEvents() {
  const db = await createClient();
  const { data, error } = await db.from('industry_events').select(selection).order('start_date', { nullsFirst: false }).order('name').limit(1000);
  if (error) throw new Error('Could not load the event calendar. Please try again.');
  return (data ?? []) as unknown as IndustryEvent[];
}
export async function getEvent(id: string) {
  const db = await createClient();
  const { data, error } = await db.from('industry_events').select(selection).eq('id', id).maybeSingle();
  if (error) throw new Error('Could not load this event.');
  return data as unknown as IndustryEvent | null;
}
export async function linkedEvents(field: 'organizer_company_id' | 'product_id', id: string) {
  const db = await createClient();
  const { data, error } = await db.from('industry_events').select('id,name,start_date,date_status,organizer_status').eq(field, id).order('start_date', { nullsFirst: false });
  if (error) throw new Error('Could not load linked events.');
  return data ?? [];
}
