import { notFound } from "next/navigation";

import { Header } from "@/components/dashboard/header";
import { StatusReportList } from "@/components/status-page/status-report-list";
import { api } from "@/trpc/server";

type Props = {
  params: { domain: string };
  searchParams: { [key: string]: string | string[] | undefined };
};

export default async function Page({ params }: Props) {
  if (!params.domain) return notFound();

  const page = await api.page.getPageBySlug.query({ slug: params.domain });
  if (!page) return notFound();

  return (
    <div className="grid gap-8">
      <Header
        title={page.title}
        description={page.description}
        className="text-left"
      />
      <StatusReportList
        statusReports={page.statusReports}
        monitors={page.monitors}
      />
    </div>
  );
}
