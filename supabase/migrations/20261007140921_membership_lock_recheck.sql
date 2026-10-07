-- Recheck the actor after acquiring the membership lock.
create or replace function public.create_workspace_invitation(p_email text,p_role public.user_role,p_hash text) returns uuid
language plpgsql security definer set search_path='' as $$
declare org uuid:=public.auth_org_id(); result uuid;
begin
 if auth.uid() is null or org is null or not public.auth_is_admin() then raise exception 'Administrator access required'; end if;
 perform 1 from public.organizations where id=org for update;
 if public.auth_org_id() is distinct from org or not coalesce(public.auth_is_admin(),false) then raise exception 'Administrator access required'; end if;
 if p_email is null or p_email !~ '^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$' or length(p_email)>254 or p_hash is null or p_hash !~ '^[a-f0-9]{64}$' or p_role is null then raise exception 'Invalid invitation'; end if;
 if exists(select 1 from public.users where organization_id=org and lower(email)=lower(trim(p_email))) then raise exception 'This person already has membership; manage their account below'; end if;
 update public.workspace_invitations set revoked_at=now() where organization_id=org and email=lower(trim(p_email)) and accepted_at is null and revoked_at is null;
 insert into public.workspace_invitations(organization_id,email,role,token_hash,created_by) values(org,lower(trim(p_email)),p_role,p_hash,auth.uid()) returning id into result;
 insert into public.membership_audit(organization_id,actor_id,action,details) values(org,auth.uid(),'invitation_created',jsonb_build_object('invitation_id',result,'email',lower(trim(p_email)),'role',p_role));
 return result;
end $$;
create or replace function public.revoke_workspace_invitation(p_id uuid) returns void
language plpgsql security definer set search_path='' as $$
declare org uuid:=public.auth_org_id();
begin
 if auth.uid() is null or org is null or not public.auth_is_admin() then raise exception 'Administrator access required'; end if;
 perform 1 from public.organizations where id=org for update;
 if public.auth_org_id() is distinct from org or not coalesce(public.auth_is_admin(),false) then raise exception 'Administrator access required'; end if;
 update public.workspace_invitations set revoked_at=now() where id=p_id and organization_id=org and accepted_at is null;
 if not found then raise exception 'Pending invitation not found'; end if;
 insert into public.membership_audit(organization_id,actor_id,action,details) values(org,auth.uid(),'invitation_revoked',jsonb_build_object('invitation_id',p_id));
end $$;
create or replace function public.manage_workspace_member(p_user uuid,p_role public.user_role,p_active boolean) returns void
language plpgsql security definer set search_path='' as $$
declare org uuid:=public.auth_org_id(); target public.users;
begin
 if auth.uid() is null or org is null or not public.auth_is_admin() then raise exception 'Administrator access required'; end if;
 perform 1 from public.organizations where id=org for update;
 if public.auth_org_id() is distinct from org or not coalesce(public.auth_is_admin(),false) then raise exception 'Administrator access required'; end if;
 select * into target from public.users where id=p_user and organization_id=org for update;
 if target.id is null or p_role is null or p_active is null then raise exception 'Invalid member'; end if;
 if p_user=auth.uid() and (not p_active or p_role<>'administrator') then raise exception 'You cannot deactivate or demote your own administrator account'; end if;
 if target.active and target.role='administrator' and (not p_active or p_role<>'administrator') and not exists(select 1 from public.users where organization_id=org and id<>p_user and active and role='administrator') then raise exception 'Keep at least one active administrator'; end if;
 update public.users set role=p_role,active=p_active where id=p_user;
 if not p_active or p_role<>'administrator' then update public.workspace_invitations set revoked_at=now() where created_by=p_user and organization_id=org and accepted_at is null and revoked_at is null; end if;
 insert into public.membership_audit(organization_id,actor_id,target_user_id,action,details) values(org,auth.uid(),p_user,'membership_updated',jsonb_build_object('previous_role',target.role,'role',p_role,'previous_active',target.active,'active',p_active));
end $$;
