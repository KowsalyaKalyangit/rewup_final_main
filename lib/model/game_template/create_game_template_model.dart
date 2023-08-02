// To parse this JSON data, do
//
//     final createGameTemplateModel = createGameTemplateModelFromJson(jsonString);

import 'dart:convert';

CreateGameTemplateModel createGameTemplateModelFromJson(String str) => CreateGameTemplateModel.fromJson(json.decode(str));

String createGameTemplateModelToJson(CreateGameTemplateModel data) => json.encode(data.toJson());

class CreateGameTemplateModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    CreateGameTemplateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory CreateGameTemplateModel.fromJson(Map<String, dynamic> json) => CreateGameTemplateModel(
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
