import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class EpisodeListView extends StatelessWidget {
  const EpisodeListView({required this.title, super.key});

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
