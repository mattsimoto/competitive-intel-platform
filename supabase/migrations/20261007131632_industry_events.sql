-- Workbook facts, documented organizers, and analyst competition judgments are
-- separate. CRA events cannot become competitor products or relationships.
create table public.industry_events (
 id uuid primary key default gen_random_uuid(), organization_id uuid not null references public.organizations(id),
 import_key text not null, name text not null, start_date date, end_date date, date_status text not null,
 city text, country text, region text, industry_focus text, website_url text,
 source_urls jsonb not null default '[]', raw_fields jsonb not null default '{}', source_workbook text not null, source_row integer not null,
 scope text not null default 'unresolved' check(scope in ('internal','external','unresolved')),
 organizer_name text, organizer_company_id uuid references public.companies(id),
 organizer_status text not null default 'pending' check(organizer_status in ('pending','verified')),
 owner_evidence_url text, owner_notes text, owner_verified_at timestamptz,
 product_id uuid references public.products(id), internal_product_id uuid references public.internal_products(id),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique(organization_id,import_key),
 check(end_date is null or start_date is null or end_date>=start_date),
 check(scope<>'internal' or (organizer_company_id is null and product_id is null and internal_product_id is not null)),
 check(scope<>'external' or (organizer_company_id is not null and product_id is not null and internal_product_id is null)),
 check(organizer_status<>'verified' or (owner_evidence_url is not null and owner_evidence_url ~ '^https?://' and owner_notes is not null))
);
create index industry_events_dates on public.industry_events(organization_id,start_date);
create index industry_events_organizer on public.industry_events(organizer_company_id);
create index industry_events_product on public.industry_events(product_id);
create table public.event_portfolio_matches (
 id uuid primary key default gen_random_uuid(), organization_id uuid not null references public.organizations(id),
 event_id uuid not null references public.industry_events(id) on delete cascade,
 internal_product_id uuid not null references public.internal_products(id), relationship_type public.relationship_type not null,
 rationale text not null, review_status text not null default 'proposed' check(review_status in ('proposed','approved','rejected')),
 competitive_relationship_id uuid references public.competitive_relationships(id), reviewed_by uuid references public.users(id), reviewed_at timestamptz,
 created_at timestamptz not null default now(), unique(event_id,internal_product_id)
);
create table public.event_review_log (
 id uuid primary key default gen_random_uuid(), organization_id uuid not null references public.organizations(id),
 event_id uuid not null references public.industry_events(id), actor_id uuid references public.users(id),
 action text not null, details jsonb not null, created_at timestamptz not null default now()
);
create function public.guard_event_links() returns trigger language plpgsql set search_path=public as $$
declare e public.industry_events; p public.products;
begin
 if tg_op='UPDATE' and new.organization_id is distinct from old.organization_id then raise exception 'Cannot move records between organizations'; end if;
 if tg_table_name='industry_events' then
  if tg_op='UPDATE' and old.organizer_status='verified' and (new.organizer_company_id is distinct from old.organizer_company_id or new.product_id is distinct from old.product_id or new.scope is distinct from old.scope) then raise exception 'Documented ownership requires a separate ownership change review'; end if;
  if new.organizer_company_id is not null and not exists(select 1 from companies where id=new.organizer_company_id and organization_id=new.organization_id) then raise exception 'Invalid organizer organization'; end if;
  if new.product_id is not null then
   select * into p from products where id=new.product_id and organization_id=new.organization_id;
   if p.id is null or p.company_id is distinct from new.organizer_company_id then raise exception 'Product must belong to the organizer'; end if;
  end if;
  if new.internal_product_id is not null and not exists(select 1 from internal_products where id=new.internal_product_id and organization_id=new.organization_id) then raise exception 'Invalid internal product'; end if;
 else
  select * into e from industry_events where id=new.event_id and organization_id=new.organization_id;
  if e.id is null then raise exception 'Invalid event organization'; end if;
  if tg_table_name='event_portfolio_matches' then
   if e.scope='internal' then raise exception 'Internal events cannot be competitors'; end if;
   if not exists(select 1 from internal_products where id=new.internal_product_id and organization_id=new.organization_id) then raise exception 'Invalid portfolio organization'; end if;
   if new.review_status='approved' and (e.scope<>'external' or e.organizer_status<>'verified' or new.competitive_relationship_id is null) then raise exception 'Document the organizer and relationship before approving competition'; end if;
   if new.competitive_relationship_id is not null and not exists(select 1 from competitive_relationships where id=new.competitive_relationship_id and organization_id=new.organization_id and competitor_company_id=e.organizer_company_id and competitor_product_id=e.product_id and internal_product_id=new.internal_product_id) then raise exception 'Invalid competitive relationship'; end if;
  end if;
 end if;
 return new;
