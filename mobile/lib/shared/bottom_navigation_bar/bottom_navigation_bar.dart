import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/providers/profile_provider.dart';

class ShowBottomNavigationBar extends ConsumerStatefulWidget {
  const ShowBottomNavigationBar({super.key});

  @override
  ConsumerState<ShowBottomNavigationBar> createState() =>
      _ShowBottomNavigationBarState();
}

class _ShowBottomNavigationBarState
    extends ConsumerState<ShowBottomNavigationBar> {
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
        icon: GestureDetector(
          onTap: () async {
            await FlutterSecureStorage().delete(key: 'access-token');
            ref.invalidate(profileProvider);
          },
          child: FIcon(FAssets.icons.logOut),
        ),
        label: const Text('Logout'),
      ),
    ],
  );
}
