import 'package:dio/dio.dart';
import 'package:showtv/contracts/follow_repository.dart';
import 'package:showtv/models/series.dart';

class LaravelFollowRepository implements FollowRepository {
  @override
  Future<bool> follow(String accessToken, Series series) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).post(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/series/${series.id}/follow',
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    if (response.statusCode == 201) return true;
    if (response.statusCode == 200) return false;

    throw Exception('failed to follow series ${response.statusMessage}');
  }
}
