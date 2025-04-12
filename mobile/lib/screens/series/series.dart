import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forui/forui.dart';
import 'package:showtv/models/episode.dart';
import 'package:showtv/models/series.dart' as models;
import 'package:showtv/screens/series/components/episode_list_tile/episode_list_tile.dart';
import 'package:showtv/screens/series/components/follow_button/follow_button.dart';

class Series extends HookWidget {
  const Series({required this.series, this.episode, super.key});

  final models.Series series;
  final Episode? episode;

  @override
  Widget build(BuildContext context) {
    final selected = useState(episode ?? series.episodes.first);

    return FScaffold(
      header: FHeader.nested(
        title: const Text(''),
        prefixActions: [
          FHeaderAction.back(onPress: () => Navigator.of(context).maybePop()),
        ],
      ),
      contentPad: false,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Container(color: Colors.grey, height: 380, width: double.infinity),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 16,
                start: 16,
                end: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 4,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      '${selected.value.duration} Minutes',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Spacer(),
                  FButton.icon(
                    child: FIcon(FAssets.icons.thumbsUp),
                    onPress: () {},
                  ),
                  FButton.icon(
                    child: FIcon(FAssets.icons.thumbsDown),
                    onPress: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selected.value.title,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    selected.value.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const FDivider(),

                  Text(
                    series.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    series.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FollowButton(series: series),

                  const FDivider(),

                  //
                  Text(
                    'Episodes',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...Iterable<int>.generate(
                    series.episodes.length,
                  ).toList().map(
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: EpisodeListTile(
                        episode: series.episodes[index],
                        order: index + 1,
                        active: selected.value.id == series.episodes[index].id,
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder:
                                  (context) => Series(
                                    series: series,
                                    episode: series.episodes[index],
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
