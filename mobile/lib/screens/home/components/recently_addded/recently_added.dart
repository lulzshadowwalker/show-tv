import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/providers/series_provider.dart';
import 'package:showtv/screens/home/components/series_list_view/series_list_view.dart';

class RecentlyAdded extends ConsumerWidget {
  const RecentlyAdded({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final series = ref.watch(seriesProvider);

    return series.when(
      data:
          (data) =>
              SeriesListView(title: 'Recently Added TV Shows', series: data),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) {
        return const Text('something went wrong');
      },
    );
  }
}
