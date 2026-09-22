-- =============================================================================
-- Competitive Intelligence Platform — core schema
-- Migration 0001: extensions, enums, tables, indexes, full-text search
--
-- Design notes:
--   * Every tenant-owned row carries organization_id (NOT NULL) so row-level
--     security can isolate organizations. This includes the taxonomy tables,
--     which Section 6 of the spec left un-scoped; scoping them keeps RLS uniform
--     and lets each org edit its own taxonomy. Seeded per-org (see 0003 trigger).
--   * Current state lives in the main tables; history is append-only
--     (pricing_history, competitive_changes) or versioned via observations.
--   * Money is numeric(14,2) + a currency code. Source pricing is messy free
--     text, so unparseable prices are kept as raw text on pricing_history.
--   * All timestamps are timestamptz in UTC.
-- =============================================================================

create extension if not exists pgcrypto;   -- gen_random_uuid()
create extension if not exists pg_trgm;     -- trigram search on names

-- -----------------------------------------------------------------------------
-- Enumerated types
-- -----------------------------------------------------------------------------
create type user_role as enum ('administrator', 'analyst', 'viewer');

create type company_status as enum ('active', 'potential', 'inactive', 'archived');

create type ownership_type as enum
  ('public', 'private', 'pe_backed', 'vc_backed', 'subsidiary', 'nonprofit', 'unknown');

create type product_status as enum ('active', 'discontinued', 'unknown');

create type relationship_type as enum
  ('direct', 'partial', 'adjacent', 'emerging', 'substitute', 'partner_competitor', 'historical');

create type observation_type as enum
  ('product', 'pricing', 'topic', 'customer', 'partnership', 'acquisition',
   'event', 'audience', 'positioning', 'geography', 'product_status');

-- Shared by observations.review_status and competitive_changes.status.
create type review_status as enum
  ('pending', 'approved', 'rejected', 'deferred', 'auto_approved');

create type change_type as enum
  ('product_launch', 'product_removal', 'pricing_change', 'feature_change',
   'topic_expansion', 'event_launch', 'audience_change', 'customer_announcement',
   'partnership', 'acquisition', 'geographic_expansion', 'rebrand',
   'positioning_change', 'research_launch');

-- The Critical Product Rule (spec §25): every material claim carries one of these.
create type intelligence_status as enum
  ('verified', 'pending_review', 'low_confidence', 'conflicting', 'historical', 'rejected');

create type customer_relationship_type as enum
  ('customer', 'case_study', 'testimonial', 'reference', 'partner', 'unknown');

create type watchlist_entity_type as enum ('company', 'product', 'topic');

create type crawl_status as enum ('never_run', 'ok', 'error', 'disabled');

create type fetch_status as enum ('success', 'error', 'timeout', 'blocked');

-- -----------------------------------------------------------------------------
-- 6.1 organizations
-- -----------------------------------------------------------------------------
create table organizations (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  slug        text not null unique,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- -----------------------------------------------------------------------------
-- 6.2 users  (id mirrors Supabase auth.users.id)
-- -----------------------------------------------------------------------------
create table users (
  id               uuid primary key references auth.users (id) on delete cascade,
  organization_id  uuid not null references organizations (id) on delete cascade,
  email            text not null,
  full_name        text,
  role             user_role not null default 'viewer',
  active           boolean not null default true,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now()
);
create index users_org_idx on users (organization_id);

-- -----------------------------------------------------------------------------
-- Taxonomy (6.4, 6.6, 6.7, 6.10 + regions). Org-scoped, seeded per org.
-- -----------------------------------------------------------------------------
create table company_types (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  name             text not null,
  description      text,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),
  unique (organization_id, name)
);

create table source_types (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  name             text not null,
  description      text,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),
  unique (organization_id, name)
);

