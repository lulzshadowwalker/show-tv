import 'package:dio/dio.dart';
import 'package:showtv/contracts/like_repository.dart';
import 'package:showtv/models/episode.dart';

class LaravelLikeRepository implements LikeRepository {
  @override
  Future<bool> dislike(String accessToken, Episode episode) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).post(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/episodes/${episode.id}/dislike',
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    if (response.statusCode == 201) return true;
    if (response.statusCode == 200) return false;

    throw Exception('failed to dislike episode ${response.statusMessage}');
  }

  @override
  Future<bool> like(String accessToken, Episode episode) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).post(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/episodes/${episode.id}/like',
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    if (response.statusCode == 201) return true;
    if (response.statusCode == 200) return false;

    throw Exception('failed to like episode ${response.statusMessage}');
  }
}
