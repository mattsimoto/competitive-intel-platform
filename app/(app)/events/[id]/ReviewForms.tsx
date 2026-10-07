'use client';
import { useActionState } from 'react';
import { addComparison, resolveOrganizer, reviewMatch } from '../actions';
import type { PortfolioMatch } from '@/lib/events';
const input = 'w-full rounded-md border border-zinc-300 bg-white px-3 py-2 text-sm';
const button = 'rounded-md bg-zinc-900 px-3 py-2 text-sm text-white disabled:opacity-50';
const initial = {ok:false,message:''};
function Message({ state }: {state:{ok:boolean;message:string}}) { return state.message ? <p role="status" className={`text-sm ${state.ok ? 'text-green-700' : 'text-red-700'}`}>{state.message}</p> : null; }
export function OwnerForm({eventId,companies}:{eventId:string;companies:{id:string;name:string}[]}) {
  const [state,action,pending] = useActionState(resolveOrganizer,initial);
  return <form action={action} className="mt-4 space-y-3">
    <input type="hidden" name="eventId" value={eventId}/>
    <label className="block text-sm">Existing organizer<select name="companyId" className={`${input} mt-1`}><option value="">Create a new organizer record</option>{companies.map(c => <option value={c.id} key={c.id}>{c.name}</option>)}</select></label>
    <label className="block text-sm">New organizer name (if creating)<input name="newName" maxLength={200} className={`${input} mt-1`} placeholder="Actual producer or organizing entity, not a sponsor"/></label>
    <label className="block text-sm">Official ownership / organizer source<input name="evidence" type="url" required className={`${input} mt-1`} placeholder="https://official-site.com/about"/></label>
    <label className="block text-sm">Evidence and co-organizers<textarea name="notes" required minLength={15} maxLength={4000} rows={3} className={`${input} mt-1`} placeholder="Explain what the source establishes. Document co-organizers or a parent company separately from sponsors."/></label>
    <button disabled={pending} className={button}>{pending ? 'Saving…' : 'Document organizer & create product'}</button><Message state={state}/>
  </form>;
}
export function MatchForm({eventId,match,ownerVerified}:{eventId:string;match:PortfolioMatch;ownerVerified:boolean}) {
  const [state,action,pending] = useActionState(reviewMatch,initial);
  return <form action={action} className="mt-3 space-y-3">
    <input type="hidden" name="eventId" value={eventId}/><input type="hidden" name="matchId" value={match.id}/>
    <div className="grid gap-3 sm:grid-cols-2"><label className="text-sm">Relationship<select name="type" defaultValue={match.relationship_type} className={`${input} mt-1`}>{['direct','partial','adjacent','emerging','substitute','partner_competitor','historical'].map(t=><option key={t}>{t}</option>)}</select></label>
    <label className="text-sm">Review status<select name="status" defaultValue={match.review_status} className={`${input} mt-1`}><option value="proposed">Proposed</option><option value="approved" disabled={!ownerVerified}>Approved</option><option value="rejected">Rejected</option></select></label></div>
    <label className="block text-sm">Audience / sponsorship rationale<textarea name="rationale" defaultValue={match.rationale} required minLength={15} maxLength={4000} rows={3} className={`${input} mt-1`}/></label>
    {!ownerVerified && <p className="text-xs text-amber-700">Document the event organizer before approving competition.</p>}
    <button disabled={pending} className={button}>{pending ? 'Saving…' : 'Save competition review'}</button><Message state={state}/>
  </form>;
}
export function ComparisonForm({eventId,portfolio}:{eventId:string;portfolio:{id:string;name:string}[]}) {
  const [state,action,pending] = useActionState(addComparison,initial);
  return <form action={action} className="space-y-3">
    <input type="hidden" name="eventId" value={eventId}/>
    <label className="block text-sm">CRA offering<select name="portfolioId" className={`${input} mt-1`} required><option value="">Select an offering</option>{portfolio.map(p => <option key={p.id} value={p.id}>{p.name}</option>)}</select></label>
    <label className="block text-sm">Why it competes<textarea name="rationale" required minLength={15} maxLength={4000} rows={3} className={`${input} mt-1`}/></label>
    <button disabled={pending} className={button}>{pending ? 'Adding…' : 'Add comparison'}</button><Message state={state}/>
  </form>;
}
