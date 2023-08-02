// To parse this JSON data, do
//
//     final exportPdfDate = exportPdfDateFromJson(jsonString);

import 'dart:convert';

ExportPdfDate exportPdfDateFromJson(String str) => ExportPdfDate.fromJson(json.decode(str));

String exportPdfDateToJson(ExportPdfDate data) => json.encode(data.toJson());

class ExportPdfDate {
    int success;
    String status;
    String message;
    List<Datum> data;

    ExportPdfDate({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ExportPdfDate.fromJson(Map<String, dynamic> json) => ExportPdfDate(
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
