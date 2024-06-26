import { SessionProvider } from "next-auth/react";

import { PHProvider, PostHogPageview } from "@/providers/posthog";

import { Bubble } from "@/components/support/bubble";

export default function AuthLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode;
}) {
  return (
    <PHProvider>
      <PostHogPageview />
      <SessionProvider>
        {children}
        <Bubble />
      </SessionProvider>
    </PHProvider>
  );
}
