// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.mess,
    this.data,
  });

  final String status;
  final String mess;
  final List<Datum> data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"] == null ? null : json["status"],
    mess: json["mess"] == null ? null : json["mess"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "mess": mess == null ? null : mess,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.username,
    this.title,
    this.contents,
    this.isread,
    this.cdate,
  });

  final String id;
  final String username;
  final String title;
  final String contents;
  final String isread;
  final String cdate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    title: json["title"] == null ? null : json["title"],
    contents: json["contents"] == null ? null : json["contents"],
    isread: json["isread"] == null ? null : json["isread"],
    cdate: json["cdate"] == null ? null : json["cdate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "title": title == null ? null : title,
    "contents": contents == null ? null : contents,
    "isread": isread == null ? null : isread,
    "cdate": cdate == null ? null : cdate,
  };
}
