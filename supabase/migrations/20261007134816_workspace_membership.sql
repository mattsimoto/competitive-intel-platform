-- Access is granted by active, server-controlled membership, never by email
-- domain, client metadata, or merely having an Auth account.
create schema if not exists private;
revoke all on schema private from public,anon,authenticated;
create or replace function public.auth_org_id() returns uuid language sql stable security definer set search_path='' as $$
 select organization_id from public.users where id=auth.uid() and active;
$$;
create or replace function public.auth_role() returns public.user_role language sql stable security definer set search_path='' as $$
 select role from public.users where id=auth.uid() and active;
$$;
create table public.workspace_invitations (
 id uuid primary key default gen_random_uuid(), organization_id uuid not null references public.organizations(id),
 email text not null, role public.user_role not null default 'viewer', token_hash text not null unique check(length(token_hash)=64),
 created_by uuid not null references public.users(id), created_at timestamptz not null default now(),
 expires_at timestamptz not null default now()+interval '7 days', revoked_at timestamptz, accepted_at timestamptz, accepted_by uuid references auth.users(id),
 check(email=lower(trim(email))),check(expires_at>created_at)
);
create index workspace_invitations_org on public.workspace_invitations(organization_id,created_at desc);
create table public.membership_audit (
 id uuid primary key default gen_random_uuid(),organization_id uuid not null references public.organizations(id),
 actor_id uuid references auth.users(id), action text not null, target_user_id uuid, details jsonb not null default '{}',created_at timestamptz not null default now()
);
alter table public.workspace_invitations enable row level security;
alter table public.membership_audit enable row level security;
create policy invitations_read on public.workspace_invitations for select to authenticated using(organization_id=public.auth_org_id() and public.auth_is_admin());
create policy membership_audit_read on public.membership_audit for select to authenticated using(organization_id=public.auth_org_id() and public.auth_is_admin());
revoke all on public.workspace_invitations,public.membership_audit from anon,authenticated;
grant select on public.workspace_invitations,public.membership_audit to authenticated;
-- All membership writes go through the checked, audited functions below.
drop policy if exists users_write on public.users;
revoke insert,update,delete on public.users from anon,authenticated;

create function public.create_workspace_invitation(p_email text,p_role public.user_role,p_hash text) returns uuid
language plpgsql security definer set search_path='' as $$
declare org uuid:=public.auth_org_id(); result uuid;
begin
 if auth.uid() is null or org is null or not public.auth_is_admin() then raise exception 'Administrator access required'; end if;
 perform 1 from public.organizations where id=org for update;
 if p_email is null or p_email !~ '^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$' or length(p_email)>254 or p_hash is null or p_hash !~ '^[a-f0-9]{64}$' or p_role is null then raise exception 'Invalid invitation'; end if;
 if exists(select 1 from public.users where organization_id=org and lower(email)=lower(trim(p_email))) then raise exception 'This person already has membership; manage their account below'; end if;
 update public.workspace_invitations set revoked_at=now() where organization_id=org and email=lower(trim(p_email)) and accepted_at is null and revoked_at is null;
 insert into public.workspace_invitations(organization_id,email,role,token_hash,created_by) values(org,lower(trim(p_email)),p_role,p_hash,auth.uid()) returning id into result;
 insert into public.membership_audit(organization_id,actor_id,action,details) values(org,auth.uid(),'invitation_created',jsonb_build_object('invitation_id',result,'email',lower(trim(p_email)),'role',p_role));
 return result;
end $$;
-- Only a random token's SHA-256 hash is stored. Public preview discloses no
-- member data and requires BOTH the secret and its intended email address.
create function public.inspect_workspace_invitation(p_hash text,p_email text) returns jsonb
language sql stable security definer set search_path='' as $$
 select jsonb_build_object('workspace',o.name,'role',i.role,'expires_at',i.expires_at)
 from public.workspace_invitations i join public.organizations o on o.id=i.organization_id
 join public.users creator on creator.id=i.created_by and creator.active and creator.role='administrator' and creator.organization_id=i.organization_id
 where i.token_hash=p_hash and i.email=lower(trim(p_email)) and i.revoked_at is null and i.accepted_at is null and i.expires_at>now();
