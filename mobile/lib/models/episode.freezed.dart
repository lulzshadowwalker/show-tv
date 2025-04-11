// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Episode {

 String get id; String get title; String get description; Minute get duration; String get airtime; String get thumbnail; String? get video; double get rating; bool get liked; bool get disliked; Series? get series;
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeCopyWith<Episode> get copyWith => _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Episode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.airtime, airtime) || other.airtime == airtime)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.video, video) || other.video == video)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.disliked, disliked) || other.disliked == disliked)&&(identical(other.series, series) || other.series == series));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,duration,airtime,thumbnail,video,rating,liked,disliked,series);

@override
String toString() {
  return 'Episode(id: $id, title: $title, description: $description, duration: $duration, airtime: $airtime, thumbnail: $thumbnail, video: $video, rating: $rating, liked: $liked, disliked: $disliked, series: $series)';
}


}

/// @nodoc
abstract mixin class $EpisodeCopyWith<$Res>  {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) _then) = _$EpisodeCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, Minute duration, String airtime, String thumbnail, String? video, double rating, bool liked, bool disliked, Series? series
});


$SeriesCopyWith<$Res>? get series;

}
/// @nodoc
class _$EpisodeCopyWithImpl<$Res>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._self, this._then);

  final Episode _self;
  final $Res Function(Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? duration = null,Object? airtime = null,Object? thumbnail = null,Object? video = freezed,Object? rating = null,Object? liked = null,Object? disliked = null,Object? series = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Minute,airtime: null == airtime ? _self.airtime : airtime // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,disliked: null == disliked ? _self.disliked : disliked // ignore: cast_nullable_to_non_nullable
as bool,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as Series?,
  ));
}
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesCopyWith<$Res>? get series {
    if (_self.series == null) {
    return null;
  }

  return $SeriesCopyWith<$Res>(_self.series!, (value) {
    return _then(_self.copyWith(series: value));
  });
}
}


/// @nodoc


class _Episode implements Episode {
  const _Episode({required this.id, required this.title, required this.description, required this.duration, required this.airtime, required this.thumbnail, required this.video, required this.rating, required this.liked, required this.disliked, required this.series});
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  Minute duration;
@override final  String airtime;
@override final  String thumbnail;
@override final  String? video;
@override final  double rating;
@override final  bool liked;
@override final  bool disliked;
@override final  Series? series;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeCopyWith<_Episode> get copyWith => __$EpisodeCopyWithImpl<_Episode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Episode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.airtime, airtime) || other.airtime == airtime)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.video, video) || other.video == video)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.disliked, disliked) || other.disliked == disliked)&&(identical(other.series, series) || other.series == series));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,duration,airtime,thumbnail,video,rating,liked,disliked,series);

@override
String toString() {
  return 'Episode(id: $id, title: $title, description: $description, duration: $duration, airtime: $airtime, thumbnail: $thumbnail, video: $video, rating: $rating, liked: $liked, disliked: $disliked, series: $series)';
}


}

/// @nodoc
abstract mixin class _$EpisodeCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$EpisodeCopyWith(_Episode value, $Res Function(_Episode) _then) = __$EpisodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, Minute duration, String airtime, String thumbnail, String? video, double rating, bool liked, bool disliked, Series? series
});


@override $SeriesCopyWith<$Res>? get series;

}
/// @nodoc
class __$EpisodeCopyWithImpl<$Res>
    implements _$EpisodeCopyWith<$Res> {
  __$EpisodeCopyWithImpl(this._self, this._then);

  final _Episode _self;
  final $Res Function(_Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? duration = null,Object? airtime = null,Object? thumbnail = null,Object? video = freezed,Object? rating = null,Object? liked = null,Object? disliked = null,Object? series = freezed,}) {
  return _then(_Episode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Minute,airtime: null == airtime ? _self.airtime : airtime // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,disliked: null == disliked ? _self.disliked : disliked // ignore: cast_nullable_to_non_nullable
as bool,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as Series?,
  ));
}

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesCopyWith<$Res>? get series {
    if (_self.series == null) {
    return null;
  }

  return $SeriesCopyWith<$Res>(_self.series!, (value) {
    return _then(_self.copyWith(series: value));
  });
}
}

// dart format on
