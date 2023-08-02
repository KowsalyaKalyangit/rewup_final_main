// To parse this JSON data, do
//
//     final customerDetailsModel = customerDetailsModelFromJson(jsonString);

import 'dart:convert';

CustomerDetailsModel customerDetailsModelFromJson(String str) =>
    CustomerDetailsModel.fromJson(json.decode(str));

String customerDetailsModelToJson(CustomerDetailsModel data) =>
    json.encode(data.toJson());

class CustomerDetailsModel {
  int success;
  String status;
  String message;
  int totalCustomers;
  List<Title> title;
  List<Datum> data;

  CustomerDetailsModel({
    required this.success,
    required this.status,
    required this.message,
    required this.totalCustomers,
    required this.title,
    required this.data,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      CustomerDetailsModel(
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
  int id;
  String name;
  String email;
  String? phone;
  int storeId;
  String? store;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.storeId,
    required this.store,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"] ?? "",
        email: json["email"],
        phone: json["phone"],
        storeId: json["store_id"],
        store: json["store"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "store_id": storeId,
        "store": storeValues.reverse[store],
      };
}

enum Store { TIBET_MOMO }

final storeValues = EnumValues({"Tibet Momo": Store.TIBET_MOMO});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
