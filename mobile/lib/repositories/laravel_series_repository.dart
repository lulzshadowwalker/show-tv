import 'package:dio/dio.dart';
import 'package:showtv/contracts/series_repository.dart';
import 'package:showtv/models/series.dart';

class LaravelSeriesRepository implements SeriesRepository {
  @override
  Future<List<Series>> list() async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).get('https://show-tv-master-0oh5a1.laravel.cloud/api/series');

    return (response.data['data'] as List)
        .map((series) => Series.fromJson(series))
        .toList();
  }
}
