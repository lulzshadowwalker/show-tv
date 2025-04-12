import { Series } from "../types";

export type LaravelSeries = {
  attributes: {
    title: string;
    description: string;
    cover: string;
  };
};

export const seriesConverter = {
  fromLaravel(laravelSeries: LaravelSeries): Series {
    return {
      title: laravelSeries.attributes.title,
      description: laravelSeries.attributes.description,
      cover: laravelSeries.attributes.cover,
    };
  },
};
