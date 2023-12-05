import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/AnimalLodging.dart';
import 'Mytext.dart';

class AnimalLodingDetail extends StatefulWidget {
  const AnimalLodingDetail({super.key, required this.animalLodging});
  final AnimalLodging animalLodging;
  @override
  State<AnimalLodingDetail> createState() => _AnimalLodingDetailState();
}

class _AnimalLodingDetailState extends State<AnimalLodingDetail> {
  late TextEditingController lodgingNameControler;
  late TextEditingController lodginAcreageControler;
  late TextEditingController animalNameControler;
  late TextEditingController numberAnimalsControler;
  late TextEditingController livstockOriginControler;
  late TextEditingController farmingDayControler;
  late TextEditingController expectedDayControler;
  late TextEditingController numberOfDiseasesControler;
  // AnimalLodging? animalLodging;
  String? lodgingName;
  int? lodginAcreage;
  String? animalName;
  int? numberAnimals;
  String? livstockOrigin;
  String? farmingDay;
  String? expectedDay;
  int? numberOfDiseases;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    lodgingNameControler = TextEditingController();
    lodginAcreageControler = TextEditingController();
    animalNameControler = TextEditingController();
    livstockOriginControler = TextEditingController();
    numberAnimalsControler = TextEditingController();
    farmingDayControler = TextEditingController();
    expectedDayControler = TextEditingController();
    numberOfDiseasesControler = TextEditingController();

    lodgingName = widget.animalLodging.lodgingName;
    lodginAcreage = widget.animalLodging.lodginAcreage;
    animalName = widget.animalLodging.animalName;
    numberAnimals = widget.animalLodging.numberOfAnimals;
    livstockOrigin = widget.animalLodging.livstockOrigin;
    if (widget.animalLodging.farmingDay != null) {
      farmingDay = DateFormat('dd-MM-yyyy')
          .format(widget.animalLodging.farmingDay!)
          .split(' ')[0];
    }
    if (widget.animalLodging.farmingDay != null) {
      expectedDay = DateFormat('dd-MM-yyyy')
          .format(widget.animalLodging.expectedDay!)
          .split(' ')[0];
    }
    numberOfDiseases = widget.animalLodging.numberOfDiseases;
    // print('object');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    lodgingNameControler.dispose();
    lodginAcreageControler.dispose();
    animalNameControler.dispose();
    numberAnimalsControler.dispose();
    livstockOriginControler.dispose();
    farmingDayControler.dispose();
    expectedDayControler.dispose();
    numberOfDiseasesControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 10),
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: MyText(
                text: 'Thông tin ${lodgingName}',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            MyText(text: 'Diện tích:${lodginAcreage}'),
            MyText(text: 'Loại vật nuôi: ${animalName}'),
            MyText(text: 'Nguồn gốc: ${livstockOrigin}'),
            MyText(text: 'Số lượng:${numberAnimals}'),
            MyText(text: 'Ngày nuôi:${farmingDay.toString().split(' ')[0]}'),
            MyText(
                text:
                    'Ngày dự kiến thành phẩm: ${expectedDay.toString().split(' ')[0]}'),
            MyText(text: 'Số con bệnh:${numberOfDiseases}'),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  OpenDialog();
                },
                child: MyText(
                  text: 'Chỉnh sửa',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
    );
  }

  Future OpenDialog() => showDialog(
      context: context,
      builder: (context) => (AlertDialog(
            // titleTextStyle:TextStyle() ,
            title: Text('${lodgingName}'),
            content: Container(
              height: 450,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "${lodginAcreage}", labelText: "Diện tích"),
                  ),
                  TextField(
                    controller: animalNameControler,
                    decoration: InputDecoration(
                        hintText: "${animalName}", labelText: "Loài vật nuôi"),
                  ),
                  TextField(
                    controller: livstockOriginControler,
                    decoration: InputDecoration(
                        hintText: "${livstockOrigin}", labelText: "Nguồn gốc"),
                  ),
                  TextField(
                    controller: numberAnimalsControler,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "${numberAnimals}",
                      labelText: "Số lượng",
                    ),
                  ),
                  TextField(
                    controller: farmingDayControler,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: "${farmingDay}", labelText: "Ngày nuôi"),
                  ),
                  TextField(
                    controller: expectedDayControler,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: "${expectedDay}",
                        labelText: "Ngày dự kiến xuất chuồng"),
                  ),
                  TextField(
                    controller: numberOfDiseasesControler,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "${numberOfDiseases}",
                        labelText: "Số con bệnh"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Submit();
                  },
                  child: Text("SUBMIT"))
            ],
          )));
  void Submit() {
    Navigator.of(context).pop();
    if (lodginAcreageControler.text.isNotEmpty &&
        lodginAcreageControler != null)
      setState(() {
        lodginAcreage = int.parse(lodginAcreageControler.text);
      });
    if (animalNameControler.text.isNotEmpty && animalNameControler != null)
      setState(() {
        animalName = animalNameControler.text;
      });
    if (livstockOriginControler.text.isNotEmpty &&
        livstockOriginControler != null)
      setState(() {
        livstockOrigin = livstockOriginControler.text;
      });
    if (numberAnimalsControler.text.isNotEmpty &&
        numberAnimalsControler != null)
      setState(() {
        numberAnimals = int.parse(numberAnimalsControler.text);
      });
    if (farmingDayControler.text.isNotEmpty && farmingDayControler != null)
      setState(() {
        farmingDay = farmingDayControler.text;
      });
    if (expectedDayControler.text.isNotEmpty && expectedDayControler != null)
      setState(() {
        expectedDay = expectedDayControler.text;
      });
    if (numberOfDiseasesControler.text.isNotEmpty &&
        numberOfDiseasesControler != null)
      setState(() {
        numberOfDiseases = int.parse(numberOfDiseasesControler.text);
      });
  }
}
