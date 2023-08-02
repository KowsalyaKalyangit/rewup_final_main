// To parse this JSON data, do
//
//     final createemailTemplateModel = createemailTemplateModelFromJson(jsonString);

import 'dart:convert';

CreateemailTemplateModel createemailTemplateModelFromJson(String str) => CreateemailTemplateModel.fromJson(json.decode(str));

String createemailTemplateModelToJson(CreateemailTemplateModel data) => json.encode(data.toJson());

class CreateemailTemplateModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    CreateemailTemplateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory CreateemailTemplateModel.fromJson(Map<String, dynamic> json) => CreateemailTemplateModel(
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
