import 'package:showtv/models/series.dart';

abstract interface class SeriesRepository {
  Future<List<Series>> list();
}