create table product_categories (
  id                  uuid primary key default gen_random_uuid(),
  organization_id     uuid not null references organizations (id) on delete cascade,
  name                text not null,
  description         text,
  parent_category_id  uuid references product_categories (id) on delete set null,
  active              boolean not null default true,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  unique (organization_id, name)
);
create index product_categories_org_idx on product_categories (organization_id);

create table topics (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  name             text not null,
  description      text,
  parent_topic_id  uuid references topics (id) on delete set null,
  active           boolean not null default true,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),
  unique (organization_id, name)
);
create index topics_org_idx on topics (organization_id);

create table regions (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  name             text not null,
  description      text,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),
  unique (organization_id, name)
);

-- -----------------------------------------------------------------------------
-- 6.3 companies
-- -----------------------------------------------------------------------------
create table companies (
  id                        uuid primary key default gen_random_uuid(),
  organization_id           uuid not null references organizations (id) on delete cascade,
  name                      text not null,
  normalized_name           text not null,
  description               text,
  website_url               text,
  logo_url                  text,
  parent_company_id         uuid references companies (id) on delete set null,
  company_type_id           uuid references company_types (id) on delete set null,
  headquarters              text,
  employee_range            text,
  ownership_type            ownership_type not null default 'unknown',
  status                    company_status not null default 'active',
  linkedin_url              text,
  x_url                     text,
  youtube_url               text,
  facebook_url              text,
  competitive_score         numeric(6,3),         -- raw; round for display
  confidence_score          numeric(6,3),
  intelligence_status       intelligence_status not null default 'pending_review',
  original_import_reference text,                 -- e.g. "Events!Row37" (spec §13)
  first_observed_at         timestamptz,
  last_verified_at          timestamptz,
  last_material_change_at   timestamptz,
  search_tsv                tsvector,
  created_at                timestamptz not null default now(),
  updated_at                timestamptz not null default now()
);
create index companies_org_idx        on companies (organization_id);
create index companies_norm_idx       on companies (organization_id, normalized_name);
create index companies_score_idx      on companies (organization_id, competitive_score desc);
create index companies_name_trgm_idx  on companies using gin (name gin_trgm_ops);
create index companies_tsv_idx        on companies using gin (search_tsv);

-- -----------------------------------------------------------------------------
-- 6.5 company_sources
-- -----------------------------------------------------------------------------
create table company_sources (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  company_id       uuid not null references companies (id) on delete cascade,
  source_type_id   uuid references source_types (id) on delete set null,
  name             text,
  url              text not null,
  priority         integer not null default 5,        -- 1 = highest
  crawl_frequency  text not null default 'daily',
  active           boolean not null default true,
  status           crawl_status not null default 'never_run',
  last_checked_at  timestamptz,
  last_changed_at  timestamptz,
  last_success_at  timestamptz,
  last_error       text,
  content_hash     text,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now()
);
create index company_sources_company_idx on company_sources (company_id);
create index company_sources_due_idx     on company_sources (organization_id, active, priority);

-- -----------------------------------------------------------------------------
-- 6.8 products
-- -----------------------------------------------------------------------------
create table products (
  id                        uuid primary key default gen_random_uuid(),
  organization_id           uuid not null references organizations (id) on delete cascade,
  company_id                uuid not null references companies (id) on delete cascade,
  name                      text not null,
  normalized_name           text not null,
  product_category_id       uuid references product_categories (id) on delete set null,
  description               text,
  product_url               text,
  pricing_model             text,
  current_price_min         numeric(14,2),
  current_price_max         numeric(14,2),
  currency                  text default 'USD',
  pricing_unit              text,
  audience_description      text,
  geography                 text,
  status                    product_status not null default 'active',
  intelligence_status       intelligence_status not null default 'pending_review',
  original_import_reference text,
  first_observed_at         timestamptz,
  last_verified_at          timestamptz,
  discontinued_at           timestamptz,
  confidence_score          numeric(6,3),
  search_tsv                tsvector,
  created_at                timestamptz not null default now(),
  updated_at                timestamptz not null default now()
);
create index products_company_idx  on products (company_id);
create index products_category_idx on products (product_category_id);
create index products_tsv_idx      on products using gin (search_tsv);

