import 'package:showtv/models/series.dart';

abstract interface class SeriesRepository {
  Future<List<Series>> list(String accessToken);
  Future<Series> get(String accessToken, String id);
}
