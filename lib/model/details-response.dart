// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) =>
    DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
  DetailsModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  int success;
  String status;
  String message;
  String data;

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        success: json["success"] ?? '',
        status: json["status"] ?? '',
        message: json["message"] ?? '',
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": data,
      };
}