-- -----------------------------------------------------------------------------
-- 6.18 source_documents (retrieved content; stored before any AI runs)
-- -----------------------------------------------------------------------------
create table source_documents (
  id                 uuid primary key default gen_random_uuid(),
  organization_id    uuid not null references organizations (id) on delete cascade,
  company_source_id  uuid not null references company_sources (id) on delete cascade,
  fetched_at         timestamptz not null default now(),
  published_at       timestamptz,
  title              text,
  raw_text           text,
  cleaned_text       text,
  content_hash       text,
  metadata_json      jsonb not null default '{}'::jsonb,
  archive_location   text,                              -- Supabase Storage path
  fetch_status       fetch_status not null default 'success',
  created_at         timestamptz not null default now()
);
create index source_documents_source_idx on source_documents (company_source_id, fetched_at desc);

-- -----------------------------------------------------------------------------
-- 6.19 observations (typed extracted facts; the evidence spine)
-- -----------------------------------------------------------------------------
create table observations (
  id                  uuid primary key default gen_random_uuid(),
  organization_id     uuid not null references organizations (id) on delete cascade,
  company_id          uuid references companies (id) on delete cascade,
  product_id          uuid references products (id) on delete cascade,
  source_document_id  uuid references source_documents (id) on delete set null,
  observation_type    observation_type not null,
  field_name          text,
  observed_value_json jsonb not null default '{}'::jsonb,
  supporting_text     text,                              -- exact quote from source
  source_url          text,
  confidence_score    numeric(6,3),
  observed_at         timestamptz,
  extracted_by        text,                              -- 'ai:<model>' | 'import' | 'human'
  review_status       review_status not null default 'pending',
  created_at          timestamptz not null default now()
);
create index observations_company_idx on observations (company_id);
create index observations_product_idx on observations (product_id);
create index observations_type_idx    on observations (organization_id, observation_type);

-- -----------------------------------------------------------------------------
-- 6.9 product_features
-- -----------------------------------------------------------------------------
create table product_features (
  id                    uuid primary key default gen_random_uuid(),
  organization_id       uuid not null references organizations (id) on delete cascade,
  product_id            uuid not null references products (id) on delete cascade,
  feature_name          text not null,
  feature_value         text,
  source_observation_id uuid references observations (id) on delete set null,
  last_verified_at      timestamptz,
  created_at            timestamptz not null default now(),
  updated_at            timestamptz not null default now()
);
create index product_features_product_idx on product_features (product_id);

-- -----------------------------------------------------------------------------
-- 6.11 product_topics / 6.12 company_topics
-- -----------------------------------------------------------------------------
create table product_topics (
  id                uuid primary key default gen_random_uuid(),
  organization_id   uuid not null references organizations (id) on delete cascade,
  product_id        uuid not null references products (id) on delete cascade,
  topic_id          uuid not null references topics (id) on delete cascade,
  relevance_score   numeric(6,3),
  first_observed_at timestamptz,
  last_verified_at  timestamptz,
  created_at        timestamptz not null default now(),
  unique (product_id, topic_id)
);

create table company_topics (
  id                uuid primary key default gen_random_uuid(),
  organization_id   uuid not null references organizations (id) on delete cascade,
  company_id        uuid not null references companies (id) on delete cascade,
  topic_id          uuid not null references topics (id) on delete cascade,
  activity_score    numeric(6,3),
  first_observed_at timestamptz,
  last_activity_at  timestamptz,
  last_verified_at  timestamptz,
  created_at        timestamptz not null default now(),
  unique (company_id, topic_id)
);

