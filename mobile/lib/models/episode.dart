import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';

typedef Minute = int;

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required String title,
    required String description,
    required Minute duration,
    required String airtime,
    required String thumbnail,
    required String? video,
    required double rating,
    required bool liked,
    required bool disliked,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      title: json['attributes']['title'],
      description: json['attributes']['description'],
      duration: json['attributes']['duration'],
      airtime: json['attributes']['airtime'],
      thumbnail: json['attributes']['thumbnail'],
      video: json['attributes']['video'],
      rating: double.parse(json['attributes']['rating']),
      liked: json['attributes']['liked'],
      disliked: json['attributes']['disliked'],
    );
  }
}
