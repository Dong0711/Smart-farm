import 'package:farm/components/Mytext.dart';
import 'package:flutter/material.dart';

class AvgAnimalChartWdiget extends StatelessWidget {
  const AvgAnimalChartWdiget(
      {super.key,
      required this.title,
      required this.value,
      required this.type});
  final String title;
  final List value;
  final int type;
  @override
  Widget build(BuildContext context) {
    Color? lowColor = Colors.blue[100];
    Color? avgColor = Colors.blue[200];
    Color? heightColor = Colors.blue[300];
    Color? textColor = Colors.blue[900];

    if (type == 1) {
      lowColor = Colors.red[100];
      avgColor = Colors.red[200];
      heightColor = Colors.red[300];
      textColor = Colors.red[900];
    } else if (type == 2) {
      lowColor = Colors.green[100];
      avgColor = Colors.green[200];
      heightColor = Colors.green[300];
      textColor = Colors.green[900];
    }
    if (type == 3) {
      lowColor = Colors.yellow[100];
      avgColor = Colors.yellow[200];
      heightColor = Colors.yellow[300];
      textColor = Colors.yellow[900];
    }

    return Container(
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
      height: 190,
      child: Column(children: [
        MyText(
          text: '${title.toUpperCase()}',
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
                    color: lowColor,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20))),
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: '${type == 3 ? "Bình thường" : "Thấp nhất"}',
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      MyText(
                        text: '${value[0]}',
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      )
                    ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 5,
                color: avgColor,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: '${type == 3 ? "Bệnh" : "Trung bình"}',
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      MyText(
                        text: '${value[1]}',
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      )
                    ]),
              ),
              Container(
                decoration: BoxDecoration(
                    color: heightColor,
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(20))),
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: '${type == 3 ? "Chết" : "Cao nhất"}',
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      MyText(
                        text: '${value[2]}',
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      )
                    ]),
              )
            ],
          ),
        )
      ]),
    );
  }
}
