// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) => Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
    int success;
    String message;
    String username;
    int userid;
    int storeid;
    int storecode;
    String token;

    Loginmodel({
        required this.success,
        required this.message,
        required this.username,
        required this.userid,
        required this.storeid,
        required this.storecode,
        required this.token,
    });

    factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
        success: json["success"],
        message: json["message"],
        username: json["username"],
        userid: json["userid"],
        storeid: json["storeid"],
        storecode: json["storecode"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "username": username,
        "userid": userid,
        "storeid": storeid,
        "storecode": storecode,
        "token": token,
    };
}
