// To parse this JSON data, do
//
//     final storeDetailsModel = storeDetailsModelFromJson(jsonString);

import 'dart:convert';

StoreDetailsModel storeDetailsModelFromJson(String str) => StoreDetailsModel.fromJson(json.decode(str));

String storeDetailsModelToJson(StoreDetailsModel data) => json.encode(data.toJson());

class StoreDetailsModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    StoreDetailsModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory StoreDetailsModel.fromJson(Map<String, dynamic> json) => StoreDetailsModel(
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
    int couponcount;
    int id;
    int userId;
    String name;
    String image;
    int featured;
    int status;
    int ranValue;
    String username;

    Datum({
        required this.couponcount,
        required this.id,
        required this.userId,
        required this.name,
        required this.image,
        required this.featured,
        required this.status,
        required this.ranValue,
        required this.username,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        couponcount: json["couponcount"],
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        image: json["image"],
        featured: json["featured"],
        status: json["status"],
        ranValue: json["ran_value"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "couponcount": couponcount,
        "id": id,
        "user_id": userId,
        "name": name,
        "image": image,
        "featured": featured,
        "status": status,
        "ran_value": ranValue,
        "username": username,
    };
}
