// To parse this JSON data, do
//
//     final configGlobal = configGlobalFromJson(jsonString);

import 'dart:convert';

ConfigGlobal configGlobalFromJson(String str) => ConfigGlobal.fromJson(json.decode(str));

String configGlobalToJson(ConfigGlobal data) => json.encode(data.toJson());

class ConfigGlobal {
  ConfigGlobal({
    this.status,
    this.mess,
    this.data,
  });

  final String status;
  final String mess;
  final Data data;

  factory ConfigGlobal.fromJson(Map<String, dynamic> json) => ConfigGlobal(
    status: json["status"],
    mess: json["mess"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mess": mess,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.orderStatus,
    this.storeList,
    this.bankList,
    this.rate,
  });

  final OrderStatus orderStatus;
  final List<String> storeList;
  final List<BankList> bankList;
  final int rate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderStatus: OrderStatus.fromJson(json["order_status"]),
    storeList: List<String>.from(json["store_list"].map((x) => x)),
    bankList: List<BankList>.from(json["bank_list"].map((x) => BankList.fromJson(x))),
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "order_status": orderStatus.toJson(),
    "store_list": List<dynamic>.from(storeList.map((x) => x)),
    "bank_list": List<dynamic>.from(bankList.map((x) => x.toJson())),
    "rate": rate,
  };
}

class BankList {
  BankList({
    this.name,
    this.stk,
    this.nh,
    this.logo,
  });

  final String name;
  final String stk;
  final String nh;
  final String logo;

  factory BankList.fromJson(Map<String, dynamic> json) => BankList(
    name: json["name"],
    stk: json["stk"],
    nh: json["nh"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "stk": stk,
    "nh": nh,
    "logo": logo,
  };
}

class OrderStatus {
  OrderStatus({
    this.the0,
    this.orderStatus1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
    this.the6,
    this.the1,
  });

  final The1 the0;
  final The1 orderStatus1;
  final The1 the2;
  final The1 the3;
  final The1 the4;
  final The1 the5;
  final The1 the6;
  final The1 the1;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    the0: The1.fromJson(json["0"]),
    orderStatus1: The1.fromJson(json["1"]),
    the2: The1.fromJson(json["2"]),
    the3: The1.fromJson(json["3"]),
    the4: The1.fromJson(json["4"]),
    the5: The1.fromJson(json["5"]),
    the6: The1.fromJson(json["6"]),
    the1: The1.fromJson(json["-1"]),
  );

  Map<String, dynamic> toJson() => {
    "0": the0.toJson(),
    "1": orderStatus1.toJson(),
    "2": the2.toJson(),
    "3": the3.toJson(),
    "4": the4.toJson(),
    "5": the5.toJson(),
    "6": the6.toJson(),
    "-1": the1.toJson(),
  };
}

class The1 {
  The1({
    this.name,
    this.color,
    this.label,
  });

  final String name;
  final String color;
  final String label;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
    name: json["name"],
    color: json["color"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
    "label": label,
  };
}
