-- Compatibility with the existing products schema.
create or replace function public.resolve_event_organizer(p_event uuid,p_company uuid,p_name text,p_evidence text,p_notes text) returns uuid
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
