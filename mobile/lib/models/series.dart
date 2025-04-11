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
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      title: json['attributes']['title'],
      description: json['attributes']['description'],
      cover: json['attributes']['cover'],
      averageDuration:
          double.parse(json['attributes']['averageDuration']).toInt(),
      rating: double.parse(json['attributes']['rating']),
      episodes:
          json['includes']['series'] is List
              ? (json['includes']['episodes'] as List)
                  .map((episode) => Episode.fromJson(episode))
                  .toList()
              : [],
    );
  }
}
