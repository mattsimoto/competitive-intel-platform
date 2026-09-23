/** Lines present in the new text but not the old — a cheap "what changed". */
export function addedLines(oldText: string | null, newText: string): string {
  if (!oldText) return newText;
  const seen = new Set(oldText.split(/\n+/).map((s) => s.trim()).filter(Boolean));
  const added = newText
    .split(/\n+/)
    .map((s) => s.trim())
    .filter((l) => l.length > 0 && !seen.has(l));
  return added.join("\n");
}
