import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.cameraLink});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
  final String cameraLink;
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VlcPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VlcPlayerController.network(
      '${widget.cameraLink}',
      autoInitialize: true,
      autoPlay: true,
      hwAcc: HwAcc.full,
      options: VlcPlayerOptions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VlcPlayer(
      controller: _controller,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
