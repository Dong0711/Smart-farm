import 'package:farm/components/Mytext.dart';
import 'package:farm/components/inforCamera.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/AnimalLodging.dart';
import 'package:farm/model/farm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FarmInfoContainer extends StatefulWidget {
  const FarmInfoContainer({
    super.key,
    this.animalLodging,
    required this.farmName,
    required this.farmTemperature,
    required this.farmHumidity,
    required this.farmRainSalary, required this.farmLocal, required this.farmAcreage,
  });
  // final bool? loadListCamera=true;
  final List<AnimalLodging>? animalLodging;
  final String farmName;
  final double farmTemperature;
  final double farmHumidity;
  final double farmRainSalary;
  final String farmLocal;
  final double farmAcreage;
  @override
  State<FarmInfoContainer> createState() => _FarmInfoContainerState();
}

class _FarmInfoContainerState extends State<FarmInfoContainer> {
  List<CameraInfoContainer> listCam = [];

  // ignore: non_constant_identifier_names
  void LoadCamera() {
    // if(widget.farm!.animalLodging!)
    // {}
    // isenable = true;
    if (widget.animalLodging != null) {
      for (var item in widget.animalLodging!) {
        final CameraInfoContainer container =
            CameraInfoContainer(animalLodging: item);
        listCam.add(container);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    LoadCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: AppColor.gradien[50],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: kElevationToShadow[3]),
              height: 500,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: widget.farmName,
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
                        text: widget.farmLocal.toString(),
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  SizedBox(
                    // color: Colors.black,
                    height: 400,
                    child: ListView(
                      children: [...listCam],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "Nhiệt độ: ${widget.farmTemperature}℃",
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      MyText(
                        // text: 'Độ ẩm: ${widget.farm!.temperature ?? "lỗi"}',
                        text: 'Độ ẩm: ${widget.farmHumidity}%',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      MyText(
                        // text: 'Lương mưa: ${widget.farm!.rainSalary ?? "lỗi"}',
                        text: 'Lương mưa: ${widget.farmRainSalary}%',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      MyText(
                        // text: 'Diện tích ${widget.farm!.acreage ?? "lỗi"}',
                        text: 'Diện tích: ${widget.farmAcreage}m²',
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
