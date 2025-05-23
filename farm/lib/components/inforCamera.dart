import 'package:farm/components/Mytext.dart';
import 'package:farm/model/AnimalLodging.dart';
import 'package:farm/page/CameraPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class CameraInfoContainer extends StatefulWidget {
  const CameraInfoContainer({super.key, required this.animalLodging});
  final AnimalLodging animalLodging;
  @override
  State<CameraInfoContainer> createState() => _CameraInfoContainerState();
}

class _CameraInfoContainerState extends State<CameraInfoContainer> {
  late VlcPlayerController vlcController;
  @override
  void initState() {
    super.initState();

    vlcController = VlcPlayerController.network(
        widget.animalLodging.listCameras?[0].cameraLink ?? "",
        autoInitialize: true,
        hwAcc: HwAcc.full,
        autoPlay: true);
    vlcController.setVolume(0);
    // Workaround for stopping autoplay autoplay with first frame loaded
  }

  @override
  void dispose() {
    vlcController.stopRendererScanning();
    vlcController.dispose();
    super.dispose();
  }

  // String camUrl = animalLodging.listCameras?[0].cameraLink ?? '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CameraPage(
                      listCamera: widget.animalLodging.listCameras ?? [],
                      lodgingName: widget.animalLodging.lodgingName ?? '')));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          // color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: 90,
                    width: 160,
                    child: ClipRRect(
                      child: Image.network(
                          'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmFybXxlbnwwfHwwfHx8MA%3D%3D'),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment:
                    //     MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyText(
                            text: widget.animalLodging.lodgingName ??
                                'Lỗi thông tin',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      MyText(
                        text:
                            "Diện tích: ${widget.animalLodging.lodginAcreage ?? 'Lỗi thông tin'}",
                        fontSize: 13,
                        // fontWeight: FontWeight.bold,
                      ),
                      MyText(
                        text:
                            "Loài vật nuôi:  ${widget.animalLodging.animalName ?? 'Lỗi thông tin'}",
                        fontSize: 13,
                        // fontWeight: FontWeight.bold,
                      ),
                      MyText(
                        text:
                            "Số lượng:  ${widget.animalLodging.lodginAcreage ?? 'Lỗi thông tin'}",
                        fontSize: 13,
                        // fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
