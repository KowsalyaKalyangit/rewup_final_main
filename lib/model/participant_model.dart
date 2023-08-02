// To parse this JSON data, do
//
//     final participantModel = participantModelFromJson(jsonString);

import 'dart:convert';

ParticipantModel participantModelFromJson(String str) => ParticipantModel.fromJson(json.decode(str));

String participantModelToJson(ParticipantModel data) => json.encode(data.toJson());

class ParticipantModel {
    int success;
    String status;
    String message;
    int totalParticipants;
    List<Title> title;
    List<Datum> data;

    ParticipantModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalParticipants,
        required this.title,
        required this.data,
    });

    factory ParticipantModel.fromJson(Map<String, dynamic> json) => ParticipantModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalParticipants: json["TotalParticipants"],
        title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalParticipants": totalParticipants,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String email;
    String phone;
    int storeId;
    String store;

    Datum({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.storeId,
        required this.store,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        storeId: json["store_id"],
        store: json["store"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "store_id": storeId,
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
