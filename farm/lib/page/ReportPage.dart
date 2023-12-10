// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:farm/components/LineChartWidget2.dart';
import 'package:farm/components/LineChartWidgets.dart';
import 'package:farm/components/Mytext.dart';
import 'package:farm/components/PieChartWidget.dart';
import 'package:farm/components/indicator%20.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// import 'package:fl_chart/fl_chart.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  // late ChartData chartData;
  List animals_disease_data = [];
  List grow_and_feding_data = [];
  List rain_salary_data = [];
  List temp_data = [];
  List humidity_data = [];
  // ignore: prefer_typing_uninitialized_variables
  var jsonData;
  Future loadData() async {
    var response = await http.get(
        Uri.parse('https://fake-api-smart-farm-zwq6.vercel.app/chart_data'));
    // print(response);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // List<_JsonMap> data = chartData;
      // print(data);
      // chartData = ChartData.fromJson(jsonData);
      // for( var e in jsonData)
      animals_disease_data = jsonData['animals_disease_data'];
      grow_and_feding_data = jsonData['grow_and_feding_data'];
      rain_salary_data = jsonData['rain_salary_data'];
      temp_data = jsonData['temp_data'];
      humidity_data = jsonData['humidity_data'];
    }
    // print('legth${listAnimalLodging.length}');
    else {
      throw Exception("Fail to load farm data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  // int touchedIndex = 0;
  LineChartWidgets lineChartWidgets = LineChartWidgets();
  PieChartWidget pieChartWidget = PieChartWidget();
  LineChartWidget2 lineChartWidgets2 = LineChartWidget2();
  String startDay = DateFormat('dd-MM-yyy').format(DateTime.utc(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day));
  String endDay = DateFormat('dd-MM-yyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: AppColor.gradien[50]),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                height: 150,
                child: const MyText(
                  text: 'THỐNG KÊ',
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: 2000,
                child: FutureBuilder(
                    future: loadData(),
                    builder: (context, snapsort) {
                      if (snapsort.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const MyText(
                                    text: "Thời gian",
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.white,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: 120,
                                      height: 35,
                                      child: TextButton(
                                        onPressed: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  SizedBox(
                                                      height: 120,
                                                      child:
                                                          CupertinoDatePicker(
                                                              mode:
                                                                  CupertinoDatePickerMode
                                                                      .date,
                                                              //  use24hFormat: true,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              initialDateTime:
                                                                  DateTime
                                                                      .now(),
                                                              onDateTimeChanged:
                                                                  (DateTime
                                                                      newTime) {
                                                                // print(newTime);
                                                                setState(() {
                                                                  startDay = DateFormat(
                                                                          'dd-MM-yyy')
                                                                      .format(
                                                                          newTime);
                                                                });
                                                              })
                                                      // onDateTimeChanged:
                                                      ));
                                        },
                                        child: MyText(
                                          text: startDay,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )),
                                  const MyText(
                                    text: '--',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: 120,
                                      height: 35,
                                      child: TextButton(
                                        onPressed: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  SizedBox(
                                                      height: 120,
                                                      child:
                                                          CupertinoDatePicker(
                                                              mode:
                                                                  CupertinoDatePickerMode
                                                                      .date,
                                                              //  use24hFormat: true,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              initialDateTime:
                                                                  DateTime
                                                                      .now(),
                                                              onDateTimeChanged:
                                                                  (DateTime
                                                                      newTime) {
                                                                // print(newTime);
                                                                setState(() {
                                                                  endDay = DateFormat(
                                                                          'dd-MM-yyy')
                                                                      .format(
                                                                          newTime);
                                                                });
                                                              })
                                                      // onDateTimeChanged:
                                                      ));
                                        },
                                        child: MyText(
                                          text: endDay,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(80, 0, 0, 0),
                                      blurRadius: 15.0,
                                      spreadRadius: 5,
                                      offset: Offset(5, 5))
                                ],
                              ),
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const MyText(
                                    text:
                                        'BIỂU ĐỒ TỈ LỆ SINH TỬ VẬT NUÔI (con)',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AspectRatio(
                                              aspectRatio: 1,
                                              child: PieChart(
                                                  pieChartWidget.pieChartData(
                                                      animals_disease_data))

                                              // .pieChartData([1000, 100, 3]))
                                              // PieChart(PieChartData(
                                              //     startDegreeOffset: -90,
                                              //     borderData: FlBorderData(
                                              //         show: true,
                                              //         border: Border.all(
                                              //             width: 10,
                                              //             color: Colors.black,
                                              //             style: BorderStyle.solid)),
                                              //     sectionsSpace: 0,
                                              //     centerSpaceRadius: 0,
                                              //     sections: showingSections())),
                                              ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Indicator(
                                                  color: const Color.fromRGBO(
                                                      44, 82, 39, 1),
                                                  text:
                                                      'Con bình thường (${animals_disease_data[0]})',
                                                  isSquare: true),
                                              Indicator(
                                                color: const Color.fromRGBO(
                                                    252, 215, 51, 1),
                                                text:
                                                    'con bệnh (${animals_disease_data[0]})',
                                                isSquare: true,
                                              ),
                                              Indicator(
                                                color: Colors.red,
                                                text:
                                                    'con chết (${animals_disease_data[0]})',
                                                isSquare: true,
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                  const MyText(
                                    text: 'Tổng: 100 con',
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 16,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(10),
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(80, 0, 0, 0),
                                      blurRadius: 15.0,
                                      spreadRadius: 5,
                                      offset: Offset(5, 5))
                                ],
                              ),
                              height: 300,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const MyText(
                                      text:
                                          'BIỂU ĐỒ TỈ LỆ PHÁT TRIỂN VÀ THỨC ĂN',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                        height: 200,
                                        child: Stack(children: <Widget>[
                                          AspectRatio(
                                              aspectRatio: 2,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: 25,
                                                    left: 12,
                                                    top: 24,
                                                    bottom: 12,
                                                  ),
                                                  child: lineChartWidgets2
                                                      .LineChart(
                                                          grow_and_feding_data)))
                                        ]))
                                  ]),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(80, 0, 0, 0),
                                        blurRadius: 15.0,
                                        spreadRadius: 5,
                                        offset: Offset(5, 5))
                                  ],
                                ),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const MyText(
                                      text: 'BIỂU ĐỒ TỈ LỆ MƯA (%)',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: Stack(
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 25,
                                                left: 12,
                                                top: 24,
                                                bottom: 12,
                                              ),
                                              child: LineChart(
                                                lineChartWidgets.mainData(
                                                    rain_salary_data, 0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    MyText(
                                      text:
                                          'Trung bình: ${(rain_salary_data.reduce((value, element) => value + element) / rain_salary_data.length).toStringAsFixed(1)}%',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(80, 0, 0, 0),
                                        blurRadius: 15.0,
                                        spreadRadius: 5,
                                        offset: Offset(5, 5))
                                  ],
                                ),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const MyText(
                                      text: 'BIỂU ĐỒ NHIỆT ĐỘ (℃)',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: Stack(
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 25,
                                                left: 12,
                                                top: 24,
                                                bottom: 12,
                                              ),
                                              child: LineChart(
                                                lineChartWidgets.mainData(
                                                    temp_data, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    MyText(
                                      text:
                                          'Trung bình: ${(temp_data.reduce((value, element) => value + element) / rain_salary_data.length).toStringAsFixed(1)}%',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(80, 0, 0, 0),
                                        blurRadius: 15.0,
                                        spreadRadius: 5,
                                        offset: Offset(5, 5))
                                  ],
                                ),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const MyText(
                                      text: 'BIỂU ĐỒ ĐỘ ẨM (%)',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: Stack(
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 25,
                                                left: 12,
                                                top: 24,
                                                bottom: 12,
                                              ),
                                              child: LineChart(
                                                lineChartWidgets.mainData(
                                                    humidity_data, 2),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    MyText(
                                      text:
                                          'Trung bình: ${(humidity_data.reduce((value, element) => value + element) / rain_salary_data.length).toStringAsFixed(1)}%',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ],
                                ))
                          ],
                        );
                      } else {
                        return (const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ));
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
