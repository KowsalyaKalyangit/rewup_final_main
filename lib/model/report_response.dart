// To parse this JSON data, do
//
//     final reportmodel = reportmodelFromJson(jsonString);

import 'dart:convert';

Reportmodel reportmodelFromJson(String str) =>
    Reportmodel.fromJson(json.decode(str));

String reportmodelToJson(Reportmodel data) => json.encode(data.toJson());

class Reportmodel {
  Reportmodel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  int success;
  String status;
  String message;
  List<Datum> data;

  factory Reportmodel.fromJson(Map<String, dynamic> json) => Reportmodel(
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
  Datum({
    required this.firstname,
    required this.lastname,
    required this.mobile,
    required this.email,
    required this.address,
  });

  String? firstname;
  String? lastname;
  String? mobile;
  String? email;
  String? address;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        firstname: json["firstname"],
        lastname: json["lastname"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "mobile": mobile,
        "email": email,
        "address": address,
      };
}
