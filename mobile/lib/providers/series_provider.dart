import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/models/series.dart';
import 'package:showtv/providers/series_repository_provider.dart';

part 'series_provider.g.dart';

@Riverpod(keepAlive: false  )
Future<List<Series>> series(Ref ref) async {
  final repository = ref.watch(seriesRepositoryProvider);
  final token = await FlutterSecureStorage().read(key: 'auth-token');
  return repository.list(token ?? '');
}

@riverpod
Future<Series> singleSeries(Ref ref, String id) async {
  final repository = ref.watch(seriesRepositoryProvider);
  final token = await FlutterSecureStorage().read(key: 'auth-token');

  return repository.get(token ?? '', id);
}
