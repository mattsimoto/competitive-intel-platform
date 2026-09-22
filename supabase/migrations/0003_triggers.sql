-- =============================================================================
-- Migration 0003: triggers and per-org seeding
-- =============================================================================

-- updated_at maintenance, attached to every table that has the column.
create or replace function set_updated_at() returns trigger
  language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

do $$
declare t text;
begin
  for t in
    select table_name from information_schema.columns
    where table_schema = 'public' and column_name = 'updated_at'
  loop
    execute format(
      'create trigger %1$s_set_updated_at before update on public.%1$I
         for each row execute function set_updated_at();', t);
  end loop;
end $$;

-- Full-text search vectors for global search.
create or replace function companies_tsv_update() returns trigger
  language plpgsql as $$
begin
  new.search_tsv = to_tsvector('english',
    coalesce(new.name, '') || ' ' || coalesce(new.description, ''));
  return new;
end $$;
create trigger companies_tsv before insert or update of name, description
  on public.companies for each row execute function companies_tsv_update();

create or replace function products_tsv_update() returns trigger
  language plpgsql as $$
begin
  new.search_tsv = to_tsvector('english',
    coalesce(new.name, '') || ' ' || coalesce(new.description, ''));
  return new;
end $$;
create trigger products_tsv before insert or update of name, description
  on public.products for each row execute function products_tsv_update();

-- Scoring weights must total 100 per org (active rows). Deferred to commit so
-- multi-row edits can be applied in one transaction.
create or replace function check_scoring_weights_total() returns trigger
  language plpgsql as $$
declare
  org uuid := coalesce(new.organization_id, old.organization_id);
  total numeric;
begin
  select coalesce(sum(weight), 0) into total
    from public.scoring_weights
    where organization_id = org and active;
  if abs(total - 100) > 0.01 then
    raise exception 'Active scoring weights for org % must total 100, got %', org, total;
  end if;
  return null;
end $$;

create constraint trigger scoring_weights_total_guard
  after insert or update or delete on public.scoring_weights
  deferrable initially deferred
  for each row execute function check_scoring_weights_total();

-- -----------------------------------------------------------------------------
-- Per-org defaults: taxonomy (spec §23), company/source types, scoring weights.
-- internal_products are NOT seeded — those are supplied by the administrator.
-- -----------------------------------------------------------------------------
create or replace function seed_org_defaults(org uuid) returns void
  language plpgsql as $$
begin
  insert into public.company_types (organization_id, name)
  select org, x from unnest(array[
    'Media','Research','Community','Events','Marketing Services','Analyst',
    'Training','Software','Agency','Association'
  ]) x;

  insert into public.source_types (organization_id, name)
  select org, x from unnest(array[
    'Website','Product Page','Pricing Page','Blog','Newsroom','Press Release',
    'LinkedIn','X','YouTube','RSS','News','Event Calendar','Press Wire','Podcast'
  ]) x;

  insert into public.product_categories (organization_id, name)
  select org, x from unnest(array[
    'Advertising','ABM','Audience Development','Buyer Intelligence','Communities',
    'Conferences','Content Creation','Content Syndication','Custom Content',
    'Demand Generation','Executive Dinners','Lead Generation','Marketing Services',
    'Membership','Newsletters','Podcasts','PR Services','Research','Roundtables',
    'Training','Video','Virtual Events','Webcasts'
  ]) x;

  insert into public.topics (organization_id, name)
  select org, x from unnest(array[
    'AI Governance','AI Security','Application Security','Attack Surface Management',
    'Cloud Security','Critical Infrastructure','Data Security','DevSecOps',
    'Exposure Management','Financial Services Security','Identity Governance',
    'Identity Security','Network Security','Non-Human Identity',
    'Operational Resilience','OT Security','Post-Quantum Security','Ransomware',
    'SecOps','Threat Intelligence','Vulnerability Management'
  ]) x;

  insert into public.regions (organization_id, name)
  select org, x from unnest(array[
    'North America','EMEA','APAC','LATAM','Global'
  ]) x;

  insert into public.scoring_weights (organization_id, factor, weight) values
    (org, 'product_overlap', 25),
    (org, 'audience_overlap', 20),
    (org, 'topic_overlap', 15),
    (org, 'customer_overlap', 10),
    (org, 'pricing_competitiveness', 10),
    (org, 'market_activity', 10),
    (org, 'geographic_overlap', 5),
    (org, 'recent_expansion', 5);
end $$;

create or replace function seed_org_defaults_trigger() returns trigger
  language plpgsql as $$
begin
  perform seed_org_defaults(new.id);
  return new;
end $$;

create trigger organizations_seed_defaults after insert on public.organizations
  for each row execute function seed_org_defaults_trigger();
