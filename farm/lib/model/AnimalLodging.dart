import 'package:farm/model/camera.dart';


class AnimalLodging {
  int? lodgingID;
  String? lodgingName;
  int? lodginAcreage;
  String? animalName;
  int? numberOfAnimals;
  List<Camera>? listCameras;

  AnimalLodging(
      {this.lodgingID,
      this.lodgingName,
      this.lodginAcreage,
      this.animalName,
      this.numberOfAnimals,
      this.listCameras});

  AnimalLodging.fromJson(Map<String, dynamic> json) {
    lodgingID = json['lodgingID'];
    lodgingName = json['lodging_name'];
    lodginAcreage = json['lodgin_acreage'];
    animalName = json['animal_name'];
    numberOfAnimals = json['number_of_animals'];
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
    if (this.listCameras != null) {
      data['list_cameras'] = this.listCameras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
