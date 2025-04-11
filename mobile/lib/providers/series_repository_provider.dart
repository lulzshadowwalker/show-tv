import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/contracts/series_repository.dart';
import 'package:showtv/repositories/laravel_series_repository.dart';

part 'series_repository_provider.g.dart';

@Riverpod(keepAlive: true)
SeriesRepository seriesRepository(Ref ref) => LaravelSeriesRepository();
