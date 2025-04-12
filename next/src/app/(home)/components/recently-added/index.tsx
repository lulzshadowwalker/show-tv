import { SeriesRepoFactory } from "@/lib/factory/series-repo-factory";
import { cn } from "@/lib/utils";
import Image from "next/image";
import Link from "next/link";

export async function RecentlyAdded() {
  const series = await SeriesRepoFactory.make().list();

  return (
    <section id="latest" className="my-10" style={{ scrollMarginTop: "6rem" }}>
      <h2 className="text-5xl font-semibold ms-8 mb-2">
        Recently Added TV Shows
      </h2>
      <p className="text-lg font-light text-gray-400 ms-8 mb-6 max-w-prose">
        Discover the most recent addition to our rich collection of world-class
        tv-shows.
      </p>

      <ul className="flex items-start gap-4 overflow-scroll">
        {series.map((series, index) => (
          <li key={index} className={cn({ "ms-8": index === 0 })}>
            <Link
              href="#"
              className="block aspect-[0.67] min-w-[18rem] relative rounded-md overflow-hidden group"
            >
              <Image
                src={series.cover}
                alt=""
                fill
                className="object-cover transition-all duration-700 ease-out group-hover:scale-[1.03]"
              />

              <div className="absolute inset-0 bg-gradient-to-t from-[#1a1a1a] via-transparent to-transparent">
                <div className="absolute bottom-6 start-4">
                  <h1 className="text-2xl font-bold tracking-tight text-white">
                    {series.title}
                  </h1>

                  <p className="text-lg tracking-wide font-light max-w-prose text-gray-200 mt-1 line-clamp-3">
                    {series.description}
                  </p>
                </div>
              </div>
            </Link>
          </li>
        ))}
      </ul>
    </section>
  );
}
