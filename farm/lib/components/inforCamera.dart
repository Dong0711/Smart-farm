import 'package:farm/components/Mytext.dart';
import 'package:farm/model/AnimalLodging.dart';
import 'package:farm/model/camera.dart';
import 'package:farm/page/CameraPage.dart';
import 'package:farm/page/ListFarmPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class CameraInfoContainer extends StatefulWidget {
  const CameraInfoContainer({super.key, required this.animalLodging});
  final AnimalLodging animalLodging;
  @override
  State<CameraInfoContainer> createState() => _CameraInfoContainerState();
}

class _CameraInfoContainerState extends State<CameraInfoContainer> {
  // String camUrl = animalLodging.listCameras?[0].cameraLink ?? '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: InkWell(
        onTap: () {
          // print(' list camera${widget.animalLodging.listCameras[0]}');

          // Navigator.push(context, MaterialPageRoute(builder: (context)=> ))

          
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CameraPage(
                      listCamera: widget.animalLodging.listCameras ?? [])));
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
                Container(
                  height: 90,
                  width: 160,
                  child: VlcPlayer(
                    controller: VlcPlayerController.network(
                        widget.animalLodging.listCameras?[0].cameraLink ?? "",
                        autoInitialize: true,
                        hwAcc: HwAcc.full,
                        autoPlay: true),
                    aspectRatio: 16 / 9,
                  ),
                ),
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