end $$;
create trigger industry_events_links before insert or update on public.industry_events for each row execute function public.guard_event_links();
create trigger event_matches_links before insert or update on public.event_portfolio_matches for each row execute function public.guard_event_links();
create trigger event_log_links before insert or update on public.event_review_log for each row execute function public.guard_event_links();
create trigger industry_events_updated before update on public.industry_events for each row execute function public.set_updated_at();
alter table public.industry_events enable row level security;
alter table public.event_portfolio_matches enable row level security;
alter table public.event_review_log enable row level security;
create policy events_read on public.industry_events for select to authenticated using(organization_id=public.auth_org_id());
create policy events_write on public.industry_events for all to authenticated using(organization_id=public.auth_org_id() and public.auth_can_edit()) with check(organization_id=public.auth_org_id() and public.auth_can_edit());
create policy matches_read on public.event_portfolio_matches for select to authenticated using(organization_id=public.auth_org_id());
create policy matches_write on public.event_portfolio_matches for all to authenticated using(organization_id=public.auth_org_id() and public.auth_can_edit()) with check(organization_id=public.auth_org_id() and public.auth_can_edit());
create policy event_log_read on public.event_review_log for select to authenticated using(organization_id=public.auth_org_id());
create policy event_log_insert on public.event_review_log for insert to authenticated with check(organization_id=public.auth_org_id() and public.auth_can_edit() and actor_id=auth.uid());
grant select,insert,update,delete on public.industry_events,public.event_portfolio_matches to authenticated;
grant select,insert on public.event_review_log to authenticated;

create function public.resolve_event_organizer(p_event uuid,p_company uuid,p_name text,p_evidence text,p_notes text) returns uuid
language plpgsql security invoker set search_path=public as $$
declare e industry_events; c companies; v_product uuid; v_source_type uuid;
begin
 if auth.uid() is null or not auth_can_edit() or not exists(select 1 from users where id=auth.uid() and active) then raise exception 'Analyst access required'; end if;
 select * into e from industry_events where id=p_event and organization_id=auth_org_id() for update;
 if e.id is null or e.scope='internal' or e.organizer_status='verified' then raise exception 'This organizer cannot be changed here'; end if;
 if p_evidence is null or p_evidence !~ '^https?://' or p_notes is null or length(trim(p_notes))<15 or length(p_notes)>4000 then raise exception 'Official evidence and an ownership explanation are required'; end if;
 if p_company is not null then
  select * into c from companies where id=p_company and organization_id=e.organization_id;
  if c.id is null then raise exception 'Invalid organizer'; end if;
 else
  if p_name is null or length(trim(p_name))<2 or length(p_name)>200 then raise exception 'Provide the actual organizer name'; end if;
  select * into c from companies where organization_id=e.organization_id and normalized_name=lower(regexp_replace(trim(p_name),'\s+',' ','g')) order by created_at,id limit 1;
  if c.id is null then
   insert into companies(organization_id,name,normalized_name,intelligence_status,original_import_reference)
   values(e.organization_id,trim(p_name),lower(regexp_replace(trim(p_name),'\s+',' ','g')),'pending_review','Event organizer verified by analyst') returning * into c;
  end if;
 end if;
 insert into products(organization_id,company_id,name,normalized_name,product_url,description,audience_description,geography,product_category_id,intelligence_status,original_import_reference)
 values(e.organization_id,c.id,e.name,lower(e.name)||' | calendar-2027-row-'||e.source_row,e.website_url,e.industry_focus,e.industry_focus,e.country,
 (select id from product_categories where organization_id=e.organization_id and name='Conferences' limit 1),'pending_review',e.source_workbook||' row '||e.source_row) returning id into v_product;
 update industry_events set scope='external',organizer_company_id=c.id,organizer_name=c.name,organizer_status='verified',product_id=v_product,owner_evidence_url=p_evidence,owner_notes=trim(p_notes),owner_verified_at=now() where id=e.id;
 select id into v_source_type from source_types where organization_id=e.organization_id and name='Website' limit 1;
 if not exists(select 1 from company_sources where organization_id=e.organization_id and company_id=c.id and url=p_evidence) then
  insert into company_sources(organization_id,company_id,source_type_id,name,url) values(e.organization_id,c.id,v_source_type,'Event organizer ownership evidence',p_evidence);
 end if;
 insert into event_review_log(organization_id,event_id,actor_id,action,details) values(e.organization_id,e.id,auth.uid(),'organizer_verified',jsonb_build_object('company_id',c.id,'product_id',v_product,'source_url',p_evidence,'notes',p_notes));
 return v_product;
