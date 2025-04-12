import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:showtv/providers/episode_provider.dart';
import 'package:showtv/screens/series/series.dart';

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
          height: 320,
          child: episodes.when(
            data:
                (data) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final e = data[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    Series(series: e.series!, episode: e),
                          ),
                        );
                      },
                      child: Container(
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
                          title: Text(e.title, maxLines: 2),
                          subtitle: Text(
                            e.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            error: (error, stackTrace) => const Text('something went wrong'),
            loading: () => const _ShimmerLoading(),
          ),
        ),
      ],
    );
  }
}

class _ShimmerLoading extends StatelessWidget {
  const _ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 99,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 210 * 0.67,
                height: 210,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.withAlpha(160),
                  child: Container(
                    width: 210 * 0.67,
                    height: 210,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
