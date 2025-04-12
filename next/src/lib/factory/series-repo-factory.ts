import { SeriesRepo } from "../contract/series-repo";
import { LaravelSeriesRepo } from "../repo/laravel-series-repo";

export class SeriesRepoFactory {
  static make(): SeriesRepo {
    return new LaravelSeriesRepo();
  }
}
