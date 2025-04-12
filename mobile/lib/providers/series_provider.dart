import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/models/series.dart';
import 'package:showtv/providers/series_repository_provider.dart';

part 'series_provider.g.dart';

@Riverpod(keepAlive: false)
Stream<List<Series>> series(Ref ref) async* {
  while (true) {
    final repository = ref.watch(seriesRepositoryProvider);
    final token = await FlutterSecureStorage().read(key: 'auth-token');
    yield await repository.list(token ?? '');
    await Future.delayed(const Duration(seconds: 5));
  }
}

@riverpod
Stream<Series> singleSeries(Ref ref, String id) async* {
  while (true) {
    final repository = ref.watch(seriesRepositoryProvider);
    final token = await FlutterSecureStorage().read(key: 'auth-token');
    yield await repository.get(token ?? '', id);
    await Future.delayed(const Duration(seconds: 5));
  }
}
