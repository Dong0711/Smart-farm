// ignore_for_file: file_names

import 'dart:convert';

import 'package:farm/components/FarmInfoContainer.dart';
import 'package:farm/components/Mytext.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/farm.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListFarmPage extends StatefulWidget {
  const ListFarmPage({super.key});

  @override
  State<ListFarmPage> createState() => _ListFarmPageState();
}

class _ListFarmPageState extends State<ListFarmPage> {
  List<FarmInfoContainer> listFarm = [];
  // ignore: non_constant_identifier_names
  Future GetFarms() async {
    var response = await http
        .get(Uri.parse('https://fake-api-smart-farm-zwq6.vercel.app/farm'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        final farm = Farm.fromJson(item);
        FarmInfoContainer newFarm = FarmInfoContainer(farm: farm);
        listFarm.add(newFarm);
      }
    } else {
      throw Exception("Fail to load farm data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetFarms();
    // listFarm=FetchFarmInfo()
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.15,
            decoration: BoxDecoration(gradient: AppColor.gradien[50]),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "QUẢN LÝ CAMERA CỦA TRANG TRẠI",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          // listFarm[0],
          FutureBuilder(
            future: GetFarms(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [...listFarm],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
