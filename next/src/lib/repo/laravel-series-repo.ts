import { config } from "../config";
import { SeriesRepo } from "../contract/series-repo";
import { seriesConverter } from "../converters/series-converter";
import { Series } from "../types";

export class LaravelSeriesRepo implements SeriesRepo {
  async list(): Promise<Series[]> {
    const response = await fetch(`${config.laravelBaseUrl}/series`);

    if (!response.ok) {
      throw new Error(`failed to fetch series because ${response.statusText}`);
    }

    return (await response.json())["data"].map(seriesConverter.fromLaravel);
  }
}
