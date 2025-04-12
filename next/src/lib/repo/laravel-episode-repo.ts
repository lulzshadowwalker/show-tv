import { config } from "../config";
import { EpisodeRepo } from "../contract/episode-repo";
import { episodeConverter } from "../converters/episode-converter";
import { Episode } from "../types";

export class LaravelEpisodeRepo implements EpisodeRepo {
  async list(): Promise<Episode[]> {
    const response = await fetch(`${config.laravelBaseUrl}/episodes`);

    if (!response.ok) {
      throw new Error(`failed to fetch episode because ${response.statusText}`);
    }

    return (await response.json())["data"].map(episodeConverter.fromLaravel);
  }
}
