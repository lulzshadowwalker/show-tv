import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:showtv/util/show_video.dart';
import 'package:video_player/video_player.dart';

class ShowVideoPlayer extends StatefulWidget {
  const ShowVideoPlayer({required this.url, super.key});

  final String? url;

  @override
  State<ShowVideoPlayer> createState() => _ShowVideoPlayerState();
}

class _ShowVideoPlayerState extends State<ShowVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.url != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!));
    } else {
      _controller = VideoPlayerController.asset(ShowVideo.placeholder);
    }

    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Column(
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Row(
                children: [
                  FButton.icon(
                    child: FIcon(
                      _controller.value.isPlaying
                          ? FAssets.icons.pause
                          : FAssets.icons.play,
                    ),
                    onPress: () {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        )
        : Container();
  }
}
