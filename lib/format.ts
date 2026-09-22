export function money(min: number | null, max: number | null, currency = "USD"): string {
  if (min == null && max == null) return "—";
  const f = (n: number) =>
    new Intl.NumberFormat("en-US", { style: "currency", currency, maximumFractionDigits: 0 }).format(n);
  if (min != null && max != null && min !== max) return `${f(min)}–${f(max)}`;
  return f((min ?? max)!);
}

export function since(dateIso: string | null): string {
  if (!dateIso) return "—";
  return new Date(dateIso).toLocaleDateString("en-US", { year: "numeric", month: "short", day: "numeric" });
}

/** Confidence band per the spec's §9 interpretation. */
export function confidenceBand(score: number | null): { label: string; tone: string } {
  if (score == null) return { label: "Unknown", tone: "gray" };
  if (score >= 90) return { label: "Very high", tone: "green" };
  if (score >= 75) return { label: "High", tone: "green" };
  if (score >= 60) return { label: "Moderate", tone: "amber" };
  if (score >= 40) return { label: "Low", tone: "orange" };
  return { label: "Unverified", tone: "red" };
}
