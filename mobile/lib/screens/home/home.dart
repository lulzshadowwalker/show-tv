import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/errors/email_already_in_use_error.dart';
import 'package:showtv/providers/profile_provider.dart';
import 'package:showtv/repositories/laravel_auth_repository.dart';
import 'package:showtv/screens/home/components/episode_list_view/episode_list_view.dart';
import 'package:showtv/screens/home/components/recently_addded/recently_added.dart';
import 'package:showtv/screens/home/components/series_list_view/series_list_view.dart';
import 'package:showtv/shared/bottom_navigation_bar/bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const images = [
    'https://images.unsplash.com/photo-1486693128850-a77436e7ba3c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGZpbG18ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1534949378632-3e4e87ec219f?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1485846234645-a62644f84728?q=80&w=2659&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FScaffold(
        header: Consumer(
          builder: (context, ref, child) {
            final profile = ref.watch(profileProvider);

            return FHeader(
              title: Text(profile.value != null ? profile.value!.name : 'Home'),
              actions: [
                if (profile.value != null)
                  FAvatar(
                    image: NetworkImage(
                      '${profile.value!.avatar}.extensiontomakeyouhappy',
                    ),
                  ),
              ],
            );
          },
        ),
        contentPad: false,
        footer: ShowBottomNavigationBar(),
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 380,
                child: PageView.builder(
                  itemCount: images.length,
                  itemBuilder:
                      (context, index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(images[index]),
                          ),
                        ),
                        height: 380,
                        width: double.infinity,
                      ),
                ),
              ),
              const RecentlyAdded(),
              const FDivider(),
              EpisodeListView(title: 'Episode List'),
            ],
          ),
        ),
      ),
    );
  }
}
