// To parse this JSON data, do
//
//     final walletHistoryModel = walletHistoryModelFromJson(jsonString);

import 'dart:convert';

WalletHistoryModel walletHistoryModelFromJson(String str) => WalletHistoryModel.fromJson(json.decode(str));

String walletHistoryModelToJson(WalletHistoryModel data) => json.encode(data.toJson());

class WalletHistoryModel {
  WalletHistoryModel({
    this.status,
    this.mess,
    this.data,
  });

  final String status;
  final String mess;
  final List<History> data;

  factory WalletHistoryModel.fromJson(Map<String, dynamic> json) => WalletHistoryModel(
    status: json["status"],
    mess: json["mess"],
    data: List<History>.from(json["data"].map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mess": mess,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class History {
  History({
    this.id,
    this.type,
    this.cusId,
    this.oid,
    this.money,
    this.note,
    this.cdate,
    this.author,
    this.status,
  });

  final String id;
  final String type;
  final String cusId;
  final dynamic oid;
  final String money;
  final String note;
  final String cdate;
  final String author;
  final String status;

  factory History.fromJson(Map<String, dynamic> json) => History(
    id: json["id"],
    type: json["type"],
    cusId: json["cus_id"],
    oid: json["oid"],
    money: json["money"],
    note: json["note"],
    cdate: json["cdate"],
    author: json["author"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "cus_id": cusId,
    "oid": oid,
    "money": money,
    "note": note,
    "cdate": cdate,
    "author": author,
    "status": status,
  };
}
