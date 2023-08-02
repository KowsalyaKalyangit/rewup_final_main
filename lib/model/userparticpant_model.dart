// To parse this JSON data, do
//
//     final userParticipantModel = userParticipantModelFromJson(jsonString);

import 'dart:convert';

UserParticipantModel userParticipantModelFromJson(String str) => UserParticipantModel.fromJson(json.decode(str));

String userParticipantModelToJson(UserParticipantModel data) => json.encode(data.toJson());

class UserParticipantModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    UserParticipantModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory UserParticipantModel.fromJson(Map<String, dynamic> json) => UserParticipantModel(
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
    int participantscount;
    String username;

    Datum({
        required this.participantscount,
        required this.username,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        participantscount: json["participantscount"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "participantscount": participantscount,
        "username": username,
    };
}
