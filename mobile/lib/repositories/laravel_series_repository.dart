import 'package:dio/dio.dart';
import 'package:showtv/contracts/series_repository.dart';
import 'package:showtv/models/series.dart';

class LaravelSeriesRepository implements SeriesRepository {
  @override
  Future<List<Series>> list(String accessToken) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).get(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/series',
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    return (response.data['data'] as List)
        .map((series) => Series.fromJson(series))
        .toList();
  }

  @override
  Future<Series> get(String accessToken, String id) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).get(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/series/$id',
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    return Series.fromJson(response.data['data']);
  }
}
