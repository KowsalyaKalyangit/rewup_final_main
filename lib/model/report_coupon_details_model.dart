// To parse this JSON data, do
//
//     final reportCouponModel = reportCouponModelFromJson(jsonString);

import 'dart:convert';

ReportCouponModel reportCouponModelFromJson(String str) => ReportCouponModel.fromJson(json.decode(str));

String reportCouponModelToJson(ReportCouponModel data) => json.encode(data.toJson());

class ReportCouponModel {
    int success;
    String status;
    String message;
    String storeId;
    String storename;
    int totalcount;
    List<Title> title;
    List<Datum> data;

    ReportCouponModel({
        required this.success,
        required this.status,
        required this.message,
        required this.storeId,
        required this.storename,
        required this.totalcount,
        required this.title,
        required this.data,
    });

    factory ReportCouponModel.fromJson(Map<String, dynamic> json) => ReportCouponModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        storeId: json["store_id"],
        storename: json["storename"],
        totalcount: json["totalcount"],
        title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "store_id": storeId,
        "storename": storename,
        "totalcount": totalcount,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String title;
    int totalcouponwon;
    int totalcouponutilized;
    int totalcouponunutilized;

    Datum({
        required this.id,
        required this.title,
        required this.totalcouponwon,
        required this.totalcouponutilized,
        required this.totalcouponunutilized,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        totalcouponwon: json["totalcouponwon"],
        totalcouponutilized: json["totalcouponutilized"],
        totalcouponunutilized: json["totalcouponunutilized"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "totalcouponwon": totalcouponwon,
        "totalcouponutilized": totalcouponutilized,
        "totalcouponunutilized": totalcouponunutilized,
    };
}

class Title {
    String title1;
    String title2;
    String title3;
    String title4;

    Title({
        required this.title1,
        required this.title2,
        required this.title3,
        required this.title4,
    });

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        title1: json["title1"],
        title2: json["title2"],
        title3: json["title3"],
        title4: json["title4"],
    );

    Map<String, dynamic> toJson() => {
        "title1": title1,
        "title2": title2,
        "title3": title3,
        "title4": title4,
    };
}
