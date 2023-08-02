// To parse this JSON data, do
//
//     final pieChartModel = pieChartModelFromJson(jsonString);

import 'dart:convert';

PieChartModel pieChartModelFromJson(String str) => PieChartModel.fromJson(json.decode(str));

String pieChartModelToJson(PieChartModel data) => json.encode(data.toJson());

class PieChartModel {
    int success;
    String status;
    String message;
    List<Title> title;
    int totalCount;
    int googleCount;
    int instagramCount;
    int facebookCount;
    int twitterCount;

    PieChartModel({
        required this.success,
        required this.status,
        required this.message,
        required this.title,
        required this.totalCount,
        required this.googleCount,
        required this.instagramCount,
        required this.facebookCount,
        required this.twitterCount,
    });

    factory PieChartModel.fromJson(Map<String, dynamic> json) => PieChartModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
        totalCount: json["TotalCount"],
        googleCount: json["GoogleCount"],
        instagramCount: json["InstagramCount"],
        facebookCount: json["FacebookCount"],
        twitterCount: json["TwitterCount"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
        "TotalCount": totalCount,
        "GoogleCount": googleCount,
        "InstagramCount": instagramCount,
        "FacebookCount": facebookCount,
        "TwitterCount": twitterCount,
    };
}

class Title {
    String title1;
    String title2;
    String title3;
    String title4;

    Title({
        required this.title1,
        required this.title2,
        required this.title3,
        required this.title4,
    });

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        title1: json["title1"],
        title2: json["title2"],
        title3: json["title3"],
        title4: json["title4"],
    );

    Map<String, dynamic> toJson() => {
        "title1": title1,
        "title2": title2,
        "title3": title3,
        "title4": title4,
    };
}