-- -----------------------------------------------------------------------------
-- 6.13 internal_products (the monitored portfolio; org's own offerings)
-- -----------------------------------------------------------------------------
create table internal_products (
  id                   uuid primary key default gen_random_uuid(),
  organization_id      uuid not null references organizations (id) on delete cascade,
  name                 text not null,
  product_category_id  uuid references product_categories (id) on delete set null,
  description          text,
  audience_description text,
  geography            text,
  active               boolean not null default true,
  created_at           timestamptz not null default now(),
  updated_at           timestamptz not null default now(),
  unique (organization_id, name)
);

-- -----------------------------------------------------------------------------
-- 6.14 competitive_relationships (granular: competitor offering vs monitored)
-- -----------------------------------------------------------------------------
create table competitive_relationships (
  id                      uuid primary key default gen_random_uuid(),
  organization_id         uuid not null references organizations (id) on delete cascade,
  competitor_company_id   uuid not null references companies (id) on delete cascade,
  competitor_product_id   uuid references products (id) on delete cascade,
  internal_product_id     uuid not null references internal_products (id) on delete cascade,
  relationship_type       relationship_type not null default 'adjacent',
  overlap_score           numeric(6,3),
  audience_overlap_score  numeric(6,3),
  topic_overlap_score     numeric(6,3),
  geography_overlap_score numeric(6,3),
  notes                   text,
  confidence_score        numeric(6,3),
  first_observed_at       timestamptz,
  last_verified_at        timestamptz,
  active                  boolean not null default true,
  created_at              timestamptz not null default now(),
  updated_at              timestamptz not null default now()
);
create index comp_rel_company_idx  on competitive_relationships (competitor_company_id);
create index comp_rel_internal_idx on competitive_relationships (internal_product_id);

-- -----------------------------------------------------------------------------
-- 6.15 pricing_history (append-only; never overwrite)
-- -----------------------------------------------------------------------------
create table pricing_history (
  id                    uuid primary key default gen_random_uuid(),
  organization_id       uuid not null references organizations (id) on delete cascade,
  product_id            uuid not null references products (id) on delete cascade,
  price_min             numeric(14,2),
  price_max             numeric(14,2),
  currency              text default 'USD',
  pricing_unit          text,
  pricing_model         text,
  raw_price_text        text,                          -- unparsed source pricing
  observed_at           timestamptz not null default now(),
  source_observation_id uuid references observations (id) on delete set null,
  confidence_score      numeric(6,3),
  created_at            timestamptz not null default now()
);
create index pricing_history_product_idx on pricing_history (product_id, observed_at desc);

-- -----------------------------------------------------------------------------
-- 6.16 customers / 6.17 company_customers
-- -----------------------------------------------------------------------------
create table customers (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  name             text not null,
  normalized_name  text not null,
  website_url      text,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),
  unique (organization_id, normalized_name)
);

create table company_customers (
  id                    uuid primary key default gen_random_uuid(),
  organization_id       uuid not null references organizations (id) on delete cascade,
  company_id            uuid not null references companies (id) on delete cascade,
  customer_id           uuid not null references customers (id) on delete cascade,
  product_id            uuid references products (id) on delete set null,
  relationship_type     customer_relationship_type not null default 'unknown',
  first_observed_at     timestamptz,
  last_verified_at      timestamptz,
  source_observation_id uuid references observations (id) on delete set null,
  confidence_score      numeric(6,3),
  created_at            timestamptz not null default now(),
  unique (company_id, customer_id, product_id)
);
create index company_customers_company_idx on company_customers (company_id);

-- -----------------------------------------------------------------------------
-- 6.20 competitive_changes (proposed diff -> review -> applied)
-- -----------------------------------------------------------------------------
create table competitive_changes (
  id                 uuid primary key default gen_random_uuid(),
  organization_id    uuid not null references organizations (id) on delete cascade,
  company_id         uuid references companies (id) on delete cascade,
  product_id         uuid references products (id) on delete cascade,
  observation_id     uuid references observations (id) on delete set null,
  change_type        change_type not null,
  previous_value_json jsonb,
  new_value_json      jsonb,
  significance_score  numeric(6,3),
  confidence_score    numeric(6,3),
  detected_at         timestamptz not null default now(),
  approved_at         timestamptz,
  approved_by         uuid references users (id) on delete set null,
  status              review_status not null default 'pending',
  summary             text,
  created_at          timestamptz not null default now()
);
create index comp_changes_status_idx  on competitive_changes (organization_id, status, detected_at desc);
create index comp_changes_company_idx on competitive_changes (company_id, detected_at desc);

