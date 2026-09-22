import { Pill } from "@/components/badges";

const FACTOR_LABELS: Record<string, string> = {
  product_overlap: "Product Overlap",
  audience_overlap: "Audience Overlap",
  topic_overlap: "Topic Overlap",
  customer_overlap: "Customer Overlap",
  pricing_competitiveness: "Pricing Competitiveness",
  market_activity: "Market Activity",
  geographic_overlap: "Geographic Overlap",
  recent_expansion: "Recent Expansion",
};

interface Factor {
  factor: string;
  weight: number | null;
  value: number | null;
  included: boolean;
  reason?: string;
}

interface ScoreRow {
  total_score: number | null;
  explanation_json: {
    factors?: Factor[];
    factors_used?: number;
    factors_total?: number;
    method?: string;
  } | null;
  calculated_at?: string;
}

export function ScoreBreakdown({ score }: { score: ScoreRow | null }) {
  if (!score || !score.explanation_json?.factors) {
    return (
      <p className="text-sm text-zinc-400">
        No score computed yet. Run <code>select recalculate_all_scores();</code> to populate.
      </p>
    );
  }
  const { factors = [], factors_used = 0, factors_total = 8 } = score.explanation_json;

  return (
    <div>
      <div className="mb-3 flex items-center gap-3">
        <span className="text-2xl font-semibold tabular-nums">
          {score.total_score == null ? "—" : Math.round(score.total_score)}
        </span>
        <Pill tone={factors_used < factors_total ? "amber" : "green"}>
          based on {factors_used} of {factors_total} factors
        </Pill>
      </div>

      <table className="w-full text-sm">
        <thead>
          <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
            <th className="py-2 font-medium">Factor</th>
            <th className="py-2 font-medium">Weight</th>
            <th className="py-2 font-medium">Value</th>
            <th className="py-2 font-medium">In score</th>
          </tr>
        </thead>
        <tbody>
          {factors.map((f) => (
            <tr key={f.factor} className={`border-b border-zinc-100 ${f.included ? "" : "text-zinc-400"}`}>
              <td className="py-2">{FACTOR_LABELS[f.factor] ?? f.factor}</td>
              <td className="py-2 tabular-nums">{f.weight == null ? "—" : Number(f.weight)}</td>
              <td className="py-2 tabular-nums">{f.value == null ? "—" : Math.round(f.value)}</td>
              <td className="py-2">
                {f.included ? (
                  <Pill tone="green">Counted</Pill>
                ) : (
                  <span title={f.reason ?? ""}>
                    <Pill tone="gray">Excluded</Pill>
                  </span>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      <p className="mt-3 text-xs text-zinc-400">
        Weighted mean over the factors with data; missing factors are excluded, not scored as zero.
        As audience, topic, pricing and activity data arrive, those factors begin to count.
      </p>
    </div>
  );
}
