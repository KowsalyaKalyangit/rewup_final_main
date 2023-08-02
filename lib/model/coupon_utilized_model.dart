// To parse this JSON data, do
//
//     final couponUtilizedModel = couponUtilizedModelFromJson(jsonString);

import 'dart:convert';

CouponUtilizedModel couponUtilizedModelFromJson(String str) => CouponUtilizedModel.fromJson(json.decode(str));

String couponUtilizedModelToJson(CouponUtilizedModel data) => json.encode(data.toJson());

class CouponUtilizedModel {
    int success;
    String status;
    String message;
    int totalCustomers;
    List<Title> title;
    List<Datum> data;

    CouponUtilizedModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCustomers,
        required this.title,
        required this.data,
    });

    factory CouponUtilizedModel.fromJson(Map<String, dynamic> json) => CouponUtilizedModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalCustomers: json["TotalCustomers"],
        title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalCustomers": totalCustomers,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String name;
    DateTime timeAdded;
    int storeId;
    String coupon;
    String couponcode;
    String store;

    Datum({
        required this.name,
        required this.timeAdded,
        required this.storeId,
        required this.coupon,
        required this.couponcode,
        required this.store,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        timeAdded: DateTime.parse(json["time_added"]),
        storeId: json["store_id"],
        coupon: json["coupon"],
        couponcode: json["couponcode"],
        store: json["store"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "time_added": timeAdded.toIso8601String(),
        "store_id": storeId,
        "coupon": coupon,
        "couponcode": couponcode,
        "store": store,
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
