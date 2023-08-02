// To parse this JSON data, do
//
//     final dashboardDateModel = dashboardDateModelFromJson(jsonString);

import 'dart:convert';

DashboardDateModel dashboardDateModelFromJson(String str) => DashboardDateModel.fromJson(json.decode(str));

String dashboardDateModelToJson(DashboardDateModel data) => json.encode(data.toJson());

class DashboardDateModel {
    int success;
    String status;
    String message;
    DateTime fromdate;
    DateTime todate;
    List<Datum> data;

    DashboardDateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.fromdate,
        required this.todate,
        required this.data,
    });

    factory DashboardDateModel.fromJson(Map<String, dynamic> json) => DashboardDateModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        fromdate: DateTime.parse(json["fromdate"]),
        todate: DateTime.parse(json["todate"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "fromdate": "${fromdate.year.toString().padLeft(4, '0')}-${fromdate.month.toString().padLeft(2, '0')}-${fromdate.day.toString().padLeft(2, '0')}",
        "todate": "${todate.year.toString().padLeft(4, '0')}-${todate.month.toString().padLeft(2, '0')}-${todate.day.toString().padLeft(2, '0')}",
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String name;
    int total;
    int? totalUtilized;
    String? couponPercentage;

    Datum({
        required this.name,
        required this.total,
        this.totalUtilized,
        this.couponPercentage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        total: json["Total"],
        totalUtilized: json["TotalUtilized"],
        couponPercentage: json["CouponPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "Total": total,
        "TotalUtilized": totalUtilized,
        "CouponPercentage": couponPercentage,
    };
}
