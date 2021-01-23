// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.status,
    this.data,
  });

  final String status;
  final Data data;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.parUser,
    this.username,
    this.code,
    this.password,
    this.type,
    this.phone,
    this.name,
    this.email,
    this.confirmEmail,
    this.address,
    this.source,
    this.zaloId,
    this.fbId,
    this.config,
    this.author,
    this.editBy,
    this.saler,
    this.is2Fa,
    this.gsecret,
    this.cdate,
    this.mdate,
    this.isactive,
  });

  final String id;
  final dynamic parUser;
  final String username;
  final String code;
  final String password;
  final String type;
  final String phone;
  final String name;
  final String email;
  final String confirmEmail;
  final String address;
  final String source;
  final dynamic zaloId;
  final dynamic fbId;
  final dynamic config;
  final dynamic author;
  final dynamic editBy;
  final dynamic saler;
  final dynamic is2Fa;
  final String gsecret;
  final String cdate;
  final String mdate;
  final String isactive;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    parUser: json["par_user"],
    username: json["username"],
    code: json["code"],
    password: json["password"],
    type: json["type"],
    phone: json["phone"],
    name: json["name"],
    email: json["email"],
    confirmEmail: json["confirm_email"],
    address: json["address"],
    source: json["source"],
    zaloId: json["zalo_id"],
    fbId: json["fb_id"],
    config: json["config"],
    author: json["author"],
    editBy: json["edit_by"],
    saler: json["saler"],
    is2Fa: json["is2fa"],
    gsecret: json["gsecret"],
    cdate: json["cdate"],
    mdate: json["mdate"],
    isactive: json["isactive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "par_user": parUser,
    "username": username,
    "code": code,
    "password": password,
    "type": type,
    "phone": phone,
    "name": name,
    "email": email,
    "confirm_email": confirmEmail,
    "address": address,
    "source": source,
    "zalo_id": zaloId,
    "fb_id": fbId,
    "config": config,
    "author": author,
    "edit_by": editBy,
    "saler": saler,
    "is2fa": is2Fa,
    "gsecret": gsecret,
    "cdate": cdate,
    "mdate": mdate,
    "isactive": isactive,
  };
}
