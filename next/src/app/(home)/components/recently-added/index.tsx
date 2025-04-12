import { cn } from "@/lib/utils";
import Image from "next/image";
import Link from "next/link";

export function RecentlyAdded() {
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
        {Array(500)
          .fill(0)
          .map((_, index) => (
            <li key={index} className={cn({ "ms-8": index === 0 })}>
              <Link
                href="/series/1"
                className="block aspect-[0.67] min-w-[18rem] relative rounded-md overflow-hidden group"
              >
                <Image
                  src="https://images.unsplash.com/photo-1485846234645-a62644f84728?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmlsbXxlbnwwfHwwfHx8MA%3D%3D"
                  alt=""
                  fill
                  className="object-cover transition-all duration-700 ease-out group-hover:scale-[1.03]"
                />

                <div className="absolute inset-0 bg-gradient-to-t from-[#1a1a1a] via-transparent to-transparent">
                  <div className="absolute bottom-6 start-4">
                    <h1 className="text-2xl font-bold tracking-tight text-white">
                      ShowTV
                    </h1>

                    <p className="text-lg tracking-wide font-light max-w-prose text-gray-200 mt-1 line-clamp-3">
                      Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                      Ratione vero, recusandae minima iste eaque quos est
                      aliquid quam labore, sint, provident harum? Atque quia
                      ratione libero ullam perferendis expedita nemo.
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
