import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/providers/series_provider.dart';
import 'package:showtv/screens/home/components/series_list_view/series_list_view.dart';
import 'package:shimmer/shimmer.dart';

class RecentlyAdded extends ConsumerWidget {
  const RecentlyAdded({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final series = ref.watch(seriesProvider);

    return series.when(
      data:
          (data) =>
              SeriesListView(title: 'Recently Added TV Shows', series: data),
      loading: () => _ShimmerLoading(),
      error: (error, stackTrace) {
        return const Text('something went wrong');
      },
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
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
          child: Text(
            'Recently Added TV Shows',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
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
