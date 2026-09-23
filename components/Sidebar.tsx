"use client";
import Link from "next/link";
import { usePathname } from "next/navigation";

const NAV = [
  { href: "/dashboard", label: "Dashboard" },
  { href: "/competitors", label: "Competitors" },
  { href: "/products", label: "Products", soon: true },
  { href: "/topics", label: "Markets & Topics", soon: true },
  { href: "/pricing", label: "Pricing", soon: true },
  { href: "/activity", label: "Activity", soon: true },
  { href: "/watchlists", label: "Watchlists", soon: true },
  { href: "/ask", label: "Ask Intelligence", soon: true },
  { href: "/review", label: "Review Queue", review: true },
  { href: "/admin", label: "Admin", soon: true },
];

export function Sidebar({ role }: { role?: string }) {
  const path = usePathname();
  const canReview = role === "administrator" || role === "analyst";

  return (
    <nav className="flex flex-col gap-0.5 p-3">
      {NAV.map((item) => {
        // Review Queue is hidden for viewers (spec §4).
        if (item.review && !canReview) return null;
        const active = path === item.href || path.startsWith(item.href + "/");
        const disabled = !!item.soon;
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
            {item.soon && <span className="text-[10px] uppercase tracking-wide">soon</span>}
          </Link>
        );
      })}
    </nav>
  );
}
