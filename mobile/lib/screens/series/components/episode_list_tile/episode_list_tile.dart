import 'package:flutter/material.dart';
import 'package:showtv/models/episode.dart';

class EpisodeListTile extends StatelessWidget {
  const EpisodeListTile({
    required this.episode,
    required this.order,
    this.active = false,
    this.onTap,
    super.key,
  });

  final Episode episode;
  final int order;
  final bool active;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              active ? Colors.deepPurpleAccent.shade100.withAlpha(190) : null,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
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
                '$order'.padLeft(2, '0'),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: active ? Colors.white : null,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    episode.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: active ? Colors.white : null,
                    ),
                  ),
                  Text(
                    episode.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color:
                          active ? Colors.grey.shade100 : Colors.grey.shade600,
                    ),
                    maxLines: 2,
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
