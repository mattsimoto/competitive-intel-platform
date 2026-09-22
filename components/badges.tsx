import { confidenceBand } from "@/lib/format";

const TONES: Record<string, string> = {
  green: "bg-green-100 text-green-800 border-green-200",
  amber: "bg-amber-100 text-amber-800 border-amber-200",
  orange: "bg-orange-100 text-orange-800 border-orange-200",
  red: "bg-red-100 text-red-800 border-red-200",
  gray: "bg-zinc-100 text-zinc-700 border-zinc-200",
  blue: "bg-blue-100 text-blue-800 border-blue-200",
};

export function Pill({ tone = "gray", children }: { tone?: string; children: React.ReactNode }) {
  return (
    <span className={`inline-flex items-center rounded-full border px-2 py-0.5 text-xs font-medium ${TONES[tone] ?? TONES.gray}`}>
      {children}
    </span>
  );
}

const STATUS_TONE: Record<string, string> = {
  verified: "green",
  pending_review: "amber",
  low_confidence: "orange",
  conflicting: "red",
  historical: "gray",
  rejected: "red",
};

export function StatusChip({ status }: { status: string }) {
  const label = status.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
  return <Pill tone={STATUS_TONE[status] ?? "gray"}>{label}</Pill>;
}

export function ConfidenceBadge({ score }: { score: number | null }) {
  const band = confidenceBand(score);
  return <Pill tone={band.tone}>{score == null ? "—" : Math.round(score)} · {band.label}</Pill>;
}

export function ScoreBadge({ score }: { score: number | null }) {
  if (score == null) return <span className="text-zinc-400 text-sm">Not yet scored</span>;
  const tone = score >= 70 ? "red" : score >= 40 ? "amber" : "gray";
  return <Pill tone={tone}>{Math.round(score)}</Pill>;
}
