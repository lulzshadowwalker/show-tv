import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:showtv/screens/home/home.dart';
import 'package:showtv/screens/login/login.dart';
import 'package:showtv/screens/register/register.dart';
import 'package:showtv/screens/series/series.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowTv',
      debugShowCheckedModeBanner: false,
      builder:
          (context, child) => FTheme(data: FThemes.zinc.light, child: child!),
      home: const Home(),
    );
  }
}
