// The AI is constrained (via the tool schema) to emit these DB change_type
// values directly, so no fuzzy mapping is needed. This maps a change_type to
// the observation_type used for the stored evidence.
export const CHANGE_TYPES = [
  "product_launch", "product_removal", "pricing_change", "feature_change",
  "topic_expansion", "event_launch", "audience_change", "customer_announcement",
  "partnership", "acquisition", "geographic_expansion", "rebrand",
  "positioning_change", "research_launch",
] as const;
export type ChangeType = (typeof CHANGE_TYPES)[number];

const OBSERVATION_BY_CHANGE: Record<ChangeType, string> = {
  product_launch: "product",
  product_removal: "product_status",
  pricing_change: "pricing",
  feature_change: "product",
  topic_expansion: "topic",
  event_launch: "event",
  audience_change: "audience",
  customer_announcement: "customer",
  partnership: "partnership",
  acquisition: "acquisition",
  geographic_expansion: "geography",
  rebrand: "positioning",
  positioning_change: "positioning",
  research_launch: "topic",
};

export function mapObservationType(changeType: string): string {
  return OBSERVATION_BY_CHANGE[changeType as ChangeType] ?? "positioning";
}
