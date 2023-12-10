// ignore_for_file: file_names

import 'dart:convert';
// import 'dart:js_interop';

import 'package:farm/components/FarmInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/theme/AppColor.dart';
import '../model/farm.dart';

class WebSidePage extends StatefulWidget {
  const WebSidePage({super.key});

  @override
  State<WebSidePage> createState() => _WebSidePageState();
}

class _WebSidePageState extends State<WebSidePage> {
  List<FarmInfo> listFarm = [];
  // ignore: non_constant_identifier_names
  Future GetFarms() async {
    var response = await http
        .get(Uri.parse('https://fake-api-smart-farm-zwq6.vercel.app/farm'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // print('${response}');

      for (var item in jsonData) {
        final farm = Farm.fromJson(item);
        FarmInfo farmInfo = FarmInfo(
          info: farm,
        );
        listFarm.add(farmInfo);
      }
    } else {
      throw Exception("Fail to load farm data");
    }
  }

  @override
  void initState() {
    super.initState();
    GetFarms();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(gradient: AppColor.gradien[50]),
                    height: 150,
                    child:
                        AppBar(backgroundColor: Colors.transparent, actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon((Icons.notifications_active)),
                      ),
                    ]),
                  )),
              Positioned(
                  top: 70,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                    width: 300,
                    height: 160,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FutureBuilder(
                  future: GetFarms(),
                  builder: (context, snapsort) {
                    if (snapsort.connectionState == ConnectionState.done) {
                      return Column(
                        children: [...listFarm],
                      );
                    } else {
                      return (const Center(
                        child: CircularProgressIndicator(),
                      ));
                    }
                  })
            ],
          ),
        ),
      ],
    )
        // ,

        );
  }
}
