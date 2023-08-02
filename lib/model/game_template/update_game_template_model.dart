// To parse this JSON data, do
//
//     final updateGameTemplateModel = updateGameTemplateModelFromJson(jsonString);

import 'dart:convert';

UpdateGameTemplateModel updateGameTemplateModelFromJson(String str) => UpdateGameTemplateModel.fromJson(json.decode(str));

String updateGameTemplateModelToJson(UpdateGameTemplateModel data) => json.encode(data.toJson());

class UpdateGameTemplateModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    UpdateGameTemplateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory UpdateGameTemplateModel.fromJson(Map<String, dynamic> json) => UpdateGameTemplateModel(
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