$$;
create function public.accept_workspace_invitation(p_hash text,p_name text) returns uuid
language plpgsql security definer set search_path='' as $$
declare invite public.workspace_invitations; person auth.users; existing public.users;
begin
 if auth.uid() is null then raise exception 'Sign in first'; end if;
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
create function public.revoke_workspace_invitation(p_id uuid) returns void
language plpgsql security definer set search_path='' as $$
declare org uuid:=public.auth_org_id();
begin
 if auth.uid() is null or org is null or not public.auth_is_admin() then raise exception 'Administrator access required'; end if;
 perform 1 from public.organizations where id=org for update;
 update public.workspace_invitations set revoked_at=now() where id=p_id and organization_id=org and accepted_at is null;
 if not found then raise exception 'Pending invitation not found'; end if;
 insert into public.membership_audit(organization_id,actor_id,action,details) values(org,auth.uid(),'invitation_revoked',jsonb_build_object('invitation_id',p_id));
end $$;
create function public.manage_workspace_member(p_user uuid,p_role public.user_role,p_active boolean) returns void
language plpgsql security definer set search_path='' as $$
declare org uuid:=public.auth_org_id(); target public.users;
begin
 if auth.uid() is null or org is null or not public.auth_is_admin() then raise exception 'Administrator access required'; end if;
 perform 1 from public.organizations where id=org for update;
 select * into target from public.users where id=p_user and organization_id=org for update;
 if target.id is null or p_role is null or p_active is null then raise exception 'Invalid member'; end if;
 if p_user=auth.uid() and (not p_active or p_role<>'administrator') then raise exception 'You cannot deactivate or demote your own administrator account'; end if;
 if target.active and target.role='administrator' and (not p_active or p_role<>'administrator') and not exists(select 1 from public.users where organization_id=org and id<>p_user and active and role='administrator') then raise exception 'Keep at least one active administrator'; end if;
 update public.users set role=p_role,active=p_active where id=p_user;
 if not p_active or p_role<>'administrator' then update public.workspace_invitations set revoked_at=now() where created_by=p_user and organization_id=org and accepted_at is null and revoked_at is null; end if;
 insert into public.membership_audit(organization_id,actor_id,target_user_id,action,details) values(org,auth.uid(),p_user,'membership_updated',jsonb_build_object('previous_role',target.role,'role',p_role,'previous_active',target.active,'active',p_active));
end $$;
-- Harden the older administrative helper without bypassing existing RLS.
create or replace function public.set_scoring_weights(p_weights jsonb) returns integer
language plpgsql security invoker set search_path='' as $$
declare org uuid:=public.auth_org_id(); k text; v numeric; rescored int;
begin
 if auth.uid() is null or org is null or not public.auth_is_admin() then raise exception 'Administrator access required'; end if;
 for k,v in select key,value::numeric from jsonb_each_text(p_weights) loop
  update public.scoring_weights set weight=v,updated_at=now() where organization_id=org and factor=k;
 end loop;
 rescored:=public.recalculate_all_scores(org);return rescored;
end $$;
revoke all on function public.create_workspace_invitation(text,public.user_role,text),public.inspect_workspace_invitation(text,text),public.accept_workspace_invitation(text,text),public.revoke_workspace_invitation(uuid),public.manage_workspace_member(uuid,public.user_role,boolean),public.set_scoring_weights(jsonb) from public,anon,authenticated;
grant execute on function public.inspect_workspace_invitation(text,text) to anon,authenticated;
grant execute on function public.create_workspace_invitation(text,public.user_role,text),public.accept_workspace_invitation(text,text),public.revoke_workspace_invitation(uuid),public.manage_workspace_member(uuid,public.user_role,boolean),public.set_scoring_weights(jsonb) to authenticated;
