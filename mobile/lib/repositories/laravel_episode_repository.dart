import 'package:dio/dio.dart';
import 'package:showtv/contracts/episode_repository.dart';
import 'package:showtv/models/episode.dart';

class LaravelEpisodeRepository implements EpisodeRepository {
  @override
  Future<List<Episode>> list() async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).get('https://show-tv-master-0oh5a1.laravel.cloud/api/episodes');

    return (response.data['data'] as List)
        .map((series) => Episode.fromJson(series))
        .toList();
  }
}
