// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  int success;
  String status;
  String message;
  String fromdate;
  String todate;
  List<Datum> data;

  DashboardModel({
    required this.success,
    required this.status,
    required this.message,
    required this.fromdate,
    required this.todate,
    required this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        fromdate: json["fromdate"],
        todate: json["todate"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "fromdate":
            "${fromdate.toString().padLeft(4, '0')}-${fromdate.toString().padLeft(2, '0')}-${fromdate.toString().padLeft(2, '0')}",
        "todate":
            "${todate.toString().padLeft(4, '0')}-${todate.toString().padLeft(2, '0')}-${todate.toString().padLeft(2, '0')}",
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String name;
  int total;

  Datum({
    required this.name,
    required this.total,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"] ?? "",
        total: json["Total"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "Total": total,
      };
}
