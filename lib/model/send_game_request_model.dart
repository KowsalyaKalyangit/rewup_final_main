// To parse this JSON data, do
//
//     final sendGameRequestModel = sendGameRequestModelFromJson(jsonString);

import 'dart:convert';

SendGameRequestModel sendGameRequestModelFromJson(String str) =>
    SendGameRequestModel.fromJson(json.decode(str));

String sendGameRequestModelToJson(SendGameRequestModel data) =>
    json.encode(data.toJson());

class SendGameRequestModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  SendGameRequestModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory SendGameRequestModel.fromJson(Map<String, dynamic> json) =>
      SendGameRequestModel(
        success: json["success"],
        status: json["status"] ?? "",
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
  String status;

  Datum({
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
