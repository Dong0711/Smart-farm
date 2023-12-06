import 'package:farm/components/Mytext.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/page/AnimalLodgingPage.dart';
import 'package:farm/page/AnimalLodgingReportPage.dart';
import 'package:farm/page/CameraPage.dart';
import 'package:farm/page/FamrDetailsPage.dart';
import 'package:farm/page/ListFarmPage.dart';
import 'package:flutter/material.dart';

import '../model/farm.dart';

class FarmInfo extends StatefulWidget {
  final Farm info;
  const FarmInfo({super.key, required this.info});

  @override
  State<FarmInfo> createState() => _FarmInfoState();
}

class _FarmInfoState extends State<FarmInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        decoration: BoxDecoration(
            gradient: AppColor.gradien[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: kElevationToShadow[3]),
        height: 350,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: '${widget.info.name}',
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
                  text: '${widget.info.local}',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            Container(
                // color: Colors.black,
                height: 200,
                width: 500,
                child: Image.network(
                  '${widget.info.image}',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: "Nhiệt độ: ${widget.info.temperature}℃",
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                MyText(
                  text: 'Độ ẩm:${widget.info.humidity} %',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                MyText(
                  text: 'Lương mưa: ${widget.info.rainSalary}mm}',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                MyText(
                  text: 'Diện tích ${widget.info.acreage}m2',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FarmDetails()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    width: 100,
                    height: 30,
                    child: MyText(
                      text: 'Quản Lý',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AnimalLodgingReportPage(
                              title: '${widget.info.name}')),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    width: 100,
                    height: 30,
                    child: MyText(
                      text: 'Thống kê',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AnimalLodgingPage(
                                farm: widget.info,
                              )),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    width: 100,
                    height: 30,
                    child: MyText(
                      text: 'Giám sát',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
        // color: Colors.black,
      ),
    );
  }
}
