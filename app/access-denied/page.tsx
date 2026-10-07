import { SignOutButton } from "@/components/SignOutButton";
export default function AccessDenied() { return <main className="mx-auto max-w-lg space-y-4 p-8"><h1 className="text-xl font-semibold">Workspace access required</h1><p>Your account has no active workspace membership. Ask your administrator for an invitation or to reactivate your access.</p><SignOutButton /></main>; }
