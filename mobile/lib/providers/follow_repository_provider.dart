import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/contracts/follow_repository.dart';
import 'package:showtv/repositories/laravel_follow_repository.dart';

part 'follow_repository_provider.g.dart';

@Riverpod(keepAlive: true)
FollowRepository followRepository(Ref ref) => LaravelFollowRepository();
