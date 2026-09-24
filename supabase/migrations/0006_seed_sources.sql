-- =============================================================================
-- Migration 0006: seed company_sources so the crawler has targets
--
-- The importer created companies and products but no monitored sources. This
-- creates one "Website" source per company (from website_url) and one
-- "Product Page" source per product (from product_url), skipping any that
-- already exist. Product pages get higher priority (1) than websites (3), so
-- the scheduler checks them first.
--
-- Usage:  select seed_company_sources();  -- returns number of sources created
-- =============================================================================

create or replace function seed_company_sources() returns integer
  language plpgsql as $$
declare
  total int := 0;
  m int;
begin
  insert into company_sources (organization_id, company_id, source_type_id, name, url, priority, active, status)
  select c.organization_id, c.id,
         (select id from source_types st where st.organization_id = c.organization_id and st.name = 'Website' limit 1),
         'Website', c.website_url, 3, true, 'never_run'
  from companies c
  where c.website_url is not null and c.website_url <> ''
    and not exists (select 1 from company_sources cs where cs.company_id = c.id and cs.url = c.website_url);
  get diagnostics m = row_count; total := total + m;

  insert into company_sources (organization_id, company_id, source_type_id, name, url, priority, active, status)
  select p.organization_id, p.company_id,
         (select id from source_types st where st.organization_id = p.organization_id and st.name = 'Product Page' limit 1),
         'Product Page', p.product_url, 1, true, 'never_run'
  from products p
  where p.product_url is not null and p.product_url <> ''
    and not exists (select 1 from company_sources cs where cs.company_id = p.company_id and cs.url = p.product_url);
  get diagnostics m = row_count; total := total + m;

  return total;
end $$;
