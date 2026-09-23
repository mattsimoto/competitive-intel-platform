-- =============================================================================
-- Migration 0005: seed the Review Queue from imported, unverified claims
--
-- Until the crawler + AI pipeline produce competitive_changes, the review queue
-- has nothing to work on. But every imported positioning claim (strength /
-- weakness) came in as review_status = 'pending' with real supporting text from
-- the source spreadsheet. Those are legitimate things for a human to verify, so
-- we turn each into a pending competitive_change that links back to its
-- observation as evidence. Nothing here is fabricated: previous_value is null
-- (first import) and new_value is exactly the imported claim.
--
-- Idempotent: a second run adds nothing.
--
-- Usage:  select seed_review_items();
-- =============================================================================

create or replace function seed_review_items() returns integer
  language plpgsql as $$
declare
  n int;
begin
  insert into competitive_changes (
    organization_id, company_id, observation_id, change_type,
    previous_value_json, new_value_json, significance_score, confidence_score,
    detected_at, status, summary
  )
  select
    o.organization_id,
    o.company_id,
    o.id,
    'positioning_change',
    null,
    o.observed_value_json,
    40,                                   -- moderate significance
    coalesce(o.confidence_score, 60),
    now(),
    'pending',
    left(
      initcap(coalesce(o.observed_value_json->>'kind', 'claim')) || ': '
      || coalesce(o.observed_value_json->>'text', o.supporting_text, ''),
      240
    )
  from observations o
  where o.observation_type = 'positioning'
    and o.review_status = 'pending'
    and not exists (
      select 1 from competitive_changes cc where cc.observation_id = o.id
    );

  get diagnostics n = row_count;
  return n;
end $$;
