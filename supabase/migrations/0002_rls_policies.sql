-- =============================================================================
-- Migration 0002: Row-Level Security
--
-- Isolation model:
--   * auth_org_id() resolves the caller's organization from public.users.
--     It is SECURITY DEFINER so it bypasses RLS on users (no recursion).
--   * Standard tenant tables: any authenticated org member may SELECT; only
--     analysts and administrators may write.
--   * Admin-config tables (taxonomy, weights, portfolio, users, org): admin
--     writes only.
--   * Watchlists/items/alerts: owner-scoped (viewers may keep personal
--     watchlists; alerts require analyst+).
--
-- Role checks are also enforced server-side in the app; RLS is the backstop
-- that holds even if application code is wrong. The ingestion worker uses the
-- service-role key, which bypasses RLS by design.
-- =============================================================================

create or replace function auth_org_id() returns uuid
  language sql stable security definer set search_path = public as $$
  select organization_id from public.users where id = auth.uid();
$$;

create or replace function auth_role() returns user_role
  language sql stable security definer set search_path = public as $$
  select role from public.users where id = auth.uid();
$$;

create or replace function auth_can_edit() returns boolean
  language sql stable as $$ select auth_role() in ('administrator', 'analyst'); $$;

create or replace function auth_is_admin() returns boolean
  language sql stable as $$ select auth_role() = 'administrator'; $$;

-- Enable RLS on every table in the public schema.
do $$
declare t text;
begin
  for t in select tablename from pg_tables where schemaname = 'public'
  loop
    execute format('alter table public.%I enable row level security;', t);
  end loop;
end $$;

-- Standard tenant tables: read = org member, write = analyst/admin.
do $$
declare t text;
declare standard_tables text[] := array[
  'companies','company_sources','products','product_features','product_topics',
  'company_topics','competitive_relationships','pricing_history','customers',
  'company_customers','source_documents','observations','competitive_changes',
  'competitive_scores','review_actions'
];
begin
  foreach t in array standard_tables loop
    execute format($f$
      create policy %1$s_select on public.%1$I for select
        using (organization_id = auth_org_id());
    $f$, t);
    execute format($f$
      create policy %1$s_write on public.%1$I for all
        using (organization_id = auth_org_id() and auth_can_edit())
        with check (organization_id = auth_org_id() and auth_can_edit());
    $f$, t);
  end loop;
end $$;

-- Admin-config tables: read = org member, write = admin only.
do $$
declare t text;
declare admin_tables text[] := array[
  'company_types','source_types','product_categories','topics','regions',
  'internal_products','scoring_weights'
];
begin
  foreach t in array admin_tables loop
    execute format($f$
      create policy %1$s_select on public.%1$I for select
        using (organization_id = auth_org_id());
    $f$, t);
    execute format($f$
      create policy %1$s_write on public.%1$I for all
        using (organization_id = auth_org_id() and auth_is_admin())
        with check (organization_id = auth_org_id() and auth_is_admin());
    $f$, t);
  end loop;
end $$;

-- organizations: members read their own org; admins update it.
create policy organizations_select on public.organizations for select
  using (id = auth_org_id());
create policy organizations_update on public.organizations for update
  using (id = auth_org_id() and auth_is_admin())
  with check (id = auth_org_id() and auth_is_admin());

-- users: members read their org's users; admins manage them.
create policy users_select on public.users for select
  using (organization_id = auth_org_id());
create policy users_write on public.users for all
  using (organization_id = auth_org_id() and auth_is_admin())
  with check (organization_id = auth_org_id() and auth_is_admin());

-- watchlists: visible if shared within org or owned; owner manages (any role).
create policy watchlists_select on public.watchlists for select
  using (organization_id = auth_org_id() and (shared or user_id = auth.uid()));
create policy watchlists_write on public.watchlists for all
  using (organization_id = auth_org_id() and user_id = auth.uid())
  with check (organization_id = auth_org_id() and user_id = auth.uid());

-- watchlist_items: follow the parent watchlist's visibility/ownership.
create policy watchlist_items_select on public.watchlist_items for select
  using (exists (
    select 1 from public.watchlists w
    where w.id = watchlist_id
      and w.organization_id = auth_org_id()
      and (w.shared or w.user_id = auth.uid())));
create policy watchlist_items_write on public.watchlist_items for all
  using (exists (
    select 1 from public.watchlists w
    where w.id = watchlist_id
      and w.organization_id = auth_org_id()
      and w.user_id = auth.uid()))
  with check (exists (
    select 1 from public.watchlists w
    where w.id = watchlist_id
      and w.organization_id = auth_org_id()
      and w.user_id = auth.uid()));

-- alert_rules: owner-scoped; creating an alert requires analyst+.
create policy alert_rules_select on public.alert_rules for select
  using (organization_id = auth_org_id() and user_id = auth.uid());
create policy alert_rules_write on public.alert_rules for all
  using (organization_id = auth_org_id() and user_id = auth.uid() and auth_can_edit())
  with check (organization_id = auth_org_id() and user_id = auth.uid() and auth_can_edit());
