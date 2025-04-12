import { EpisodeRepo } from "../contract/episode-repo";
import { LaravelEpisodeRepo } from "../repo/laravel-episode-repo";

export class EpisodeRepoFactory {
  static make(): EpisodeRepo {
    return new LaravelEpisodeRepo();
  }
}
