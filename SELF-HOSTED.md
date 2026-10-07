# Competitive Intelligence Platform — Independent White Label Edition

This is free, reusable application source. Every installation has its own database, users, credentials, records and branding. There is no central account, owner backdoor, telemetry integration, or data synchronization to the author. This is a Next.js server application with a Supabase database and Auth; it is not a standalone HTML file. Optional AI sends selected records/source content to the operator's chosen provider when an operator invokes those features. Public news retrieval and crawls contact their source websites. Next.js framework telemetry can be disabled with `NEXT_TELEMETRY_DISABLED=1`.

## What the application includes

Company and product research, pricing views, configurable competitive scoring, source evidence, a Review Queue, watchlists, and an interactive event calendar. Teams use individual invited accounts to share their own workspace. CSV templates and import previews support their own company, product, and event records. Event ownership and proposed portfolio comparisons remain distinct from approved competitive relationships.

Optional AI enrichment proposes source-linked findings for review. Crawling can run without AI. The source package includes no originating organization's records, user accounts, environment secrets, or Git history. Application naming uses `NEXT_PUBLIC_APP_NAME`; workspace naming is set during bootstrap. The software is free under the included MIT license. The operator controls hosting, database administration, backups, mail delivery, and optional provider accounts.

## Start on one machine

Install Node.js 22 and Docker. Unzip the source, open a terminal in it, and run:

```sh
npm ci
npx supabase init
npx supabase start
npx supabase db reset
```

`supabase init` creates local configuration. Before starting Supabase, edit `supabase/config.toml`: under `[auth]`, set `site_url = "http://localhost:3000"` and `additional_redirect_urls = ["http://localhost:3000/auth/callback"]`. Under `[auth.email]`, enable confirmations with `enable_confirmations = true`. Use this application's included `supabase/migrations` directory; do not substitute another organization's seed files. `db reset` is for the new local development installation and deletes its local data. It must not be used against an existing database.

Copy `.env.example` to `.env.local`. Copy the local API URL and anon/publishable key printed by `supabase start` into it. Set your application name. Copy `.env.bootstrap.example` to `.env.bootstrap` and fill in your own local API URL, local service-role key, workspace name, email and a strong initial administrator password. Bootstrap only an empty installation:

```sh
node --env-file=.env.bootstrap scripts/self-hosted/bootstrap.mjs
npm run dev
```

Open `http://localhost:3000` and sign in. Delete `.env.bootstrap` when finished; it is only for first setup. Its service-role key never belongs in browser variables. The initial administrator is created locally by the operator; subsequent teammates must use invitations.

For production builds:

```sh
npm run build
npm start
```

Alternatively build the app container with `docker compose --env-file .env.local up --build -d`. The compose file starts the app only; provision your Supabase services separately. The public Supabase URL must be reachable by browsers and the app container. `127.0.0.1` inside a container points at the container itself; use an appropriate network hostname such as `host.docker.internal` with host-gateway support or your network server address. Public environment values are compiled into the browser bundle, so rebuild after changing them.

## Operate on your own network

Provision a separate Supabase installation following its official self-hosting guide: https://supabase.com/docs/guides/self-hosting/docker . For a hosted database, create your own fresh Supabase project. Apply every migration file in filename order via Supabase CLI or the SQL editor before bootstrapping. Keep Auth signup enabled for invited users, enable email confirmation, configure SMTP for real mail delivery, and add `https://YOUR-APP-HOST/auth/callback` to allowed Auth redirect URLs. Set the Auth site URL to your app origin. Local Supabase captures mail in its local inbox; use the inbox URL printed by `supabase start`. Invite acceptance additionally requires an email-link Auth verification, even if signup confirmation has been disabled.

For users on other machines, use HTTPS and network hostnames reachable by both their browsers and the app server. Restrict server access to your intended network if that is your policy. Keep database administrative keys server-side. Back up your own database and maintain your own infrastructure. Hosting and optional AI usage are the operator's responsibility; running the application requires no payment to its author.

## Add data and teammates

In Admin, add your own internal portfolio offerings. In **Import Data**, download a template, replace example rows with your records, preview the CSV, and import companies before products. Up to 500 records per import, with a 1 MB file limit. Events enter as unresolved; open each event to document its organizer with evidence. Competitive comparisons remain proposed until an analyst approves them. Imports reject duplicate companies/products and roll back as a unit if any row fails.

Admin → Users creates an invitation for an exact email and chosen role. Share the generated link yourself; no email is automatically sent by the administrator panel. Links expire after seven days, are revocable and usable once. The teammate creates or signs into their own account, verifies their email using the Auth email link, reopens the original invitation link and accepts it. Creating an Auth account alone grants no workspace data. Administrators can change roles or deactivate members. Deactivation blocks further database access by existing sessions; it cannot erase information already downloaded by a user.

Viewers read workspace intelligence; analysts edit, import and review; administrators also control membership and configuration. Each installation's operator controls its own database. The software author has no credentials or automatic access to other installations.

## Optional enrichment and crawling

AI features remain unavailable unless you supply your own `GROQ_API_KEY` (enrichment/Ask Intelligence) or `ANTHROPIC_API_KEY` (news synthesis). Disable news fetching with `ENABLE_NEWS_FETCH=false`. To monitor imported company/product URLs, run `select seed_company_sources();` in your own database using an administrator account. The crawler can run without AI with `INGEST_NO_AI=1`.

```sh
cd scripts/ingest
npm install
# Supply SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY for YOUR installation only.
INGEST_NO_AI=1 npm run ingest
```

The clean edition includes a manual-only GitHub ingestion workflow. Set repository secrets for your own database only if you decide to use it. No scheduled crawl starts automatically. A service-role worker can read the entire operator's database; never reuse another installation's worker key.

## Validation

The source passes the production build and event/CSV tests. Membership isolation and imports are tested against the database with temporary records rolled back. The schema is checked from an empty embedded PostgreSQL database with a simulated Auth schema (`npm run test:schema`). This does not test real SMTP or the Supabase Auth service. The Docker runtime and real SMTP delivery require validation in your own environment.
