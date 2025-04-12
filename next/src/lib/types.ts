export type Series = {
  cover: string;
  title: string;
  description: string;
};

export type Episode = {
  thumbnail: string;
  title: string;
  description: string;
  series: Series;
};
