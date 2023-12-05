import 'package:farm/model/camera.dart';
import 'package:intl/intl.dart';

class AnimalLodging {
  int? lodgingID;
  String? lodgingName;
  int? lodginAcreage;
  String? animalName;
  int? numberOfAnimals;
  String? livstockOrigin;
  DateTime? farmingDay;
  DateTime? expectedDay;
  int? numberOfDiseases;
  List<Camera>? listCameras;

  AnimalLodging({
    this.lodgingID,
    this.lodgingName,
    this.lodginAcreage,
    this.animalName,
    this.numberOfAnimals,
    this.livstockOrigin,
    this.farmingDay,
    this.expectedDay,
    this.numberOfDiseases,
    this.listCameras,
  });

  AnimalLodging.fromJson(Map<String, dynamic> json) {
    lodgingID = json['lodgingID'];
    lodgingName = json['lodging_name'];
    lodginAcreage = json['lodgin_acreage'];
    animalName = json['animal_name'];
    numberOfAnimals = json['number_of_animals'];
    livstockOrigin = json['livstock_origin'];
    farmingDay = DateFormat("dd/MM/yyyy").parse(json['farming_day']);
    // farmingDay = DateFormat("dd/MM/yyyy").parse('20/1/2023');

    expectedDay =
        DateFormat("dd/MM/yyyy").parse(json['expected_day'].toString());
    numberOfDiseases = json['number_of_diseases'];
    if (json['list_cameras'] != null) {
      listCameras = <Camera>[];
      json['list_cameras'].forEach((v) {
        listCameras!.add(new Camera.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lodgingID'] = this.lodgingID;
    data['lodging_name'] = this.lodgingName;
    data['lodgin_acreage'] = this.lodginAcreage;
    data['animal_name'] = this.animalName;
    data['number_of_animals'] = this.numberOfAnimals;
    data['livstock_origin'] = this.livstockOrigin;
    data['farming_day'] = this.livstockOrigin.toString().split(' ')[0];
    data['expected_day'] = this.livstockOrigin.toString().split(' ')[0];

    data['number_of_diseases'] = this.numberOfDiseases;
    if (this.listCameras != null) {
      data['list_cameras'] = this.listCameras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
