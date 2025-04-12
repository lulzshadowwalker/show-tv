import { Hero } from "@/components/hero";
import { RecentlyAdded } from "./components/recently-added";
import { LatestEpisodes } from "./components/latest-episodes";

export default function Home() {
  return (
    <main>
      <Hero />
      <RecentlyAdded />
      <LatestEpisodes />
    </main>
  );
}
