import 'package:showtv/models/episode.dart';

abstract interface class EpisodeRepository {
  Future<List<Episode>> list();
}
