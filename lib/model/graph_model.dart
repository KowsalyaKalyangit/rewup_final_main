// To parse this JSON data, do
//
//     final graphModel = graphModelFromJson(jsonString);

import 'dart:convert';

GraphModel graphModelFromJson(String str) =>
    GraphModel.fromJson(json.decode(str));

String graphModelToJson(GraphModel data) => json.encode(data.toJson());

class GraphModel {
  int success;
  String status;
  String message;
  int totalcustomers;
  int repeatcustomers;
  int utilized;
  String storeId;
  String storename;

  GraphModel({
    required this.success,
    required this.status,
    required this.message,
    required this.totalcustomers,
    required this.repeatcustomers,
    required this.utilized,
    required this.storeId,
    required this.storename,
  });

  factory GraphModel.fromJson(Map<String, dynamic> json) => GraphModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalcustomers: json["totalcustomers"],
        repeatcustomers: json["repeatcustomers"],
        utilized: json["utilized"],
        storeId: json["store_id"],
        storename: json["storename"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "totalcustomers": totalcustomers,
        "repeatcustomers": repeatcustomers,
        "utilized": utilized,
        "store_id": storeId,
        "storename": storename,
      };
}
