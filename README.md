# Competitive Intelligence Platform

A continuously updated competitive-intelligence system: it tracks competitors at
the offering level, monitors public sources, routes AI-detected changes through
human review, preserves history, and scores competitors transparently.

This repository is the **Sprint 1 data foundation** — the PostgreSQL schema and
the seed-spreadsheet importer. The Next.js web app, crawler worker, and AI
pipeline are later sprints (see the architecture & build-plan doc).

## What's here

```
supabase/
  migrations/
    0001_init_schema.sql     26 tables, enums, indexes, full-text search
    0002_rls_policies.sql    row-level security: org isolation + role gates
    0003_triggers.sql        updated_at, tsvector, weight-total guard, per-org seed
scripts/
  import/
    importSpreadsheet.ts     workbook importer (dedup, mapping, dry-run + load)
    lib/normalize.ts         name/domain/price/customer parsing
    lib/mapping.ts           sheet + "competes with" -> internal portfolio
```

All three migrations have been applied end-to-end against PostgreSQL 16, and the
importer has been dry-run against the real seed workbook (202 rows -> 190 unique
companies, with cross-sheet duplicates merged and messy data flagged).

## Prerequisites

- A Supabase project (Postgres + Auth). Get its URL and keys from the dashboard.
- Node.js 20+.
- The Supabase CLI (`npm i -g supabase`) for applying migrations.

## 1. Apply the schema

```bash
supabase link --project-ref <your-project-ref>
supabase db push          # runs the three migrations in order
```

The migrations reference `auth.users` and `auth.uid()`, which Supabase provides.
Creating an `organizations` row automatically seeds that org's taxonomy
(company types, categories, topics, source types, regions) and its default
scoring weights (which must always total 100 — enforced by a deferred trigger).

## 2. Import the seed spreadsheet

### Option A — no local tooling (paste SQL)

If you can't run Node/npm, a pre-generated seed is provided at
`supabase/seed/seed_data.sql`. After the three migrations, open a new SQL Editor
query, paste the whole file, and Run. It creates the organization (firing the
taxonomy + weights seed) and loads ~190 companies, products, pricing,
relationships, customers, and evidence notes — all at confidence 60 /
pending_review. Regenerate it from a fresh workbook with:

```bash
cd scripts/import && npm install
npm run emit:sql -- --file /path/to/Competitive_Intel_for_CRA.xlsx \
  --out ../../supabase/seed/seed_data.sql --org-slug your-org --org-name "Your Org"
```

### Option B — run the importer (writes via the API)

```bash
cd scripts/import
npm install

# Preview without writing anything:
npm run import:dry -- --file /path/to/Competitive_Intel_for_CRA.xlsx

# Real load (service role bypasses RLS — server-side only, never in a browser):
export SUPABASE_URL="https://<ref>.supabase.co"
export SUPABASE_SERVICE_ROLE_KEY="<service-role-key>"
npm run import -- --file /path/to/Competitive_Intel_for_CRA.xlsx \
  --org-slug your-org --org-name "Your Organization"
```

Every imported record lands at **confidence 60** and
**intelligence_status = pending_review** ("Needs Verification"): the seed data
was compiled in 2024 and must be re-verified before it is treated as current.
The original sheet/row is preserved in `original_import_reference`
(e.g. `Events!Row37`).

The importer:
- merges the same company appearing on multiple sheets (by normalized name, then domain);
- splits the portfolio cell into product records;
- maps the free-text "competes with" column onto the internal portfolio, routing
  unrecognized tokens to review instead of guessing;
- keeps differentiators/weaknesses as evidence observations;
- best-effort parses pricing, keeping the raw text at low confidence;
- caps oversized customer lists (one cell holds ~244 unrelated names) rather than
  creating junk rows;
- skips the `Timeline` sheet and leaves the pivoted `Pricing Breakdown` sheet for
  a later dedicated path.

## 3. Push this to your GitHub

```bash
cd competitive-intel-platform
git init && git add . && git commit -m "Sprint 1: schema + spreadsheet importer"

# With the GitHub CLI (creates the repo under your account and pushes):
gh repo create mattsimoto/competitive-intel-platform --private --source=. --remote=origin --push

# Or manually, after creating an empty repo in the GitHub UI:
git remote add origin https://github.com/mattsimoto/competitive-intel-platform.git
git branch -M main && git push -u origin main
```

## 4. Run the web app

