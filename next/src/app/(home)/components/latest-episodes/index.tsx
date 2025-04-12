import { EpisodeRepoFactory } from "@/lib/factory/episode-repo-factory";
import { cn } from "@/lib/utils";
import Image from "next/image";
import Link from "next/link";

export async function LatestEpisodes() {
  const episodes = await EpisodeRepoFactory.make().list();

  return (
    <section id="latest" className="my-10">
      <h2 className="text-5xl font-semibold ms-8 mb-2">Latest Episodes</h2>
      <p className="text-lg font-light text-gray-400 ms-8 mb-6 max-w-prose">
        Stay up-to-date with the newest episodes from your favorite tv-shows.
      </p>

      <ul className="flex items-start gap-4 overflow-scroll">
        {episodes.map((episode, index) => (
          <li key={index} className={cn({ "ms-8": index === 0 })}>
            <Link
              href="#"
              className="block aspect-[0.67] min-w-[18rem] relative rounded-md overflow-hidden group"
            >
              <Image
                src={episode.thumbnail}
                alt=""
                fill
                className="object-cover transition-all duration-700 ease-out group-hover:scale-[1.03]"
              />

              <div className="absolute inset-0 bg-gradient-to-t from-[#1a1a1a] via-transparent to-transparent">
                <div className="absolute bottom-6 start-4">
                  <h1 className="text-2xl font-bold tracking-tight text-white">
                    {episode.title}
                  </h1>
                  <div className="text-base font-medium text-gray-100">
                    {episode.series.title}
                  </div>

                  <p className="text-lg tracking-wide font-light max-w-prose text-gray-200 mt-1 line-clamp-3">
                    {episode.description}
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
