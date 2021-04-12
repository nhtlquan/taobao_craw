// To parse this JSON data, do
//
//     final countModel = countModelFromJson(jsonString);

import 'dart:convert';

CountModel countModelFromJson(String str) => CountModel.fromJson(json.decode(str));

String countModelToJson(CountModel data) => json.encode(data.toJson());

class CountModel {
  CountModel({
    this.status,
    this.mess,
    this.data,
  });

  final String status;
  final String mess;
  final List<Datum> data;

  factory CountModel.fromJson(Map<String, dynamic> json) => CountModel(
    status: json["status"],
    mess: json["mess"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mess": mess,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.num,
    this.status,
  });

  final String num;
  final String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    num: json["num"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "num": num,
    "status": status,
  };
}
