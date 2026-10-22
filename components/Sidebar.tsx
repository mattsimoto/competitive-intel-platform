"use client";
import Link from "next/link";
import { usePathname } from "next/navigation";

const NAV = [
  { href: "/dashboard", label: "Dashboard" },
  { href: "/competitors", label: "Competitors" },
  { href: "/products", label: "Products" },
  { href: "/topics", label: "Markets & Topics" },
  { href: "/pricing", label: "Pricing" },
  { href: "/activity", label: "Activity" },
  { href: "/news", label: "Product News" },
  { href: "/watchlists", label: "Watchlists" },
  { href: "/ask", label: "Ask Intelligence" },
  { href: "/add", label: "Add / Import", review: true },
  { href: "/review", label: "Review Queue", review: true },
  { href: "/admin", label: "Admin", admin: true },
];

export function Sidebar({ role }: { role?: string }) {
  const path = usePathname();
  const canReview = role === "administrator" || role === "analyst";
  const canAdmin = role === "administrator";

  return (
    <nav className="flex flex-col gap-0.5 p-3">
      {NAV.map((item) => {
        // Review Queue is hidden for viewers (spec §4).
        if (item.review && !canReview) return null;
        if ((item as any).admin && !canAdmin) return null;
        const active = path === item.href || path.startsWith(item.href + "/");
        const disabled = !!(item as any).soon;
        return (
          <Link
            key={item.href}
            href={disabled ? "#" : item.href}
            aria-disabled={disabled}
            className={`flex items-center justify-between rounded-md px-3 py-2 text-sm ${
              active ? "bg-zinc-900 text-white" : "text-zinc-700 hover:bg-zinc-200"
            } ${disabled ? "pointer-events-none opacity-40" : ""}`}
          >
            {item.label}
            {(item as any).soon && <span className="text-[10px] uppercase tracking-wide">soon</span>}
          </Link>
        );
      })}
    </nav>
  );
}
