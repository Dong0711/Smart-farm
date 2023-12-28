// ignore_for_file: file_names

import 'dart:convert';

// import 'package:farm/components/My_text_field.dart';
import 'package:farm/components/Mytext.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/AnimalLodging.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/AnimalLodgingDetail.dart';

class FarmDetails extends StatefulWidget {
  const FarmDetails(
      {super.key,
      required this.farmName,
      required this.farmAcreage,
      required this.farmLocal});
  // ignore: non_constant_identifier_names
  final String farmName;
  final String farmAcreage;
  final String farmLocal;
  @override
  State<FarmDetails> createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  List<AnimalLodingDetail> listAnimalLodging = [];
  // ignore: non_constant_identifier_names
  Future LoadAnimalLodginDetail() async {
    var response = await http.get(Uri.parse(
        'https://fake-api-smart-farm-zwq6.vercel.app/farm_1_animal_lodging'));
    // print(response);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // print(jsonData);
      for (var item in jsonData) {
        // print(item);
        AnimalLodging animalLodging = AnimalLodging.fromJson(item);
        // print('${animalLodging.animalName}');
        // print(animalLodging.animalName);
        final animalLodingDetail =
            AnimalLodingDetail(animalLodging: animalLodging);
        listAnimalLodging.add(animalLodingDetail);
        // print(animalLodging.animalName);
      }
      // print('legth${listAnimalLodging.length}');
    } else {
      throw Exception("Fail to load farm data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadAnimalLodginDetail();
    setState(() {
      listAnimalLodging = listAnimalLodging;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.primary[50],
            centerTitle: true,
            title: MyText(
              text: widget.farmName,
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
            child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Image.network(
                height: screenWidth * 9 / 16,
                width: screenWidth,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFfN76csuH0MzcEciwZi5XKoouGLjGGpP_UEkI-cWqbQvJDBwUsNUBFiA5cPWXbz6MENo&usqp=CAU',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.primary[10],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: 70,
            child: Column(
              children: [
                MyText(
                  text: "DIỆM TÍCH: ${widget.farmAcreage}m2",
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [MyText(text: "Địa chỉ: ${widget.farmLocal}")],
                )
              ],
            ),
          ),
          FutureBuilder(
            future: LoadAnimalLodginDetail(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [...listAnimalLodging],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ])),
      ),
    );
  }

  // Future get
}
