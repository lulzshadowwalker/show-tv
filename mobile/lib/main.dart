import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/shared/auth_wrapper/auth_wrapper.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowTv',
      debugShowCheckedModeBanner: false,
      builder:
          (context, child) => FTheme(data: FThemes.zinc.light, child: child!),
      home: const AuthWrapper(),
    );
  }
}
