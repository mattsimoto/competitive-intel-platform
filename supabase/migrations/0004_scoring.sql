-- =============================================================================
-- Migration 0004: competitive scoring engine (v1)
--
-- Runs entirely in Postgres so it can be invoked from the SQL Editor with no
-- tooling. Design follows spec §7-8 with one honest adjustment agreed for the
-- seed dataset: only factors that have real data contribute. Missing factors
-- are recorded in explanation_json as excluded (not scored as zero), and the
-- total is a weight-renormalized mean over the factors that were present.
--
-- Currently only Product Overlap is computable from the imported data. As
-- audience, topic, customer, pricing, activity, geography and expansion data
-- arrive, add their compute_* functions and wire them into
-- recalculate_company_score the same way as product overlap.
--
-- Usage:
--   select recalculate_all_scores();          -- score every company
--   select recalculate_all_scores('<org-id>'); -- one org
-- Re-run after changing scoring_weights.
-- =============================================================================

-- Product Overlap (spec §8.1). Based on how many internal products the
-- competitor overlaps and whether any relationship is direct/partial.
-- Returns NULL when there is no relationship data (factor then excluded).
create or replace function compute_product_overlap(p_company uuid) returns numeric
  language sql stable as $$
  with rel as (
    select count(distinct internal_product_id) as n,
           bool_or(relationship_type in ('direct', 'partial')) as has_direct
    from competitive_relationships
    where competitor_company_id = p_company and active
  )
  select case
    when n = 0 then null
    else least(100, (25 + 15 * (n - 1)) + case when has_direct then 25 else 0 end)::numeric
  end
  from rel;
$$;

-- Records a not-yet-computable factor in the explanation, with its weight so
-- the UI can show what a full score would weigh.
create or replace function factor_stub(p_org uuid, p_factor text) returns jsonb
  language sql stable as $$
  select jsonb_build_array(jsonb_build_object(
    'factor', p_factor,
    'weight', (select weight from scoring_weights where organization_id = p_org and factor = p_factor and active),
    'value', null,
    'included', false,
    'reason', 'no data in current dataset'));
$$;

-- Score one company: write a competitive_scores history row and update the
-- company's current competitive_score. Returns the total (or NULL if nothing
-- was computable).
create or replace function recalculate_company_score(p_company uuid) returns numeric
  language plpgsql as $$
declare
  v_org uuid;
  w numeric;
  v_product numeric;
  num numeric := 0;
  den numeric := 0;
  used int := 0;
  factors jsonb := '[]'::jsonb;
  total numeric;
begin
  select organization_id into v_org from companies where id = p_company;
  if v_org is null then return null; end if;

  -- Product Overlap (the one factor with data today).
  select weight into w from scoring_weights where organization_id = v_org and factor = 'product_overlap' and active;
  v_product := compute_product_overlap(p_company);
  if v_product is not null and w is not null then
    num := num + v_product * w;
    den := den + w;
    used := used + 1;
  end if;
  factors := factors || jsonb_build_object(
    'factor', 'product_overlap', 'weight', w, 'value', v_product, 'included', v_product is not null);

  -- Factors with no data yet: recorded but excluded from the total.
  factors := factors
    || factor_stub(v_org, 'audience_overlap')
    || factor_stub(v_org, 'topic_overlap')
    || factor_stub(v_org, 'customer_overlap')
    || factor_stub(v_org, 'pricing_competitiveness')
    || factor_stub(v_org, 'market_activity')
    || factor_stub(v_org, 'geographic_overlap')
    || factor_stub(v_org, 'recent_expansion');

  total := case when den > 0 then round(num / den, 3) else null end;

  insert into competitive_scores (organization_id, company_id, total_score, product_overlap_score, explanation_json)
  values (v_org, p_company, total, v_product,
    jsonb_build_object(
      'factors', factors,
      'factors_used', used,
      'factors_total', 8,
      'method', 'weighted mean over factors with data; missing factors excluded, not zeroed'));

  update companies set competitive_score = total where id = p_company;
  return total;
end $$;

-- Score every company (optionally scoped to one org).
create or replace function recalculate_all_scores(p_org uuid default null) returns integer
  language plpgsql as $$
declare
  c record;
  n int := 0;
begin
  for c in select id from companies where p_org is null or organization_id = p_org loop
    perform recalculate_company_score(c.id);
    n := n + 1;
  end loop;
  return n;
end $$;
