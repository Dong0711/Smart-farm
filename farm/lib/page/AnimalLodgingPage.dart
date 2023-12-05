import 'dart:convert';

import 'package:farm/components/Mytext.dart';
import 'package:farm/components/inforCamera.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/farm.dart';
import 'package:flutter/material.dart';

import '../model/AnimalLodging.dart';

class AnimalLodgingPage extends StatefulWidget {
  const AnimalLodgingPage({
    super.key,
    required this.farm,
  });
  // final bool? loadListCamera=true;
  final Farm farm;
  @override
  State<AnimalLodgingPage> createState() => _AnimalLodgingPageState();
}

class _AnimalLodgingPageState extends State<AnimalLodgingPage> {
  List<CameraInfoContainer> listCam = [];
  void LoadCamera() {
    // if(widget.farm!.animalLodging!)
    // {}
    // isenable = true;
    List<AnimalLodging>? animalLodgings = widget.farm.animalLodging;
    if (animalLodgings != null) {
      for (var item in animalLodgings) {
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
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary[50],
          title: MyText(
            text: '${widget.farm.name}',
            fontWeight: FontWeight.bold,            color: Colors.white,
            fontSize: 25,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                print('click');
                Navigator.pop(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: Icon(
                  Icons.chevron_left_outlined,
                  size: 30,
                  color: AppColor.primary[50],
                ),
              )),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
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
                      height: 400,
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
                          text:
                              "Nhiệt độ: ${widget.farm!.temperature ?? 'lỗi'}",
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
                          text:
                              'Lương mưa: ${widget.farm!.rainSalary ?? "lỗi"}',
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
        ),
      );
    });
  }
}
