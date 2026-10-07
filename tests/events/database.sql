-- Integration assertions against the live schema. Everything rolls back.
-- Run with Supabase execute_sql as postgres after importing the calendar.
begin;
create temporary table event_test_context as
select u.id user_id,u.organization_id,
 (select m.id from event_portfolio_matches m join industry_events e on e.id=m.event_id where e.organization_id=u.organization_id and e.scope='external' limit 1) match_id,
 (select e.id from industry_events e where e.organization_id=u.organization_id and e.scope='unresolved' limit 1) unresolved_id
from users u where u.active and u.role='administrator' limit 1;
grant select on event_test_context to authenticated;
select set_config('request.jwt.claims',jsonb_build_object('sub',user_id,'role','authenticated')::text,true) from event_test_context;
set local role authenticated;
do $$
declare ctx record; rel uuid; rel_again uuid; p uuid; v_event uuid; v_company uuid; v_portfolio uuid; original_count integer; failed boolean;
begin
 select * into ctx from event_test_context;
 if ctx.user_id is null then raise exception 'No test administrator'; end if;
 if (select count(*) from industry_events)<>126 then raise exception 'Calendar read or import count failed'; end if;
 if exists(select 1 from industry_events where scope='internal' and (product_id is not null or organizer_company_id is not null)) then raise exception 'Internal competitor pollution'; end if;
 -- Proposals must not affect scores. Approval creates one active relation and audit.
 perform review_event_match(ctx.match_id,'approved','partial','Integration test: practitioner audience and sponsor attention overlap.');
 select competitive_relationship_id,event_id,internal_product_id into rel,v_event,v_portfolio from event_portfolio_matches where id=ctx.match_id;
 if rel is null or not exists(select 1 from competitive_relationships where id=rel and active) then raise exception 'Approval did not create an active relationship'; end if;
 if not exists(select 1 from event_review_log where event_id=v_event and action='competition_approved' and actor_id=ctx.user_id) then raise exception 'Missing audit record'; end if;
 perform review_event_match(ctx.match_id,'approved','direct','Integration test: revised and approved audience overlap rationale.');
 select competitive_relationship_id into rel_again from event_portfolio_matches where id=ctx.match_id;
 if rel_again<>rel then raise exception 'Repeated approval created a duplicate relationship'; end if;
 perform review_event_match(ctx.match_id,'rejected','direct','Integration test: reject after reviewing the audience evidence.');
 if exists(select 1 from competitive_relationships where id=rel and active) then raise exception 'Rejected relation remained active'; end if;
 -- Unknown organizers cannot acquire approved competition.
 failed:=false;
 begin
  perform review_event_match((select id from event_portfolio_matches where event_id=ctx.unresolved_id limit 1),'approved','direct','Integration test: insufficient organizer evidence must be rejected.');
 exception when others then failed:=true; end;
 if not failed then raise exception 'Unverified organizer approval was allowed'; end if;
 -- Resolving an owner must create a correctly owned product and preserve the source.
 select count(*) into original_count from products;
 select organizer_company_id into v_company from industry_events where id=v_event;
 p:=resolve_event_organizer(ctx.unresolved_id,v_company,null,'https://example.com/official-evidence','Integration test evidence only; this transaction is rolled back.');
 if not exists(select 1 from industry_events e join products pr on pr.id=e.product_id where e.id=ctx.unresolved_id and e.scope='external' and e.organizer_status='verified' and e.product_id=p and pr.company_id=v_company) then raise exception 'Owner/product resolution failed'; end if;
 if (select count(*) from products)<>original_count+1 then raise exception 'Product creation failed'; end if;
 failed:=false;
 begin perform resolve_event_organizer(ctx.unresolved_id,v_company,null,'https://example.com/repeat','Integration test: repeated resolution must not duplicate products.'); exception when others then failed:=true; end;
 if not failed then raise exception 'Repeated owner resolution was allowed'; end if;
 -- Internal events must reject even proposed competition.
 failed:=false;
 begin
  insert into event_portfolio_matches(organization_id,event_id,internal_product_id,relationship_type,rationale)
  select ctx.organization_id,id,v_portfolio,'direct','Integration test: internal event must not compete against CRA.' from industry_events where scope='internal' limit 1;
 exception when others then failed:=true; end;
 if not failed then raise exception 'Internal event competitor match allowed'; end if;
end $$;
reset role;
-- Temporarily make this account a viewer, then verify permissions at DB level.
update users set role='viewer' where id=(select user_id from event_test_context);
set local role authenticated;
do $$ declare ctx record; failed boolean; affected integer;
begin
 select * into ctx from event_test_context;
 if (select count(*) from industry_events)<>126 then raise exception 'Viewer read failed'; end if;
 failed:=false;
 begin perform review_event_match(ctx.match_id,'approved','direct','Integration test: viewers must never approve competition.'); exception when others then failed:=true; end;
 if not failed then raise exception 'Viewer review allowed'; end if;
 failed:=false;
 begin perform resolve_event_organizer(ctx.unresolved_id,null,'Test organizer','https://example.com/','Integration test: viewers must never create organizers.'); exception when others then failed:=true; end;
 if not failed then raise exception 'Viewer owner resolution allowed'; end if;
 update industry_events set name='Viewer must not write' where id=ctx.unresolved_id;
 get diagnostics affected=row_count;
 if affected<>0 then raise exception 'Viewer table write allowed'; end if;
end $$;
reset role;
-- A JWT subject with no membership sees no tenant data and cannot call review.
select set_config('request.jwt.claims',jsonb_build_object('sub',gen_random_uuid(),'role','authenticated')::text,true);
set local role authenticated;
do $$ begin
 if exists(select 1 from industry_events) or exists(select 1 from event_portfolio_matches) or exists(select 1 from event_review_log) then raise exception 'Cross-tenant read leaked'; end if;
end $$;
reset role;
do $$ begin
 if has_function_privilege('anon','public.review_event_match(uuid,text,public.relationship_type,text)','execute') or has_function_privilege('anon','public.resolve_event_organizer(uuid,uuid,text,text,text)','execute') then raise exception 'Anonymous RPC allowed'; end if;
end $$;
rollback;
select 'PASS: import, tenant isolation, viewer permissions, owner resolution, duplicate protection, approval/rejection, audit history, internal-event guards, and anonymous RPC restrictions' result;
