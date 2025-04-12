import { Series } from "../types";

export interface SeriesRepo {
  list(): Promise<Series[]>;
}
