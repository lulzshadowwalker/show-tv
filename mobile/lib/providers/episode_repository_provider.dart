import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/contracts/episode_repository.dart';
import 'package:showtv/repositories/laravel_episode_repository.dart';

part 'episode_repository_provider.g.dart';

@Riverpod(keepAlive: true)
EpisodeRepository episodeRepository(Ref ref) => LaravelEpisodeRepository();
