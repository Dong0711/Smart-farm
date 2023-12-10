import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoContainer extends StatefulWidget {
  const VideoContainer({
    super.key,
    required this.url,
    this.width,
    this.height,
  });
  final String url;
  final double? width;
  final double? height;
  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VlcPlayerController _vlcPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(widget.url,
        autoInitialize: true,
        autoPlay: true,
        hwAcc: HwAcc.full,
        options: VlcPlayerOptions());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 160,
      child: VlcPlayer(
        controller: _vlcPlayerController,
        aspectRatio: 16 / 9,
        placeholder: const CircularProgressIndicator(),
      ),
    );
  }
}
