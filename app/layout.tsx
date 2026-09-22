import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Competitive Intelligence Platform",
  description: "Competitor monitoring, evidence, and scoring.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
