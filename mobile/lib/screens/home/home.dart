import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:showtv/shared/bottom_navigation_bar/bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      contentPad: false,
      footer: ShowBottomNavigationBar(),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Container(color: Colors.grey, height: 380, width: double.infinity),
            SeriesListView(title: 'Recently Added TV Shows'),
            const FDivider(),
            LatestEpisodes(),
            const FDivider(),
            SeriesListView(title: 'Following'),
          ],
        ),
      ),
    );
  }
}

class SeriesListView extends StatelessWidget {
  const SeriesListView({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 100,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder:
                (context, index) => Container(
                  margin:
                      index != 0 ? null : EdgeInsetsDirectional.only(start: 12),
                  width: 210 * 0.67,
                  height: 210,
                  color: Colors.grey,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'The Punisher',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '12 Episodes',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }
}

class LatestEpisodes extends StatelessWidget {
  const LatestEpisodes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
          child: Text(
            'Latest Episodes',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 100,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder:
                (context, index) => Container(
                  width: 320,
                  padding:
                      index != 0
                          ? EdgeInsets.zero
                          : EdgeInsetsDirectional.only(start: 12),
                  child: FCard(
                    image: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: SizedBox(
                        height: 200,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmlsbXxlbnwwfHwwfHx8MA%3D%3D',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: const Text('Gratitude'),
                    subtitle: const Text(
                      'The quality of being thankful; readiness to show appreciation for and to return kindness.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