end $$;
create function public.review_event_match(p_match uuid,p_status text,p_type public.relationship_type,p_rationale text) returns void
language plpgsql security invoker set search_path=public as $$
declare m event_portfolio_matches; e industry_events; v_rel uuid; v_overlap numeric;
begin
 if auth.uid() is null or not auth_can_edit() or not exists(select 1 from users where id=auth.uid() and active) then raise exception 'Analyst access required'; end if;
 if p_status is null or p_status not in ('approved','rejected','proposed') or p_type is null or p_rationale is null or length(trim(p_rationale))<15 or length(p_rationale)>4000 then raise exception 'Provide a valid review and audience or sponsorship rationale'; end if;
 select ev.* into e from industry_events ev join event_portfolio_matches ma on ma.event_id=ev.id where ma.id=p_match and ev.organization_id=auth_org_id() for update of ev;
 select * into m from event_portfolio_matches where id=p_match and organization_id=auth_org_id() for update;
 if m.id is null or e.id is null or e.scope='internal' then raise exception 'Invalid event match'; end if;
 v_rel:=m.competitive_relationship_id;
 if p_status='approved' then
  if e.scope<>'external' or e.organizer_status<>'verified' then raise exception 'Verify the organizer before approving competition'; end if;
  v_overlap:=case p_type when 'direct' then 85 when 'partial' then 60 when 'adjacent' then 30 else 40 end;
  if v_rel is null then
   insert into competitive_relationships(organization_id,competitor_company_id,competitor_product_id,internal_product_id,relationship_type,overlap_score,notes,confidence_score,active,last_verified_at)
   values(e.organization_id,e.organizer_company_id,e.product_id,m.internal_product_id,p_type,v_overlap,p_rationale,75,true,now()) returning id into v_rel;
  else
   update competitive_relationships set relationship_type=p_type,overlap_score=v_overlap,notes=p_rationale,active=true,last_verified_at=now() where id=v_rel and organization_id=e.organization_id;
  end if;
 elsif v_rel is not null then update competitive_relationships set active=false where id=v_rel and organization_id=e.organization_id;
 end if;
 update event_portfolio_matches set review_status=p_status,relationship_type=p_type,rationale=trim(p_rationale),competitive_relationship_id=v_rel,reviewed_by=auth.uid(),reviewed_at=now() where id=m.id;
 insert into event_review_log(organization_id,event_id,actor_id,action,details) values(e.organization_id,e.id,auth.uid(),'competition_'||p_status,jsonb_build_object('match_id',m.id,'previous_status',m.review_status,'type',p_type,'rationale',p_rationale));
 if e.organizer_company_id is not null then perform recalculate_company_score(e.organizer_company_id); end if;
end $$;
revoke all on function public.resolve_event_organizer(uuid,uuid,text,text,text) from public,anon;
revoke all on function public.review_event_match(uuid,text,public.relationship_type,text) from public,anon;
grant execute on function public.resolve_event_organizer(uuid,uuid,text,text,text),public.review_event_match(uuid,text,public.relationship_type,text) to authenticated;
