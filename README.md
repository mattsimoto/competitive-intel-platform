# Competitive Intelligence Platform

A white-label competitive intelligence application for product marketing, competitive research, sales enablement, and go-to-market planning. It connects companies, individual offerings, prices, events, and market findings to their sources, review status, and competitive relationships.

The project includes a deployed private team workspace and a separate, data-free self-hosted edition. The reusable application can be configured under another organization's name, with that organization's own database, users, research, portfolio, and credentials.

## Two independent installation models

| | Private CRA workspace | Independent white-label edition |
| --- | --- | --- |
| Data | CRA research and internal portfolio | Starts without CRA records; operator imports their own data |
| Users | Individually invited CRA teammates sharing the CRA workspace | Accounts and invitations controlled by that installation's operator |
| Access | Active membership, role permissions, and database row-level security | The same membership controls, connected to a separate database |
| Branding | CRA workspace identity | Configurable application and workspace names |
| Infrastructure | Existing private deployment and database | Operator's own machine, network, or hosting environment |
| Administration | CRA administrators manage CRA membership | Operator manages their own installation; the author has no automatic access |

**White label means reusing the software and adapting its identity and configuration.** It does not grant another organization access to CRA's workspace. Each independent installation uses its own database and credentials; there is no shared author-controlled account or cross-installation data synchronization.

This repository is private and contains installation-specific calendar and organizer files. Distribute only the clean package generated below. The clean distribution includes reusable application code and setup documentation; private research and credentials are excluded.

## Built capabilities

- Dashboard, competitor profiles, product views, pricing, markets and topics, activity, and watchlists.
- Product-level relationships with an internal portfolio and configurable competitive scoring.
- CSV import with templates and preview for companies, products, and industry events.
- Interactive event calendar with list/month views, filters, CSV export, organizer evidence, product links, portfolio comparisons, and date-overlap signals.
- Source monitoring, retrieved-page snapshots, content hashing, and change detection.
- On-demand AI enrichment with source-linked findings and review status.
- Review Queue with approval, rejection, deferral, duplicate handling, and audit records.
- Ask Intelligence and Product News views, with optional provider-backed analysis.
- Administrator, Analyst, and Viewer roles, invitation links, membership activation controls, and access history.
- PostgreSQL migrations, application deployment configuration, bootstrap tooling, and self-hosting documentation.

## Private workspace access

Open **Admin → Users** as an active administrator to invite a CRA teammate. Choose their exact email address and role, create the link, and share it with that person. The administrator panel creates a shareable link; it does not send an invitation email on your behalf.

Invitations expire after seven days, can be revoked, and can be accepted once. Only the intended email address can accept. The teammate creates or signs into an individual account, verifies their email through Supabase Auth, reopens the original invitation link, and accepts it.

Creating an Auth account alone grants no intelligence data. Workspace membership comes from the checked invitation process. Membership roles are controlled in the database, not through client-supplied account metadata.

| Role | Access |
| --- | --- |
| Viewer | Read workspace intelligence and manage permitted personal watchlists |
| Analyst | Viewer access plus data imports, edits, enrichment, and intelligence/event review |
| Administrator | Analyst access plus membership, taxonomy, scoring, and configuration controls |

Administrators can change a teammate's role, deactivate access, or reactivate an existing member. Deactivation removes further workspace database access, including access through existing sessions. It cannot erase information a person already downloaded. An administrator cannot demote or deactivate their own account through this screen, and the workspace must retain an active administrator.

Before onboarding teammates, verify real email delivery and configure the Auth site URL and allowed callback URL for the application origin (`/auth/callback`). The implementation and database checks have passed; a real mailbox/callback onboarding test remains outstanding.

## Importing and maintaining intelligence

Use **Import Data** to download the CSV template for companies, products, or events. Replace the example rows with your own records and preview the file before committing the import.

- Import companies before their products; products refer to their company's name.
- Each import accepts 1–500 records in a file smaller than 1 MB.
- Duplicate companies/products reject the import. Any invalid row rolls back the complete batch.
- Imported companies/products begin as pending-review intelligence.
- Imported events begin with unresolved organizers. An import cannot assert verified ownership or approve a competitive relationship.
- Add your own internal portfolio offerings and taxonomy in Admin.

### Events and organizer ownership

An event brand is not automatically its organizing company. Event records preserve imported dates, attendance/pricing text, provenance, and verification status separately from ownership evidence and competitive judgments.

An Analyst or Administrator can document an unresolved organizer using an existing or new company, an official evidence URL, and an explanation. The action creates the linked event product, source, and review record atomically. Verified external events connect to their organizer's company and product records.

Internal events belong to the organization's own portfolio and are excluded from competitor products and relationships. Proposed event-to-portfolio comparisons affect competitive relationships and scoring only after approval. Rejection removes the associated relationship from active scoring. Same-country date overlaps are planning signals, not proof that events compete.

