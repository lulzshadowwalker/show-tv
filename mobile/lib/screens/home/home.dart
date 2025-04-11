import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:showtv/errors/email_already_in_use_error.dart';
import 'package:showtv/repositories/laravel_auth_repository.dart';
import 'package:showtv/screens/home/components/episode_list_view/episode_list_view.dart';
import 'package:showtv/screens/home/components/recently_addded/recently_added.dart';
import 'package:showtv/screens/home/components/series_list_view/series_list_view.dart';
import 'package:showtv/shared/bottom_navigation_bar/bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FScaffold(
        contentPad: false,
        footer: ShowBottomNavigationBar(),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                height: 380,
                width: double.infinity,
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
