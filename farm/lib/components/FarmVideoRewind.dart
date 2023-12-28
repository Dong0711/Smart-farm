import 'package:farm/components/Mytext.dart';
import 'package:farm/components/inforCamera.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/ex.dart';
import 'package:farm/model/AnimalLodging.dart';
import 'package:farm/model/farm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FarmVideoRewind extends StatefulWidget {
  const FarmVideoRewind({
    super.key,
    this.animalLodging,
    required this.farmName,
    required this.farmTemperature,
    required this.farmHumidity,
    required this.farmRainSalary,
    required this.farmLocal,
    required this.farmAcreage,
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
  State<FarmVideoRewind> createState() => _FarmVideoRewindState();
}

class _FarmVideoRewindState extends State<FarmVideoRewind> {
  // ignore: non_constant_identifier_names

  @override
  void initState() {
    super.initState();
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
                    child: ListView.builder(
                      itemCount: widget.animalLodging?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => VideoRewindPage(
                                        animalLodgingName: widget
                                            .animalLodging![index]
                                            .lodgingName!)),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 100,
                              // width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Comparison_land_area_units.svg/298px-Comparison_land_area_units.svg.png'),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Chuồng 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Loài vật nuôi: Lợn',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        'Số Lượng: 50',
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
