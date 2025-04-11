import 'package:flutter/material.dart';
import 'package:showtv/models/series.dart';
import 'package:showtv/screens/series/series.dart' as screen;

class SeriesListView extends StatelessWidget {
  const SeriesListView({required this.title, required this.series, super.key});

  final String title;
  final List<Series> series;

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
            itemCount: series.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final s = series[index];
              if (s.episodes.isEmpty) return null;

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => screen.Series(series: s),
                    ),
                  );
                },
                child: Container(
                  margin:
                      index != 0 ? null : EdgeInsetsDirectional.only(start: 12),
                  width: 210 * 0.67,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(s.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        s.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 4,
                      ),
                      Text(
                        '${s.episodes.length} Episodes',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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
