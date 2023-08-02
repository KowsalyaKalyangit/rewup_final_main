// To parse this JSON data, do
//
//     final exportPdfModel = exportPdfModelFromJson(jsonString);

import 'dart:convert';

ExportPdfModel exportPdfModelFromJson(String str) => ExportPdfModel.fromJson(json.decode(str));

String exportPdfModelToJson(ExportPdfModel data) => json.encode(data.toJson());

class ExportPdfModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ExportPdfModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ExportPdfModel.fromJson(Map<String, dynamic> json) => ExportPdfModel(
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
