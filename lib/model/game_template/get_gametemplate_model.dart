// To parse this JSON data, do
//
//     final getGameTemplateModel = getGameTemplateModelFromJson(jsonString);

import 'dart:convert';

GetGameTemplateModel getGameTemplateModelFromJson(String str) => GetGameTemplateModel.fromJson(json.decode(str));

String getGameTemplateModelToJson(GetGameTemplateModel data) => json.encode(data.toJson());

class GetGameTemplateModel {
    int success;
    String status;
    String message;
    int totalcount;
    List<Datum> data;

    GetGameTemplateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalcount,
        required this.data,
    });

    factory GetGameTemplateModel.fromJson(Map<String, dynamic> json) => GetGameTemplateModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalcount: json["Totalcount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "Totalcount": totalcount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int slNo;
    int storeId;
    String name;
    String description;

    Datum({
        required this.id,
        required this.slNo,
        required this.storeId,
        required this.name,
        required this.description,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slNo: json["sl.no"],
        storeId: json["store_id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sl.no": slNo,
        "store_id": storeId,
        "name": name,
        "description": description,
    };
}
