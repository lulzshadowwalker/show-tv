// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Series {

 String get title; String get description; String get cover; Minute get averageDuration; double get rating; List<Episode> get episodes;
/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesCopyWith<Series> get copyWith => _$SeriesCopyWithImpl<Series>(this as Series, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Series&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.averageDuration, averageDuration) || other.averageDuration == averageDuration)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,cover,averageDuration,rating,const DeepCollectionEquality().hash(episodes));

@override
String toString() {
  return 'Series(title: $title, description: $description, cover: $cover, averageDuration: $averageDuration, rating: $rating, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class $SeriesCopyWith<$Res>  {
  factory $SeriesCopyWith(Series value, $Res Function(Series) _then) = _$SeriesCopyWithImpl;
@useResult
$Res call({
 String title, String description, String cover, Minute averageDuration, double rating, List<Episode> episodes
});




}
/// @nodoc
class _$SeriesCopyWithImpl<$Res>
    implements $SeriesCopyWith<$Res> {
  _$SeriesCopyWithImpl(this._self, this._then);

  final Series _self;
  final $Res Function(Series) _then;

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? cover = null,Object? averageDuration = null,Object? rating = null,Object? episodes = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,averageDuration: null == averageDuration ? _self.averageDuration : averageDuration // ignore: cast_nullable_to_non_nullable
as Minute,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,episodes: null == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<Episode>,
  ));
}

}


/// @nodoc


class _Series implements Series {
  const _Series({required this.title, required this.description, required this.cover, required this.averageDuration, required this.rating, required final  List<Episode> episodes}): _episodes = episodes;
  

@override final  String title;
@override final  String description;
@override final  String cover;
@override final  Minute averageDuration;
@override final  double rating;
 final  List<Episode> _episodes;
@override List<Episode> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}


/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesCopyWith<_Series> get copyWith => __$SeriesCopyWithImpl<_Series>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Series&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.averageDuration, averageDuration) || other.averageDuration == averageDuration)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,cover,averageDuration,rating,const DeepCollectionEquality().hash(_episodes));

@override
String toString() {
  return 'Series(title: $title, description: $description, cover: $cover, averageDuration: $averageDuration, rating: $rating, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class _$SeriesCopyWith<$Res> implements $SeriesCopyWith<$Res> {
  factory _$SeriesCopyWith(_Series value, $Res Function(_Series) _then) = __$SeriesCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String cover, Minute averageDuration, double rating, List<Episode> episodes
});




}
/// @nodoc
class __$SeriesCopyWithImpl<$Res>
    implements _$SeriesCopyWith<$Res> {
  __$SeriesCopyWithImpl(this._self, this._then);

  final _Series _self;
  final $Res Function(_Series) _then;

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? cover = null,Object? averageDuration = null,Object? rating = null,Object? episodes = null,}) {
  return _then(_Series(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,averageDuration: null == averageDuration ? _self.averageDuration : averageDuration // ignore: cast_nullable_to_non_nullable
as Minute,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<Episode>,
  ));
}


}

// dart format on
