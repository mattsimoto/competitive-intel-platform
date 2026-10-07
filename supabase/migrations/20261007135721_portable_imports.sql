create or replace function public.auth_is_admin() returns boolean language sql stable set search_path='' as $$ select public.auth_role()='administrator'; $$;
create or replace function public.auth_can_edit() returns boolean language sql stable set search_path='' as $$ select public.auth_role() in ('administrator','analyst'); $$;
-- Scoring helpers use RLS with a pinned public schema.
alter function public.set_scoring_weights(jsonb) set search_path=public;
create table if not exists public.auto_approval_settings (
 organization_id uuid primary key references public.organizations(id) on delete cascade,
 enabled boolean not null default false,min_confidence numeric not null default 85,
 eligible_change_types text[] not null default '{}',pricing_always_review boolean not null default true,updated_at timestamptz not null default now()
);
create table if not exists public.market_briefs (
 id uuid primary key default gen_random_uuid(),organization_id uuid not null references public.organizations(id) on delete cascade,
 title text not null,kind text not null default 'headlines',period_label text,body_markdown text not null,source_count integer,
 generated_at timestamptz not null default now(),created_by uuid references public.users(id) on delete set null,created_at timestamptz not null default now()
);
alter table public.auto_approval_settings enable row level security;
alter table public.market_briefs enable row level security;
do $$ begin
 if not exists(select 1 from pg_policies where schemaname='public' and tablename='auto_approval_settings' and policyname='aas_select') then
  create policy aas_select on public.auto_approval_settings for select to authenticated using(organization_id=public.auth_org_id());
  create policy aas_write on public.auto_approval_settings for all to authenticated using(organization_id=public.auth_org_id() and public.auth_is_admin()) with check(organization_id=public.auth_org_id() and public.auth_is_admin());
 end if;
 if not exists(select 1 from pg_policies where schemaname='public' and tablename='market_briefs' and policyname='mb_select') then
  create policy mb_select on public.market_briefs for select to authenticated using(organization_id=public.auth_org_id());
  create policy mb_write on public.market_briefs for all to authenticated using(organization_id=public.auth_org_id() and public.auth_can_edit()) with check(organization_id=public.auth_org_id() and public.auth_can_edit());
 end if;
end $$;
grant select,insert,update,delete on public.auto_approval_settings,public.market_briefs to authenticated;
-- Atomic imports, scoped to the current member. CSV cannot assign organization,
-- user privileges, verified ownership, or approved competitive relationships.
create function public.import_workspace_rows(p_kind text,p_rows jsonb,p_file text) returns integer
language plpgsql security invoker set search_path=public as $$
declare org uuid:=public.auth_org_id(); r jsonb; n integer:=0; c uuid; product uuid; category uuid; norm text; url text;
begin
 if auth.uid() is null or org is null or not public.auth_can_edit() then raise exception 'Analyst access required'; end if;
 if p_kind not in ('companies','products','events') or jsonb_typeof(p_rows)<>'array' or jsonb_array_length(p_rows) not between 1 and 500 then raise exception 'Import 1–500 rows of a supported type'; end if;
 perform 1 from organizations where id=org for update;
 for r in select value from jsonb_array_elements(p_rows) loop
  n:=n+1;
  if length(trim(coalesce(r->>'name','')))=0 or length(r->>'name')>200 then raise exception 'Row % needs a name (1–200 characters)',n; end if;
  url:=nullif(trim(coalesce(r->>'url','')),'');
  if url is not null and (url !~ '^https?://' or length(url)>2000) then raise exception 'Row % needs an http(s) URL',n; end if;
  norm:=lower(regexp_replace(trim(r->>'name'),'\s+',' ','g'));
  if p_kind='companies' then
   if exists(select 1 from companies where organization_id=org and normalized_name=norm) then raise exception 'Row % company already exists',n; end if;
   insert into companies(organization_id,name,normalized_name,website_url,description,intelligence_status,original_import_reference)
   values(org,trim(r->>'name'),norm,url,left(r->>'description',5000),'pending_review',left(p_file,200)||' row '||n);
  elsif p_kind='products' then
   select id into c from companies where organization_id=org and normalized_name=lower(regexp_replace(trim(r->>'company'),'\s+',' ','g')) order by created_at,id limit 1;
   if c is null then raise exception 'Row %: import the product company first',n; end if;
   if exists(select 1 from products where organization_id=org and company_id=c and normalized_name=norm) then raise exception 'Row % product already exists',n; end if;
   insert into products(organization_id,company_id,name,normalized_name,product_url,description,intelligence_status,original_import_reference)
   values(org,c,trim(r->>'name'),norm,url,left(r->>'description',5000),'pending_review',left(p_file,200)||' row '||n);
  else
   insert into industry_events(organization_id,import_key,name,start_date,end_date,date_status,city,country,region,website_url,organizer_name,source_workbook,source_row,raw_fields)
   values(org,gen_random_uuid()::text,trim(r->>'name'),nullif(r->>'start_date','')::date,nullif(r->>'end_date','')::date,
    coalesce(nullif(r->>'date_status',''),'TBA'),r->>'city',r->>'country',r->>'region',url,r->>'organizer',left(p_file,200),n,r);
  end if;
 end loop;
 return n;
end $$;
revoke all on function public.import_workspace_rows(text,jsonb,text) from public,anon;
grant execute on function public.import_workspace_rows(text,jsonb,text) to authenticated;
