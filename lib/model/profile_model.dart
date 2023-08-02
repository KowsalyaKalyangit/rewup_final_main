// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  ProfileModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int storeid;
  String storename;
  String storeimg;
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  String countryCode;
  String mobile;
  String address;
  String city;
  String state;
  String zip;
  String country;

  Datum({
    required this.storeid,
    required this.storename,
    required this.storeimg,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.countryCode,
    required this.mobile,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        storeid: json["storeid"],
        storename: json["storename"],
        storeimg: json["storeimg"],
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        address: json["address"] ?? "",
        city: json["city"] ?? '',
        state: json["state"] ?? "",
        zip: json["zip"] ?? "",
        country: json["country"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "storeid": storeid,
        "storename": storename,
        "storeimg": storeimg,
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "country_code": countryCode,
        "mobile": mobile,
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
        "country": country,
      };
}
