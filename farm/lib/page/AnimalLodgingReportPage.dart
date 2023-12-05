import 'package:farm/components/Mytext.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimalLodgingReportPage extends StatefulWidget {
  const AnimalLodgingReportPage({super.key});

  @override
  State<AnimalLodgingReportPage> createState() =>
      _AnimalLodgingReportPageState();
}

class _AnimalLodgingReportPageState extends State<AnimalLodgingReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.primary[50],
            centerTitle: true,
            title: MyText(
              text: "TRANG TRẠI 1",
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
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(80, 0, 0, 0),
                          blurRadius: 15.0,
                          spreadRadius: 5,
                          offset: Offset(5, 5))
                    ],
                  ),
                  height: 230,
                  child: Column(children: [
                    MyText(
                      text: 'NHIỆT ĐỘ',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 210, 247, 255),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Thấp nhất',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                  MyText(
                                    text: '20%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  )
                                ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            color: Color.fromARGB(255, 158, 236, 255),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Trung bình',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                  MyText(
                                    text: '22%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  )
                                ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 105, 225, 255),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Cao nhất',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                  MyText(
                                    text: '23%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  )
                                ]),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(80, 0, 0, 0),
                          blurRadius: 15.0,
                          spreadRadius: 5,
                          offset: Offset(5, 5))
                    ],
                  ),
                  height: 230,
                  child: Column(children: [
                    MyText(
                      text: 'NHIỆT ĐỘ',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(253, 224, 224, 1),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Thấp nhất',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900],
                                  ),
                                  MyText(
                                    text: '16%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900],
                                  )
                                ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            color: Color.fromRGBO(244, 193, 193, 1),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Trung bình',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900],
                                  ),
                                  MyText(
                                    text: '25%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900],
                                  )
                                ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(253, 170, 170, 1),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Cao nhất',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900],
                                  ),
                                  MyText(
                                    text: '38%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900],
                                  )
                                ]),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(80, 0, 0, 0),
                          blurRadius: 15.0,
                          spreadRadius: 5,
                          offset: Offset(5, 5))
                    ],
                  ),
                  height: 230,
                  child: Column(children: [
                    MyText(
                      text: 'ĐỘ ẨM',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(199, 233, 192, 1),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Thấp nhất',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900],
                                  ),
                                  MyText(
                                    text: '22%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900],
                                  )
                                ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            color: Color.fromRGBO(161, 217, 155, 1),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Trung bình',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900],
                                  ),
                                  MyText(
                                    text: '24%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900],
                                  )
                                ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(116, 196, 118, 1),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Cao nhất',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900],
                                  ),
                                  MyText(
                                    text: '27%',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900],
                                  )
                                ]),
                          )
                        ],
                      ),
                    )
                  ]),
                )
              ],
            )));
  }
}
