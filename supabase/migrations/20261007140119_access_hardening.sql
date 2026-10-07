create or replace function public.accept_workspace_invitation(p_hash text,p_name text) returns uuid
language plpgsql security definer set search_path='' as $$
declare invite public.workspace_invitations; person auth.users; existing public.users;
begin
 if auth.uid() is null then raise exception 'Sign in first'; end if;
 if not exists(select 1 from jsonb_array_elements(coalesce(auth.jwt()->'amr','[]'::jsonb)) method where method->>'method'='otp') then raise exception 'Email link verification required'; end if;
 select * into person from auth.users where id=auth.uid();
 if person.id is null or person.email_confirmed_at is null or person.is_anonymous then raise exception 'Verify your email address before joining'; end if;
 select * into invite from public.workspace_invitations where token_hash=p_hash;
 if invite.id is null or invite.email is distinct from lower(person.email) or invite.revoked_at is not null or invite.accepted_at is not null or invite.expires_at<=now() then raise exception 'Invitation is invalid, expired, used, or belongs to another email'; end if;
 perform 1 from public.organizations where id=invite.organization_id for update;
 select * into invite from public.workspace_invitations where token_hash=p_hash for update;
 if invite.revoked_at is not null or invite.accepted_at is not null or invite.expires_at<=now() then raise exception 'Invitation is no longer available'; end if;
 if not exists(select 1 from public.users where id=invite.created_by and organization_id=invite.organization_id and active and role='administrator') then raise exception 'Invitation issuer no longer has administrator access'; end if;
 select * into existing from public.users where id=person.id;
 if existing.id is not null then raise exception 'This account already has membership; contact its administrator'; end if;
 insert into public.users(id,organization_id,email,full_name,role,active) values(person.id,invite.organization_id,person.email,left(trim(p_name),200),invite.role,true);
 update public.workspace_invitations set accepted_at=now(),accepted_by=person.id where id=invite.id;
 insert into public.membership_audit(organization_id,actor_id,target_user_id,action,details) values(invite.organization_id,person.id,person.id,'invitation_accepted',jsonb_build_object('invitation_id',invite.id,'role',invite.role));
 return invite.organization_id;
end $$;

-- Pin existing RLS-protected helper functions to prevent mutable name lookup.
do $$ declare f record; begin
 for f in select oid::regprocedure signature from pg_proc where pronamespace='public'::regnamespace and proname in
 ('set_updated_at','companies_tsv_update','products_tsv_update','check_scoring_weights_total','seed_org_defaults','seed_org_defaults_trigger','compute_product_overlap','factor_stub','recalculate_company_score','recalculate_all_scores','seed_review_items','seed_company_sources','resolve_products_from_crawl') loop
 execute format('alter function %s set search_path=public',f.signature);
 end loop;
end $$;
