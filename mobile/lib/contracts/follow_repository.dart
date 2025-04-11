import 'package:showtv/models/series.dart';

abstract interface class FollowRepository {
  Future<bool> follow(String accessToken, Series series);
}
