import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class Series extends StatelessWidget {
  const Series({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: const Text(''),
        prefixActions: [FHeaderAction.back(onPress: () {})],
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
                    child: Text('45 Minutes', style: TextStyle(fontSize: 14)),
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
                    'Welcome, home.',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const FDivider(),

                  Text(
                    'The Punisher',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FButton(
                    suffix: FIcon(FAssets.icons.circlePlus),
                    label: const Text('Follow'),
                    onPress: () {},
                  ),

                  const FDivider(),

                  //
                  Text(
                    'Episodes',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...List.generate(
                    20,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: EpisodeListTile(),
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

class EpisodeListTile extends StatelessWidget {
  const EpisodeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.deepPurpleAccent),
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.center,
          child: Text(
            '01',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, home.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
