import 'package:farm/model/AnimalLodging.dart';

class Farm {
  int? id;
  String? name;
  String? local;
  double? acreage;
  double? temperature;
  double? humidity;
  double? rainSalary;
  String? image;
  List<AnimalLodging>? animalLodging;

  Farm(
      {this.id,
      this.name,
      this.local,
      this.acreage,
      this.temperature,
      this.humidity,
      this.rainSalary,
      this.image,
      this.animalLodging});

  Farm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    local = json['local'];
    acreage = (json['acreage'] as num).toDouble();
    temperature = (json['temperature'] as num).toDouble();
    humidity = (json['humidity'] as num).toDouble();
    rainSalary = (json['rain_salary'] as num).toDouble();
    image = json['image'];
    if (json['animal_lodging'] != null) {
      animalLodging = <AnimalLodging>[];
      json['animal_lodging'].forEach((v) {
        animalLodging!.add(new AnimalLodging.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['local'] = this.local;
    data['acreage'] = this.acreage;
    data['temperature'] = this.temperature;
    data['humidity'] = this.humidity;
    data['rain_salary'] = this.rainSalary;
    data['image'] = this.image;
    if (this.animalLodging != null) {
      data['animal_lodging'] =
          this.animalLodging!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
