// To parse this JSON data, do
//
//     final couponDetails = couponDetailsFromJson(jsonString);

import 'dart:convert';

CouponDetails couponDetailsFromJson(String str) =>
    CouponDetails.fromJson(json.decode(str));

String couponDetailsToJson(CouponDetails data) => json.encode(data.toJson());

class CouponDetails {
  int success;
  String status;
  String message;

  List<Datum> data;

  CouponDetails({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory CouponDetails.fromJson(Map<String, dynamic> json) => CouponDetails(
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
  int id;
  String title;
  String couponCode;
  int status;
  String image;
  String store;
  String category;

  Datum({
    required this.id,
    required this.title,
    required this.couponCode,
    required this.status,
    required this.image,
    required this.store,
    required this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"] ?? '',
        couponCode: json["coupon_code"],
        status: json["status"],
        image: json["image"],
        store: json["store"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coupon_code": couponCode,
        "status": status,
        "image": image,
        "store": store,
        "category": category,
      };
}
