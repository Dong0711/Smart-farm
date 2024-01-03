// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:farm/components/Mytext.dart';
import 'package:farm/components/VideoPlayerWidget.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/camera.dart';
import 'package:farm/page/full_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key, required this.camera});
  final Camera camera;
  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late VlcPlayerController vlcController;

  bool microPhone = false;
  bool mute = true;
  bool recordVid = false;
  bool snapPic = false;
  bool fullScreen = false;

  @override
  void initState() {
    super.initState();
    final videoURL = widget.camera.cameraLink;
    vlcController = VlcPlayerController.network(videoURL!, autoPlay: false);
    vlcController.play();

    vlcController.setVolume(0);
    // Workaround for stopping autoplay autoplay with first frame loaded
    vlcController.addOnInitListener(_stopAutoplay);
  }

  // Workaround the following bugs:
  // https://github.com/solid-software/flutter_vlc_player/issues/335
  // https://github.com/solid-software/flutter_vlc_player/issues/336
  Future<void> _stopAutoplay() async {
    await vlcController.pause();
    await vlcController.play();

    await vlcController.setVolume(0);

    await Future.delayed(const Duration(milliseconds: 150), () async {
      await vlcController.pause();
      await vlcController.setTime(0);
      await vlcController.setVolume(100);
    });
  }

  @override
  void dispose() {
    // _forcePortrait();

    vlcController.removeOnInitListener(_stopAutoplay);
    vlcController.stopRendererScanning();
    vlcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vlcPlayer = VlcPlayer(
        controller: vlcController,
        aspectRatio: 16 / 9,
        placeholder: const Center(child: CircularProgressIndicator()));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: AppColor.gradien[50],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(
                text: widget.camera.cameraNanme ?? 'Lỗi thông tin',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: vlcPlayer,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        microPhone = !microPhone;
                      });
                    },
                    icon: Icon(
                      microPhone ? Icons.mic_rounded : Icons.mic_off_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      if (mute == false) {
                        vlcController.setVolume(0);
                        mute = true;
                      } else {
                        vlcController.setVolume(1000);
                        mute = false;
                      }
                    },
                    icon: Icon(
                      mute ? Icons.volume_up_rounded : Icons.volume_off,
                      color: Colors.white,
                    )),
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      // setState(() {
                      //   recordVid = !recordVid;
                      //   print('Record video');
                      // });
                    },
                    icon: Icon(
                      Icons.videocam_rounded,
                      color: recordVid ? AppColor.primary[90] : Colors.white,
                    )),
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return VideoScreen(
                          videoUri: '${widget.camera.cameraLink}',
                        );
                      }));
                    },
                    icon: Icon(
                      Icons.fullscreen_exit,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
