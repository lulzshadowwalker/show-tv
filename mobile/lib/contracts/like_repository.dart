import 'package:showtv/models/episode.dart';

abstract interface class LikeRepository {
  Future<bool> like(String accessToken, Episode episode);
  Future<bool> dislike(String accessToken, Episode episode);
}
