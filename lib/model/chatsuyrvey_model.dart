// To parse this JSON data, do
//
//     final chatSuurveymodel = chatSuurveymodelFromJson(jsonString);

import 'dart:convert';

ChatSuurveymodel chatSuurveymodelFromJson(String str) => ChatSuurveymodel.fromJson(json.decode(str));

String chatSuurveymodelToJson(ChatSuurveymodel data) => json.encode(data.toJson());

class ChatSuurveymodel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ChatSuurveymodel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ChatSuurveymodel.fromJson(Map<String, dynamic> json) => ChatSuurveymodel(
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
    String title;
    String description;
    DateTime startDate;
    DateTime endDate;

    Datum({
        required this.id,
        required this.title,
        required this.description,
        required this.startDate,
        required this.endDate,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    };
}
