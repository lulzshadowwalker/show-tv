import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/models/episode.dart';
import 'package:showtv/providers/episode_repository_provider.dart';

part 'episode_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<Episode>> episode(Ref ref) async* {
  while (true) {
    final repository = ref.watch(episodeRepositoryProvider);
    yield await repository.list();
    await Future.delayed(const Duration(seconds: 5));
  }
}
