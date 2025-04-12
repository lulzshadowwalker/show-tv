import { Episode } from "../types";

export interface EpisodeRepo {
  list(): Promise<Episode[]>;
}
