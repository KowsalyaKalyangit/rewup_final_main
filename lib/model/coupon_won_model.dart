// To parse this JSON data, do
//
//     final couponWonModel = couponWonModelFromJson(jsonString);

import 'dart:convert';

CouponWonModel couponWonModelFromJson(String str) =>
    CouponWonModel.fromJson(json.decode(str));

String couponWonModelToJson(CouponWonModel data) => json.encode(data.toJson());

class CouponWonModel {
  int success;
  String status;
  String message;
  int totalcount;
  String storeId;
  String storename;
  List<Title> title;
  List<Datum> data;

  CouponWonModel({
    required this.success,
    required this.status,
    required this.message,
    required this.totalcount,
    required this.storeId,
    required this.storename,
    required this.title,
    required this.data,
  });

  factory CouponWonModel.fromJson(Map<String, dynamic> json) => CouponWonModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalcount: json["totalcount"],
        storeId: json["store_id"] ?? "",
        storename: json["storename"] ?? '',
        title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "totalcount": totalcount,
        "store_id": storeId,
        "storename": storename,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int customerId;
  String name;
  String timeAdded;
  int couponId;
  String title;

  Datum({
    required this.id,
    required this.customerId,
    required this.name,
    required this.timeAdded,
    required this.couponId,
    required this.title,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        timeAdded: json["time_added"],
        couponId: json["coupon_id"],
        title: json["title"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
        "time_added": timeAdded,
        "coupon_id": couponId,
        "title": title,
      };
}

class Title {
  String title1;
  String title2;
  String title3;

  Title({
    required this.title1,
    required this.title2,
    required this.title3,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        title1: json["title1"],
        title2: json["title2"],
        title3: json["title3"],
      );

  Map<String, dynamic> toJson() => {
        "title1": title1,
        "title2": title2,
        "title3": title3,
      };
}
