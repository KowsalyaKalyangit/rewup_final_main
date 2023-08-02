// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ForgotPasswordModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
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
