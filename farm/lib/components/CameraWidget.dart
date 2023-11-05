import 'package:farm/components/Mytext.dart';
import 'package:farm/components/VideoPlayerWidget.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key, required this.camera});
  final Camera camera;
  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  bool microPhone = false;
  bool volumn = false;
  bool recordVid = false;
  bool snapPic = false;
  bool fullScreen = false;
  @override
  Widget build(BuildContext context) {
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
                text: "${widget.camera.cameraNanme??'Lỗi thông tin'}",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0), child: VideoPlayerWidget(cameraLink: widget.camera.cameraLink??'',)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      // setState(() {
                      //   microPhone = !microPhone;
                      // });
                    },
                    icon: Icon(
                      microPhone ? Icons.mic_rounded : Icons.mic_off_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      // setState(() {
                      //   volumn = !volumn;
                      // });
                    },
                    icon: Icon(
                      volumn ? Icons.volume_up_rounded : Icons.volume_off,
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
                    onPressed: () {
                      print('Snap sort ');
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        fullScreen = !fullScreen;
                      });
                    },
                    icon: Icon(
                      fullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
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
