import { Episode } from "../types";
import { LaravelSeries, seriesConverter } from "./series-converter";

export type LaravelEpisode = {
  attributes: {
    title: string;
    description: string;
    thumbnail: string;
  };
  includes: {
    series: { data: LaravelSeries };
  };
};

export const episodeConverter = {
  fromLaravel(laravelEpisode: LaravelEpisode): Episode {
    return {
      title: laravelEpisode.attributes.title,
      description: laravelEpisode.attributes.description,
      thumbnail: laravelEpisode.attributes.thumbnail,
      series: seriesConverter.fromLaravel(laravelEpisode.includes.series.data),
    };
  },
};
