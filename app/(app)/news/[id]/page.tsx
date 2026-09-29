import Link from "next/link";
import { notFound } from "next/navigation";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { getBrief } from "@/lib/queries";
import { Pill } from "@/components/badges";
import { since } from "@/lib/format";

export default async function BriefDetail({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const brief = await getBrief(id);
  if (!brief) notFound();

  return (
    <div className="mx-auto max-w-3xl space-y-4">
      <Link href="/news" className="text-sm text-blue-600 hover:underline">← Product News</Link>

      <div className="rounded-xl border border-zinc-200 bg-white p-6">
        <div className="mb-4 flex flex-wrap items-center gap-2">
          <h1 className="text-xl font-semibold">{brief.title}</h1>
          <Pill tone={brief.kind === "ai" ? "green" : "gray"}>{brief.kind === "ai" ? "Analyzed" : "Headlines"}</Pill>
          <span className="text-xs text-zinc-400">
            {brief.source_count != null ? `${brief.source_count} sources · ` : ""}{since(brief.generated_at)}
          </span>
        </div>

        <div className="space-y-3 text-sm leading-relaxed text-zinc-800">
          <ReactMarkdown
            remarkPlugins={[remarkGfm]}
            components={{
              a: ({ ...props }) => <a {...props} target="_blank" rel="noreferrer" className="text-blue-600 hover:underline" />,
              h1: ({ ...props }) => <h2 {...props} className="mt-5 text-lg font-semibold" />,
              h2: ({ ...props }) => <h2 {...props} className="mt-5 text-base font-semibold" />,
              h3: ({ ...props }) => <h3 {...props} className="mt-4 font-semibold" />,
              p: ({ ...props }) => <p {...props} className="my-2" />,
              ul: ({ ...props }) => <ul {...props} className="my-2 list-disc space-y-1 pl-5" />,
              ol: ({ ...props }) => <ol {...props} className="my-2 list-decimal space-y-1 pl-5" />,
              li: ({ ...props }) => <li {...props} className="marker:text-zinc-400" />,
              strong: ({ ...props }) => <strong {...props} className="font-semibold text-zinc-900" />,
              em: ({ ...props }) => <em {...props} className="text-zinc-500" />,
              hr: () => <hr className="my-4 border-zinc-200" />,
            }}
          >
            {brief.body_markdown}
          </ReactMarkdown>
        </div>
      </div>
    </div>
  );
}
