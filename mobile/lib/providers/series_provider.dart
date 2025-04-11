import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/models/series.dart';
import 'package:showtv/providers/series_repository_provider.dart';

part 'series_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Series>> series(Ref ref) {
  final repository = ref.watch(seriesRepositoryProvider);
  return repository.list();
}
