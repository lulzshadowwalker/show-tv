import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:showtv/providers/episode_provider.dart';

class EpisodeListView extends ConsumerWidget {
  const EpisodeListView({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodes = ref.watch(episodeProvider);

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
          child: episodes.when(
            data:
                (data) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final e = data[index];

                    return Container(
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
                              e.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(e.title),
                        subtitle: Text(
                          e.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
            error: (error, stackTrace) => const Text('something went wrong'),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