The web app (Next.js App Router, TypeScript, Tailwind v4, Supabase SSR auth)
lives at the repo root. It reads the data you loaded, enforcing RLS through the
logged-in user's session. Sprint 1 ships auth, the app shell, the Dashboard,
the Competitors list, and the Competitor profile.

### Create your first user

The app authenticates against Supabase Auth, and RLS resolves a user's org from
`public.users`. So create one auth user and one matching profile row:

1. Dashboard → Authentication → Users → Add user (email + password, mark
   confirmed).
2. In the SQL Editor, link that auth user to your org as an administrator
   (replace the email; the org was created by the seed):

```sql
insert into public.users (id, organization_id, email, full_name, role)
select u.id, o.id, u.email, 'You', 'administrator'
from auth.users u, organizations o
where u.email = 'you@example.com' and o.slug = 'your-org';
```

### Deploy on Vercel (no local tooling)

Because a Next.js app needs a build step, the simplest path — no npm on your
machine — is to let Vercel build from GitHub:

1. Push this repo to `github.com/mattsimoto` (see section 3).
2. In Vercel, New Project → import the repo. Framework preset: Next.js.
3. Add environment variables `NEXT_PUBLIC_SUPABASE_URL` and
   `NEXT_PUBLIC_SUPABASE_ANON_KEY` (the publishable/anon key — safe in the
   browser; RLS protects the data).
4. Deploy. Vercel builds in the cloud and gives you a URL. Sign in with the user
   from above.

### Or run locally (if you can install dependencies)

```bash
cp .env.local.example .env.local   # fill in URL + anon key
npm install
npm run dev                          # http://localhost:3000
```

This project's production build has been verified with `next build`.

## 5. Ingestion pipeline (daily crawl + AI)

The pipeline (`scripts/ingest/`) runs as a scheduled GitHub Action
(`.github/workflows/ingest.yml`) — no separate host. Each run: fetches due
active sources, cleans HTML to text, hashes, and compares. Unchanged pages stop
before any AI runs (the cost gate). Changed pages are stored, classified with
Claude (relevance), and if relevant, extracted into an observation plus a
**pending** `competitive_change` that appears in the Review Queue. Nothing is
auto-approved in this version — a human verifies every detection.

Setup:

1. **Seed sources** (SQL Editor): run `supabase/migrations/0006_seed_sources.sql`,
   then `select seed_company_sources();` (creates a Website source per company
   and a Product Page source per product).
2. **Add the files to GitHub:** upload `scripts/ingest/` (folder), and create
   `.github/workflows/ingest.yml` (use Add file → Create new file and type that
   path so the dot-folder is created correctly).
3. **Add repo secrets** (Settings → Secrets and variables → Actions → New
   repository secret): `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`. Add
   `ANTHROPIC_API_KEY` only when you want the AI half (full mode). The
   service-role and AI keys live only in Actions, never in the browser.
4. **Run it:** Actions tab → "Ingest competitive intelligence" → Run workflow.
   The **mode** dropdown defaults to **crawl-only** (fetch, detect changes, store
   snapshots — no AI, no key needed). Choose **full** only after adding
   `ANTHROPIC_API_KEY`, to also classify + extract into the Review Queue. The
   daily scheduled run is always crawl-only. The log prints
   `{mode, checked, changed, unchanged, detections, errors}`.

Tuning via the workflow env: `ANTHROPIC_MODEL` (default `claude-haiku-4-5-20251001`),
`INGEST_MAX_SOURCES` (default 25 per run — raise once you've confirmed it works).

Limits of v1: plain fetch only (JS-heavy pages won't yield text — a managed
crawl API or headless browser is the upgrade), and no auto-approval yet.

## Design notes

- **Multi-tenant by construction.** Every row carries `organization_id`; RLS keys
  on it so one organization can never read another's intelligence.
- **Evidence spine.** `source_documents -> observations -> competitive_changes`
  keeps every material fact traceable to a source.
- **History preserved.** `pricing_history` and `competitive_changes` are
  append-only; nothing is silently overwritten.
- **Deviation from the spec's Section 6:** taxonomy tables carry
  `organization_id` (the spec omitted it) so RLS is uniform and each org edits its
  own taxonomy. Noted in the architecture doc's open questions.

## Not yet built (later sprints)

Web app screens beyond the Sprint 1 slice (Products, Markets & Topics, Pricing,
Activity, Watchlists, Ask Intelligence, Review Queue, Admin), plus the crawler
worker, AI extraction, review workflow, and the scoring engine. Competitive
scores read "Not yet scored" until that engine runs. These depend on decisions
still open in the plan doc (worker host, AI provider, crawler approach).
