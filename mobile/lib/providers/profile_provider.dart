import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:showtv/models/user.dart';
import 'package:showtv/providers/profile_repository_provider.dart';

part 'profile_provider.g.dart';

@Riverpod(keepAlive: true)
Future<User?> profile(Ref ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  final token = await FlutterSecureStorage().read(key: 'access-token');
  if (token == null || token == '') return null;

  return repository.fetch(token);
}
