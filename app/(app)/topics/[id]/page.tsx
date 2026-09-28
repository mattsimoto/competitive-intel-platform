import Link from "next/link";
import { notFound } from "next/navigation";
import { getTopicDetail } from "@/lib/queries";
import { ScoreBadge, ConfidenceBadge } from "@/components/badges";

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section className="rounded-xl border border-zinc-200 bg-white">
      <div className="border-b border-zinc-200 px-4 py-3 text-sm font-semibold">{title}</div>
      <div className="p-4">{children}</div>
    </section>
  );
}

export default async function TopicDetail({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const data = await getTopicDetail(id);
  if (!data) notFound();
  const { topic, companies, products } = data;

  return (
    <div className="space-y-5">
      <div>
        <Link href="/topics" className="text-sm text-blue-600 hover:underline">← Markets &amp; Topics</Link>
      </div>

      <div className="rounded-xl border border-zinc-200 bg-white p-5">
        <h1 className="text-xl font-semibold">{topic.name}</h1>
        {topic.description && <p className="mt-1 text-sm text-zinc-600">{topic.description}</p>}
      </div>

      <Section title={`Active Competitors (${companies.length})`}>
        {companies.length === 0 ? (
          <p className="text-sm text-zinc-400">No competitors linked to this topic yet.</p>
        ) : (
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-zinc-200 text-left text-xs uppercase tracking-wide text-zinc-500">
                <th className="py-2 font-medium">Company</th>
                <th className="py-2 font-medium">Score</th>
                <th className="py-2 font-medium">Confidence</th>
              </tr>
            </thead>
            <tbody>
              {companies.map((c: any) => (
                <tr key={c.id} className="border-b border-zinc-100">
                  <td className="py-2"><Link href={`/competitors/${c.id}`} className="font-medium text-zinc-900 hover:underline">{c.name}</Link></td>
                  <td className="py-2"><ScoreBadge score={c.competitive_score} /></td>
                  <td className="py-2"><ConfidenceBadge score={c.confidence_score} /></td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </Section>

      <Section title={`Related Products (${products.length})`}>
        {products.length === 0 ? (
          <p className="text-sm text-zinc-400">No products linked to this topic yet.</p>
        ) : (
          <ul className="space-y-1 text-sm">
            {products.map((p: any) => (
              <li key={p.id} className="text-zinc-700">
                <span className="font-medium">{p.name}</span>
                {p.companies?.name ? <span className="text-zinc-400"> — {p.companies.name}</span> : null}
              </li>
            ))}
          </ul>
        )}
      </Section>
    </div>
  );
}
