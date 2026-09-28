-- =============================================================================
-- Migration 0007: admin helper — set scoring weights atomically + recalc
--
-- Updating the eight weights one-by-one would trip the "weights must total 100"
-- deferred trigger between rows. This updates them all in a single transaction
-- (scoped to the caller's org via auth_org_id) and recomputes scores, so the
-- Admin weights editor can save in one call.
--
-- Usage (from the app): supabase.rpc('set_scoring_weights', { p_weights: {...} })
-- =============================================================================

create or replace function set_scoring_weights(p_weights jsonb) returns integer
  language plpgsql security definer set search_path = public as $$
declare
  v_org uuid := auth_org_id();
  k text;
  v numeric;
  rescored int;
begin
  if v_org is null then
    raise exception 'No organization for current user';
  end if;

  for k, v in select key, value::numeric from jsonb_each_text(p_weights) loop
    update scoring_weights set weight = v, updated_at = now()
    where organization_id = v_org and factor = k;
  end loop;

  -- Recompute scores with the new weights (deferred total-100 check fires at commit).
  rescored := recalculate_all_scores(v_org);
  return rescored;
end $$;
