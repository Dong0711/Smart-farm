// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:farm/components/Mytext.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:flutter/material.dart';

import '../components/CameraWidget.dart';
import '../model/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.listCamera, required this.lodgingName});
  final String lodgingName;
  final List<Camera> listCamera;
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // final VlcPlayerController vlcPlayerController;
  // autoPlay=false;
  List<CameraWidget> listCamera = [];
  // ignore: non_constant_identifier_names
  void LoadListCamera() {
    for (var item in widget.listCamera) {
      final CameraWidget cameraWidget = CameraWidget(
        camera: item,
      );
      listCamera.add(cameraWidget);
    }
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadListCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary[50],
          title: MyText(
            text: widget.lodgingName,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
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
        body: ListView(
          // scrollDirection: Axis.vertical,
          children: [...listCamera],
        ));
  }
}
