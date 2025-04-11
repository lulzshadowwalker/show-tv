import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/contracts/profile_repository.dart';
import 'package:showtv/repositories/laravel_profile_repository.dart';

part 'profile_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) => LaravelProfileRepository();
