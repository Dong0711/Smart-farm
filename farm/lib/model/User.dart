import 'dart:convert';

import 'package:http/http.dart' as http;

Future<User> fetchUser() async {
  const apiUrl = 'https://fake-api-smart-farm-zwq6.vercel.app/user';
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('fail to load user');
  }
}

class User {
  int? _id;
  String? _name;
  int? _sex;
  String? _email;
  String? _phoneNumber;
  String? _birthday;
  String? _imgLink;

  User(
      {int? id,
      String? name,
      int? sex,
      String? email,
      String? phoneNumber,
      String? birthday,
      String? imgLink}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (sex != null) {
      this._sex = sex;
    }
    if (email != null) {
      this._email = email;
    }
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
    if (birthday != null) {
      this._birthday = birthday;
    }
    if (imgLink != null) {
      this._imgLink = imgLink;
    }
  }
  

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get sex => _sex;
  set sex(int? sex) => _sex = sex;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  String? get birthday => _birthday;
  set birthday(String? birthday) => _birthday = birthday;
  String? get imgLink => _imgLink;
  set imgLink(String? imgLink) => _imgLink = imgLink;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _sex = json['sex'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _birthday = json['birthday'];
    _imgLink = json['imgLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['sex'] = this._sex;
    data['email'] = this._email;
    data['phoneNumber'] = this._phoneNumber;
    data['birthday'] = this._birthday;
    data['imgLink'] = this._imgLink;
    return data;
  }
}
