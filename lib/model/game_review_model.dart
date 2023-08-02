// To parse this JSON data, do
//
//     final gameReviewModel = gameReviewModelFromJson(jsonString);

import 'dart:convert';

GameReviewModel gameReviewModelFromJson(String str) =>
    GameReviewModel.fromJson(json.decode(str));

String gameReviewModelToJson(GameReviewModel data) =>
    json.encode(data.toJson());

class GameReviewModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  GameReviewModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory GameReviewModel.fromJson(Map<String, dynamic> json) =>
      GameReviewModel(
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
  String value;
  String url;
  String img;
  String name;

  Datum({
    required this.value,
    required this.url,
    required this.img,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        value: json["value"],
        url: json["url"],
        img: json["img"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "url": url,
        "img": img,
        "name": name,
      };
}
