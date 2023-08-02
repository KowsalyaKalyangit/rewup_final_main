// To parse this JSON data, do
//
//     final exportCsvModel = exportCsvModelFromJson(jsonString);

import 'dart:convert';

ExportCsvModel exportCsvModelFromJson(String str) =>
    ExportCsvModel.fromJson(json.decode(str));

String exportCsvModelToJson(ExportCsvModel data) => json.encode(data.toJson());

class ExportCsvModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  ExportCsvModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ExportCsvModel.fromJson(Map<String, dynamic> json) => ExportCsvModel(
        success: json["success"],
        status: json["status"] ?? '',
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
  String filename;

  Datum({
    required this.filename,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        filename: json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
      };
}
