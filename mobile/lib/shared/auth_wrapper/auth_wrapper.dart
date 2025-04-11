import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/widgets/scaffold.dart';
import 'package:showtv/providers/profile_provider.dart';
import 'package:showtv/screens/home/home.dart';
import 'package:showtv/screens/login/login.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return profile.when(
      data: (data) => data == null ? const Login() : const Home(),
      loading:
          () => Scaffold(
            body: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: const CircularProgressIndicator(color: Colors.black),
              ),
            ),
          ),
      error: (_, __) => const Text('something went wrong.'),
    );
  }
}
