import { listEvents } from '@/lib/eventQueries';
import { createClient } from '@/lib/supabase/server';
import { EventExplorer } from './EventExplorer';

export default async function EventsPage() {
  const [events, db] = await Promise.all([listEvents(), createClient()]);
  const { data, error } = await db.from('internal_products').select('id,name').eq('active', true).order('name');
  if (error) throw new Error('Could not load the internal portfolio.');
  return <EventExplorer events={events} portfolio={data ?? []} />;
}
