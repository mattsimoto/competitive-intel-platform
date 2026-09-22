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
  { href: "/review", label: "Review Queue", soon: true },
  { href: "/admin", label: "Admin", soon: true },
];

export function Sidebar() {
  const path = usePathname();
  return (
    <nav className="flex flex-col gap-0.5 p-3">
      {NAV.map((item) => {
        const active = path === item.href || path.startsWith(item.href + "/");
        return (
          <Link
            key={item.href}
            href={item.soon ? "#" : item.href}
            aria-disabled={item.soon}
            className={`flex items-center justify-between rounded-md px-3 py-2 text-sm ${
              active ? "bg-zinc-900 text-white" : "text-zinc-700 hover:bg-zinc-200"
            } ${item.soon ? "pointer-events-none opacity-40" : ""}`}
          >
            {item.label}
            {item.soon && <span className="text-[10px] uppercase tracking-wide">soon</span>}
          </Link>
        );
      })}
    </nav>
  );
}
