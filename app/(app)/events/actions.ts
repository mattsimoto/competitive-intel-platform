'use server';
import { revalidatePath } from 'next/cache';
import { createClient } from '@/lib/supabase/server';
import { safeEventURL } from '@/lib/events';
export type EventActionState = { ok: boolean; message: string };
const uuid = (v: unknown) => typeof v === 'string' && /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(v);
async function context() {
  const db = await createClient();
  const { data: { user } } = await db.auth.getUser();
  if (!user) throw new Error('Please sign in again.');
  const { data: profile, error } = await db.from('users').select('organization_id,role,active').eq('id',user.id).single();
  if (error || !profile?.active || !['administrator','analyst'].includes(profile.role)) throw new Error('Administrator or Analyst access is required.');
  return { db, org: profile.organization_id };
}
export async function resolveOrganizer(_state: EventActionState, form: FormData): Promise<EventActionState> {
  try {
    const { db, org } = await context();
    const eventId = form.get('eventId'); const companyId = String(form.get('companyId') || '');
    const evidence = safeEventURL(form.get('evidence')); const notes = String(form.get('notes') || '').trim();
    if (!uuid(eventId) || (companyId && !uuid(companyId)) || !evidence || notes.length < 15 || notes.length > 4000) throw new Error('Choose an organizer and provide an official source URL and ownership explanation (15–4,000 characters).');
    const { data: event } = await db.from('industry_events').select('id').eq('id',eventId).eq('organization_id',org).single();
    if (!event) throw new Error('This event is unavailable.');
    const { error } = await db.rpc('resolve_event_organizer',{ p_event:eventId,p_company:companyId || null,p_name:String(form.get('newName') || ''),p_evidence:evidence,p_notes:notes });
    if (error) throw new Error('Could not verify the organizer. It may already be documented; refresh and check your selection.');
    revalidatePath('/events'); revalidatePath(`/events/${eventId}`); revalidatePath('/products'); revalidatePath('/competitors');
    return { ok:true,message:'Organizer documented, competitor product created, and source evidence saved.' };
  } catch (e) { return { ok:false,message:e instanceof Error ? e.message : 'Could not save organizer.' }; }
}
export async function reviewMatch(_state: EventActionState, form: FormData): Promise<EventActionState> {
  try {
    const { db, org } = await context();
    const matchId = form.get('matchId'); const eventId = form.get('eventId');
    const status = String(form.get('status')); const type = String(form.get('type')); const rationale = String(form.get('rationale') || '').trim();
    if (!uuid(matchId) || !uuid(eventId) || !['approved','proposed','rejected'].includes(status) || !['direct','partial','adjacent','emerging','substitute','partner_competitor','historical'].includes(type) || rationale.length < 15 || rationale.length > 4000) throw new Error('Choose a valid relationship and explain the overlap (15–4,000 characters).');
    const { data: match } = await db.from('event_portfolio_matches').select('id').eq('id',matchId).eq('event_id',eventId).eq('organization_id',org).single();
    if (!match) throw new Error('This comparison is unavailable.');
    const { data: event } = await db.from('industry_events').select('organizer_status,organizer_company_id,product_id').eq('id',eventId).eq('organization_id',org).single();
    if (status === 'approved' && event?.organizer_status !== 'verified') throw new Error('Document the organizer above before approving this comparison.');
    const { error } = await db.rpc('review_event_match',{p_match:matchId,p_status:status,p_type:type,p_rationale:rationale});
    if (error) throw new Error('Could not save the review. Refresh this event and try again.');
    for (const path of ['/events',`/events/${eventId}`,'/dashboard','/competitors','/products','/ask',event?.organizer_company_id ? `/competitors/${event.organizer_company_id}` : '',event?.product_id ? `/products/${event.product_id}` : '']) if (path) revalidatePath(path);
    return { ok:true,message:status === 'approved' ? 'Approved. Product-level competition and the organizer score are updated.' : 'Review saved. This comparison is excluded from active competitive scoring.' };
  } catch (e) { return { ok:false,message:e instanceof Error ? e.message : 'Could not save review.' }; }
}
export async function addComparison(_state: EventActionState, form: FormData): Promise<EventActionState> {
  try {
    const { db, org } = await context();
    const eventId = form.get('eventId'); const portfolioId = form.get('portfolioId'); const rationale = String(form.get('rationale') || '').trim();
    if (!uuid(eventId) || !uuid(portfolioId) || rationale.length < 15 || rationale.length > 4000) throw new Error('Select a portfolio offering and explain the overlap (15–4,000 characters).');
    const { error } = await db.from('event_portfolio_matches').insert({organization_id:org,event_id:eventId,internal_product_id:portfolioId,relationship_type:'adjacent',rationale,review_status:'proposed'});
    if (error) throw new Error('Could not add this comparison. It may already exist for this event.');
    revalidatePath('/events'); revalidatePath(`/events/${eventId}`);
    return {ok:true,message:'Comparison added as a proposal. Review the relationship before approving.'};
  } catch(e) { return {ok:false,message:e instanceof Error ? e.message : 'Could not add comparison.'}; }
}
