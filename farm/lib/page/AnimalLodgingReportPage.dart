// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:farm/components/AvgAnimalChartWidget.dart';
import 'package:farm/components/Mytext.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimalLodgingReportPage extends StatefulWidget {
  const AnimalLodgingReportPage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<AnimalLodgingReportPage> createState() =>
      _AnimalLodgingReportPageState();
}

class _AnimalLodgingReportPageState extends State<AnimalLodgingReportPage> {
  List animals_disease_data = [];
  List rain_salary_data = [];
  List temp_data = [];
  List humidity_data = [];
  Future loadData() async {
    var response = await http.get(Uri.parse(
        'https://fake-api-smart-farm-zwq6.vercel.app/animla_lodging_data'));
    // print(response);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      animals_disease_data = jsonData['animals_disease_data'];
      rain_salary_data = jsonData['rain_salary_data'];
      temp_data = jsonData['temp_data'];
      humidity_data = jsonData['humidity_data'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.primary[50],
            centerTitle: true,
            title: MyText(
              text: widget.title,
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.chevron_left_outlined,
                  size: 30,
                  color: AppColor.primary[50],
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder(
                  future: loadData(),
                  builder: (context, snapsort) {
                    if (snapsort.connectionState == ConnectionState.done) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AvgAnimalChartWdiget(
                              title: 'Số LƯỢNG CON BỆN',
                              value: animals_disease_data,
                              type: 3),
                          AvgAnimalChartWdiget(
                              title: 'Lượng Mưa',
                              value: rain_salary_data,
                              type: 0),
                          AvgAnimalChartWdiget(
                              title: 'Độ ẨM', value: humidity_data, type: 2),
                          AvgAnimalChartWdiget(
                              title: 'NHIỆT ĐỘ', value: temp_data, type: 1),
                        ],
                      );
                    } else {
                      return (const Center(child: CircularProgressIndicator()));
                    }
                  })),
        ));
  }
}