-- -----------------------------------------------------------------------------
-- 6.21 competitive_scores (history; one row per calculation)
-- -----------------------------------------------------------------------------
create table competitive_scores (
  id                    uuid primary key default gen_random_uuid(),
  organization_id       uuid not null references organizations (id) on delete cascade,
  company_id            uuid not null references companies (id) on delete cascade,
  calculated_at         timestamptz not null default now(),
  total_score           numeric(6,3),
  product_overlap_score numeric(6,3),
  audience_overlap_score numeric(6,3),
  topic_overlap_score   numeric(6,3),
  customer_overlap_score numeric(6,3),
  pricing_score         numeric(6,3),
  activity_score        numeric(6,3),
  geography_score       numeric(6,3),
  expansion_score       numeric(6,3),
  explanation_json      jsonb not null default '{}'::jsonb,
  created_at            timestamptz not null default now()
);
create index comp_scores_company_idx on competitive_scores (company_id, calculated_at desc);

-- -----------------------------------------------------------------------------
-- 6.22 scoring_weights (per org; must total 100 — enforced in app + 0003)
-- -----------------------------------------------------------------------------
create table scoring_weights (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  factor           text not null,
  weight           numeric(6,2) not null,
  active           boolean not null default true,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),
  unique (organization_id, factor)
);

-- -----------------------------------------------------------------------------
-- 6.23 watchlists / 6.24 watchlist_items
-- -----------------------------------------------------------------------------
create table watchlists (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations (id) on delete cascade,
  user_id          uuid not null references users (id) on delete cascade,
  name             text not null,
  description      text,
  shared           boolean not null default false,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now()
);
create index watchlists_owner_idx on watchlists (organization_id, user_id);

create table watchlist_items (
  id           uuid primary key default gen_random_uuid(),
  watchlist_id uuid not null references watchlists (id) on delete cascade,
  entity_type  watchlist_entity_type not null,
  entity_id    uuid not null,
  created_at   timestamptz not null default now(),
  unique (watchlist_id, entity_type, entity_id)
);

-- -----------------------------------------------------------------------------
-- 6.25 alert_rules
-- -----------------------------------------------------------------------------
create table alert_rules (
  id                   uuid primary key default gen_random_uuid(),
  organization_id      uuid not null references organizations (id) on delete cascade,
  user_id              uuid not null references users (id) on delete cascade,
  name                 text not null,
  change_type          change_type,
  company_id           uuid references companies (id) on delete cascade,
  product_category_id  uuid references product_categories (id) on delete cascade,
  topic_id             uuid references topics (id) on delete cascade,
  minimum_significance numeric(6,3),
  delivery_method      text not null default 'in_app',
  active               boolean not null default true,
  created_at           timestamptz not null default now(),
  updated_at           timestamptz not null default now()
);
create index alert_rules_user_idx on alert_rules (user_id);

-- -----------------------------------------------------------------------------
-- 6.26 review_actions (audit trail for every review decision)
-- -----------------------------------------------------------------------------
create table review_actions (
  id                    uuid primary key default gen_random_uuid(),
  organization_id       uuid not null references organizations (id) on delete cascade,
  competitive_change_id uuid not null references competitive_changes (id) on delete cascade,
  user_id               uuid references users (id) on delete set null,
  action                text not null,                 -- approve | edit_approve | reject | defer | mark_duplicate
  notes                 text,
  performed_at          timestamptz not null default now()
);
create index review_actions_change_idx on review_actions (competitive_change_id, performed_at desc);
