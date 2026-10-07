import { createClient } from "@supabase/supabase-js";
const env = process.env;
for (const key of ["SUPABASE_URL", "SUPABASE_SERVICE_ROLE_KEY", "WORKSPACE_NAME", "WORKSPACE_SLUG", "ADMIN_EMAIL", "ADMIN_PASSWORD"]) {
 if (!env[key] || env[key].startsWith("replace-with")) throw new Error(`Set ${key} in your private bootstrap environment.`);
}
if (env.ADMIN_PASSWORD.length < 12) throw new Error("Use a password of at least 12 characters.");
const db = createClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false, autoRefreshToken: false } });
const { count, error: checkError } = await db.from("organizations").select("id", { count: "exact", head: true });
if (checkError) throw new Error("Apply the schema migrations before bootstrapping.");
const { data: accounts, error: accountError } = await db.auth.admin.listUsers({ page: 1, perPage: 1 });
if (accountError) throw new Error("Could not check Auth accounts. Check your own service-role key.");
if (count !== 0 || accounts.users.length > 0) throw new Error("Bootstrap requires an empty installation. Existing data and accounts were left unchanged.");
let org; let user;
try {
 const createdOrg = await db.from("organizations").insert({ name: env.WORKSPACE_NAME, slug: env.WORKSPACE_SLUG }).select("id").single();
 if (createdOrg.error) throw createdOrg.error; org = createdOrg.data.id;
 const createdUser = await db.auth.admin.createUser({ email: env.ADMIN_EMAIL, password: env.ADMIN_PASSWORD, email_confirm: true });
 if (createdUser.error) throw createdUser.error; user = createdUser.data.user.id;
 const member = await db.from("users").insert({ id: user, organization_id: org, email: env.ADMIN_EMAIL, full_name: env.ADMIN_NAME || "Workspace Owner", role: "administrator", active: true });
 if (member.error) throw member.error;
 console.log("Workspace created. Sign in with your own administrator email and password. Remove the bootstrap credentials from disk when finished.");
} catch (error) {
 if (user) await db.auth.admin.deleteUser(user);
 if (org) await db.from("organizations").delete().eq("id", org);
 throw error;
}
