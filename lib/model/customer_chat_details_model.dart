// To parse this JSON data, do
//
//     final customerChatDetailsModel = customerChatDetailsModelFromJson(jsonString);

import 'dart:convert';

CustomerChatDetailsModel customerChatDetailsModelFromJson(String str) =>
    CustomerChatDetailsModel.fromJson(json.decode(str));

String customerChatDetailsModelToJson(CustomerChatDetailsModel data) =>
    json.encode(data.toJson());

class CustomerChatDetailsModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  CustomerChatDetailsModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory CustomerChatDetailsModel.fromJson(Map<String, dynamic> json) =>
      CustomerChatDetailsModel(
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
  int customerId;
  int chatId;
  int questionId;
  String question;
  String answers;

  Datum({
    required this.id,
    required this.customerId,
    required this.chatId,
    required this.questionId,
    required this.question,
    required this.answers,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customerId: json["customer_id"],
        chatId: json["chat_id"],
        questionId: json["question_id"],
        question: json["question"],
        answers: json["answers"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "chat_id": chatId,
        "question_id": questionId,
        "question": question,
        "answers": answers,
      };
}
