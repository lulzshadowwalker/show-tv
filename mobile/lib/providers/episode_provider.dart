import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/models/episode.dart';
import 'package:showtv/providers/episode_repository_provider.dart';

part 'episode_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Episode>> episode(Ref ref) {
  final repository = ref.watch(episodeRepositoryProvider);
  return repository.list();
}
