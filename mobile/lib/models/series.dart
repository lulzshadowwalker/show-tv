import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showtv/models/episode.dart';

part 'series.freezed.dart';

typedef Minute = int;

@freezed
abstract class Series with _$Series {
  const factory Series({
    required String id,
    required String title,
    required String description,
    required String cover,
    required Minute averageDuration,
    required double rating,
    required List<Episode> episodes,
    required bool following,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      title: json['attributes']['title'],
      description: json['attributes']['description'],
      cover: json['attributes']['cover'],
      following: json['attributes']['following'],
      averageDuration:
          double.parse(json['attributes']['averageDuration']).toInt(),
      rating: double.parse(json['attributes']['rating']),
      episodes:
          json['includes']['episodes']?['data'] is List
              ? (json['includes']['episodes']['data'] as List)
                  .map((episode) => Episode.fromJson(episode))
                  .toList()
              : [],
    );
  }
}
