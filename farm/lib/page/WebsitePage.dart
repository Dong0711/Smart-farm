// ignore_for_file: file_names

import 'dart:convert';
// import 'dart:js_interop';

import 'package:farm/components/FarmInfo.dart';
import 'package:farm/components/Mytext.dart';
import 'package:farm/model/NotificationModel.dart';
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
  List<NotificationModel> list = [];
  Future FetchNotifi() async {
    final response = await http.get(
        Uri.parse('https://fake-api-smart-farm-zwq6.vercel.app/notification'));

    if (response.statusCode == 200) {
//  print(object)
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        final notification = NotificationModel.fromJson(item);
        list.add(notification);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // ignore: non_constant_identifier_names
  Future GetFarms() async {
    var response = await http
        .get(Uri.parse('https://fake-api-smart-farm-zwq6.vercel.app/farm'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

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

  Dialog NotificationDialog() {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: FutureBuilder(
        future: FetchNotifi(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: RawMaterialButton(
                    onPressed: () => Navigator.pop(context),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Color titleColor = Colors.green.shade300;
                    if (list[index].notificationType == 1) {
                      titleColor = Colors.yellow.shade300;
                    } else if (list[index].notificationType == 2) {
                      titleColor = Colors.red.shade300;
                    }
                    Color readNoti = list[index].notificationRead == true
                        ? Colors.blue
                        : Colors.transparent;
                    return Card(
                      child: ListTile(
                          tileColor: titleColor,
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: '${list[index].notificationTitle}',
                                  fontWeight: FontWeight.bold,
                                ),
                                MyText(
                                  text:
                                      '${list[index].notificationTime} | ${list[index].notificationDate}',
                                  fontWeight: FontWeight.bold,
                                ),
                              ]),
                          subtitle: MyText(
                            text: '${list[index].notificationSub}',
                            fontSize: 17,
                          ),
                          onTap: () {
                            setState(() {
                              list[index].notificationRead = false;
                              readNoti = Colors.transparent;
                            });
                            print('on tap');
                            Navigator.of(context).popAndPushNamed('/mainPage');
                          },
                          trailing: CircleAvatar(
                              radius: 10, backgroundColor: readNoti)),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // GetFarms();
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return NotificationDialog();
                            },
                          );
                        },
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
