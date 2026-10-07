import { PGlite } from '@electric-sql/pglite';
import { pg_trgm } from '@electric-sql/pglite/contrib/pg_trgm';
import { pgcrypto } from '@electric-sql/pglite/contrib/pgcrypto';
import fs from 'node:fs';
import { fileURLToPath } from 'node:url';
const root=fileURLToPath(new URL('../..',import.meta.url));
const db=new PGlite({extensions:{pg_trgm,pgcrypto}});
await db.exec(`create role anon;create role authenticated; create role service_role bypassrls; create schema auth;create table auth.users(id uuid primary key,email text,email_confirmed_at timestamptz,is_anonymous boolean default false);create function auth.uid() returns uuid language sql as $$ select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid $$;create function auth.jwt() returns jsonb language sql as $$ select coalesce(nullif(current_setting('request.jwt.claims',true),''),'{}')::jsonb $$; grant usage on schema public,auth to anon,authenticated,service_role; grant execute on all functions in schema auth to authenticated,anon; alter default privileges in schema public grant all on tables to anon,authenticated,service_role;`);
for(const file of fs.readdirSync(root+'/supabase/migrations').sort()) {try{await db.exec(fs.readFileSync(root+'/supabase/migrations/'+file,'utf8'));console.log('Applied '+file);}catch(e){console.log('FAILED '+file+': '+e.message);process.exit(1);}}
await db.exec(`insert into organizations(id,name,slug) values('00000000-0000-4000-a000-000000000001','Example workspace','example');insert into auth.users(id,email,email_confirmed_at) values('00000000-0000-4000-a000-000000000002','owner@example.invalid',now());insert into users(id,organization_id,email,role) values('00000000-0000-4000-a000-000000000002','00000000-0000-4000-a000-000000000001','owner@example.invalid','administrator');select set_config('request.jwt.claim.sub','00000000-0000-4000-a000-000000000002',false);set role authenticated;`);
console.log(await db.query(`select import_workspace_rows('companies','[{"name":"Example Company","url":"https://example.com"}]','test.csv');`));
console.log(await db.query(`select import_workspace_rows('products','[{"name":"Example Product","company":"Example Company"}]','test.csv');`));
console.log(await db.query(`select import_workspace_rows('events','[{"name":"Example Event","start_date":"2027-06-01","organizer":"Example Organizer"}]','test.csv');`));
console.log(await db.query(`select auth_org_id(),auth_role(),(select count(*) from companies) companies,(select count(*) from products) products,(select count(*) from industry_events) events;`));
// An analyst may import but cannot grant membership or approve their own access.
await db.exec(`reset role;update users set role='analyst' where id='00000000-0000-4000-a000-000000000002';set role authenticated;`);
await db.query(`select import_workspace_rows('companies','[{"name":"Analyst Company"}]','test.csv');`);
const before = (await db.query('select count(*)::int n from companies')).rows[0].n;
try { await db.query(`select import_workspace_rows('companies','[{"name":"Rollback Company"},{"name":"Example Company"}]','test.csv');`); throw new Error('Duplicate import unexpectedly accepted'); } catch(e) { if(e.message==='Duplicate import unexpectedly accepted')throw e; }
if((await db.query('select count(*)::int n from companies')).rows[0].n!==before) throw new Error('Partial import persisted');
await db.exec(`reset role;update users set role='viewer' where id='00000000-0000-4000-a000-000000000002';set role authenticated;`);
try {await db.query(`select import_workspace_rows('companies','[{"name":"Forbidden Company"}]','test.csv');`);throw new Error('Viewer import accepted');} catch(e) {if(e.message==='Viewer import accepted')throw e;}
await db.exec(`reset role;insert into organizations(id,name,slug) values('00000000-0000-4000-a000-000000000003','Other workspace','other');insert into companies(organization_id,name,normalized_name) values('00000000-0000-4000-a000-000000000003','Other private company','other private company');set role authenticated;`);
if((await db.query('select count(*)::int n from companies')).rows[0].n!==before) throw new Error('Cross-workspace data visible');
await db.exec(`reset role;update users set active=false where id='00000000-0000-4000-a000-000000000002';set role authenticated;`);
if((await db.query('select count(*)::int n from companies')).rows[0].n!==0) throw new Error('Inactive member sees records');
console.log('PASS: analyst import, atomic rollback, viewer rejection, cross-workspace isolation and deactivation');
await db.close();
