import 'dart:convert';

import 'package:farm/components/Mytext.dart';
import 'package:farm/components/inforCamera.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/farm.dart';
import 'package:flutter/material.dart';

class FarmInfoContainer extends StatefulWidget {
  const FarmInfoContainer({super.key, this.farm});
  final Farm? farm;
  @override
  State<FarmInfoContainer> createState() => _FarmInfoContainerState();
}

class _FarmInfoContainerState extends State<FarmInfoContainer> {
  List<CameraInfoContainer> listCam = [];
  void LoadCamera() {
    // if(widget.farm!.animalLodging!)
    // {}
    if (widget.farm!.animalLodging != null) {
      for (var item in widget.farm!.animalLodging!) {
        final CameraInfoContainer container =
            CameraInfoContainer(animalLodging: item);
        listCam.add(container);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadCamera();
  }

  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: AppColor.gradien[50],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: kElevationToShadow[3]),
              height: 300,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: widget.farm!.name ?? 'lỗi trang trại',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyText(
                        text: widget.farm!.local ?? 'Lỗi địa chỉ',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Container(
                    // color: Colors.black,
                    height: 200,
                    child: ListView(
                      children: [...listCam],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "Nhiệt độ: ${widget.farm!.temperature ?? 'lỗi'}",
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      MyText(
                        text: 'Độ ẩm: ${widget.farm!.temperature ?? "lỗi"}',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      MyText(
                        text: 'Lương mưa: ${widget.farm!.rainSalary ?? "lỗi"}',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      MyText(
                        text: 'Diện tích ${widget.farm!.acreage ?? "lỗi"}',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ],
                  )
                ]),
              ),
              // color: Colors.black,
            ),
          ],
        ),
      );
    });
  }
}
