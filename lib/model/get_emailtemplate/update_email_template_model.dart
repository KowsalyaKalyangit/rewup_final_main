// To parse this JSON data, do
//
//     final updateemailTemplateModel = updateemailTemplateModelFromJson(jsonString);

import 'dart:convert';

UpdateemailTemplateModel updateemailTemplateModelFromJson(String str) => UpdateemailTemplateModel.fromJson(json.decode(str));

String updateemailTemplateModelToJson(UpdateemailTemplateModel data) => json.encode(data.toJson());

class UpdateemailTemplateModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    UpdateemailTemplateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory UpdateemailTemplateModel.fromJson(Map<String, dynamic> json) => UpdateemailTemplateModel(
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