The private calendar import remains in `scripts/events/calendar-2027.json` and `scripts/events/organizers-2027.json`. Its installation-specific import tool is `scripts/events/generate_import.py`. These files are excluded from the independent edition.

## AI, monitoring, and review

**On-demand enrichment:** open a competitor profile and select **Enrich now (AI)**. An Analyst or Administrator can retrieve up to three active sources and request findings through Groq. The app checks supporting quotes against retrieved text and routes findings to review; it does not automatically approve them or treat a current fact as proof of a new launch.

**Crawler:** `scripts/ingest/` retrieves active monitored sources, cleans and hashes pages, stores changed snapshots, and optionally classifies/extracts findings. Unchanged pages do not invoke AI. The private GitHub workflow runs daily at 08:00 UTC in crawl-only mode by default and supports manual full runs. The clean edition's workflow is manual-only.

**Auto-approval:** crawler findings are pending by default. Administrators can explicitly enable rules for eligible change types and confidence thresholds. Pricing can remain subject to review. These settings do not auto-approve on-demand enrichment or event-portfolio comparisons.

**Product News:** public feed retrieval can be disabled with `ENABLE_NEWS_FETCH=false`. Optional news synthesis uses Anthropic. AI requests transmit the selected source text or workspace context to the configured provider; operators decide whether to enable these features.

| Variable | Purpose | Where it belongs |
| --- | --- | --- |
| `NEXT_PUBLIC_APP_NAME` | Application name | App build environment |
| `NEXT_PUBLIC_SUPABASE_URL` | This installation's Supabase API URL | App build/server environment |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Publishable/anon key; data access remains subject to Auth and RLS | App build/server environment |
| `GROQ_API_KEY` | Enrichment, Ask Intelligence, and optional crawler AI | Server environment; crawler secret if enabled there |
| `GROQ_MODEL` | Optional Groq model override | Server/worker environment |
| `ANTHROPIC_API_KEY` | Optional news synthesis | Server environment |
| `ENABLE_NEWS_FETCH` | Set to `false` to disable public news retrieval | Server environment |
| `SUPABASE_URL` / `SUPABASE_SERVICE_ROLE_KEY` | First-install bootstrap and crawler access to the operator's database | Private bootstrap environment or worker secrets only |

Never put a service-role key or AI provider key into a `NEXT_PUBLIC_` variable or a downloadable package. The web app uses the signed-in user's session and RLS for workspace operations; it does not need a service-role key. Worker credentials bypass RLS and belong only to the operator's trusted server environment.

## Build the independent edition

From the private checkout:

```sh
python scripts/self-hosted/package.py --out competitive-intelligence-white-label.zip
```

The exporter uses an explicit file allowlist and checks for known private-installation references and possible credentials. The clean package contains application code, migrations, generic CSV examples, bootstrap tooling, Docker configuration, and setup instructions. It excludes CRA calendar/organizer manifests, private data assertions, environment secrets, build output, and Git history. Its README is generated from `SELF-HOSTED.md`.

The software is free under the [MIT license](LICENSE). Each operator supplies their own hosting, database, email delivery, and optional AI keys. The application requires a server and database; it is not a standalone HTML file. Docker Compose starts the app only, not a complete Supabase stack.

Follow [SELF-HOSTED.md](SELF-HOSTED.md) for an independent installation on one machine, a private network, or hosted infrastructure. The bootstrap tool refuses a populated installation and creates the first administrator in the operator's empty database. Subsequent teammates use invitations.

## Run the web application

For a configured installation:

```sh
npm ci
cp .env.example .env.local
# Fill in this installation's database URL and publishable/anon key.
npm run dev
```

For production:

```sh
npm run build
npm start
```

Apply the migration files in filename order when preparing a new Supabase database. Existing installations must use their own migration history; do not reset a populated database or load another organization's seed data. Independent setup, Auth configuration, initial administrator creation, and container networking are covered in `SELF-HOSTED.md`.

## Validation and limits

```sh
npm run build
npm run test:events
npm run test:csv
npm run test:schema
```

- Production build and event/CSV checks pass.
- The schema/import test uses a fresh embedded PostgreSQL database with a simulated Auth schema. It checks imports, batch rollback, roles, cross-workspace isolation, and deactivation; it does not test the real Auth service.
- `tests/membership/database.sql` contains rollback-only membership assertions for a prepared Supabase installation with an administrator.
- `tests/events/database.sql` contains private-calendar assertions and is excluded from the clean edition.
- Real invitation email delivery/callbacks and the Docker runtime still require an environment-specific check.
- Plain HTTP crawling may not retrieve useful content from JavaScript-heavy or blocked websites.
- Calendar estimates, dates, and imported findings remain subject to their recorded verification status.

## Project story and repository metadata

The [anonymized case study](docs/case-study.md) explains the product strategy, privacy model, event research workflow, and independent distribution. Its metric describes delivered calendar coverage, not an unmeasured revenue, adoption, or time-saving result.

The intended GitHub About description and suggested topics are recorded in [.github/ABOUT.md](.github/ABOUT.md).
