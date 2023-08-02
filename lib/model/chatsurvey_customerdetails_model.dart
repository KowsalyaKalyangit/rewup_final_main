// To parse this JSON data, do
//
//     final chatSurveyCustomerDetailsmodel = chatSurveyCustomerDetailsmodelFromJson(jsonString);

import 'dart:convert';

ChatSurveyCustomerDetailsmodel chatSurveyCustomerDetailsmodelFromJson(
        String str) =>
    ChatSurveyCustomerDetailsmodel.fromJson(json.decode(str));

String chatSurveyCustomerDetailsmodelToJson(
        ChatSurveyCustomerDetailsmodel data) =>
    json.encode(data.toJson());

class ChatSurveyCustomerDetailsmodel {
  int success;
  String status;
  String message;
  List<Datum> data;

  ChatSurveyCustomerDetailsmodel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChatSurveyCustomerDetailsmodel.fromJson(Map<String, dynamic> json) =>
      ChatSurveyCustomerDetailsmodel(
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
  int chatsurveyId;
  String name;
  String email;
  String? phone;
  int couponStatus;
  int storeId;
  String store;
  int gameId;
  String game;
  int couponId;
  String? coupon;

  Datum({
    required this.id,
    required this.chatsurveyId,
    required this.name,
    required this.email,
    this.phone,
    required this.couponStatus,
    required this.storeId,
    required this.store,
    required this.gameId,
    required this.game,
    required this.couponId,
    this.coupon,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? '',
        chatsurveyId: json["chatsurvey_id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        couponStatus: json["coupon_status"] ?? '',
        storeId: json["store_id"] ?? '',
        store: json["store"] ?? '',
        gameId: json["game_id"] ?? '',
        game: json["game"] ?? '',
        couponId: json["coupon_id"] ?? "",
        coupon: json["coupon"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chatsurvey_id": chatsurveyId,
        "name": name,
        "email": email,
        "phone": phone,
        "coupon_status": couponStatus,
        "store_id": storeId,
        "store": storeValues.reverse[store],
        "game_id": gameId,
        "game": gameValues.reverse[game],
        "coupon_id": couponId,
        "coupon": couponValues.reverse[coupon],
      };
}

enum Coupon { THE_10_OFF, THE_15_OFF, THE_20_OFF, THE_30_OFF }

final couponValues = EnumValues({
  "10% OFF": Coupon.THE_10_OFF,
  "15% OFF": Coupon.THE_15_OFF,
  "20% OFF": Coupon.THE_20_OFF,
  "30% OFF": Coupon.THE_30_OFF
});

enum Game { SPIN }

final gameValues = EnumValues({"SPIN": Game.SPIN});

enum Store { TIBET_MOMO }

final storeValues = EnumValues({"Tibet Momo": Store.TIBET_MOMO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
