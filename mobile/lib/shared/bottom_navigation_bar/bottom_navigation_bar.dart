import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class ShowBottomNavigationBar extends StatefulWidget {
  const ShowBottomNavigationBar({super.key});

  @override
  State<ShowBottomNavigationBar> createState() =>
      _ShowBottomNavigationBarState();
}

class _ShowBottomNavigationBarState extends State<ShowBottomNavigationBar> {
  int index = 1;

  @override
  Widget build(BuildContext context) => FBottomNavigationBar(
    index: index,
    onChange: (index) => setState(() => this.index = index),
    children: [
      FBottomNavigationBarItem(
        icon: FIcon(FAssets.icons.house),
        label: const Text('Home'),
      ),
      FBottomNavigationBarItem(
        icon: FIcon(FAssets.icons.search),
        label: const Text('Search'),
      ),
      FBottomNavigationBarItem(
        icon: FIcon(FAssets.icons.logOut),
        label: const Text('Logout'),
      ),
    ],
  );
}
