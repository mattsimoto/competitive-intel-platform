import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";

type CookieToSet = { name: string; value: string; options?: Record<string, unknown> };

/** How long we'll wait on the auth server before giving up. Supabase's auth
 *  endpoint normally answers in well under a second; if it's slow or unreachable
 *  we must not let the whole app hang (that caused a 504 MIDDLEWARE_INVOCATION_TIMEOUT). */
const AUTH_TIMEOUT_MS = 3000;

function withTimeout<T>(p: Promise<T>, ms: number): Promise<T> {
  return Promise.race([
    p,
    new Promise<T>((_, reject) => setTimeout(() => reject(new Error("auth-timeout")), ms)),
  ]);
}

/** Refreshes the auth session cookie and gates the app behind login.
 *  Fails SAFE: if the auth server times out or errors, we let the request through
 *  rather than 504-ing the page — the app layout re-checks auth authoritatively
 *  (`if (!user) redirect("/login")`), so this stays secure. */
export async function updateSession(request: NextRequest) {
  let response = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll: () => request.cookies.getAll(),
        setAll: (list: CookieToSet[]) => {
          list.forEach(({ name, value }) => request.cookies.set(name, value));
          response = NextResponse.next({ request });
          list.forEach(({ name, value, options }) => response.cookies.set(name, value, options as any));
        },
      },
    }
  );

  const path = request.nextUrl.pathname;
  const isPublic = path === "/login";

  let user: unknown = null;
  let authReachable = true;
  try {
    const { data } = await withTimeout(supabase.auth.getUser(), AUTH_TIMEOUT_MS);
    user = data.user;
  } catch {
    // Timed out or errored: don't hang, don't redirect-loop. Let it through and
    // let the server component decide. A transient Supabase blip stays invisible.
    authReachable = false;
  }

  if (authReachable) {
    if (!user && !isPublic) {
      const url = request.nextUrl.clone();
      url.pathname = "/login";
      return NextResponse.redirect(url);
    }
    if (user && isPublic) {
      const url = request.nextUrl.clone();
      url.pathname = "/dashboard";
      return NextResponse.redirect(url);
    }
  }

  return response;
}
