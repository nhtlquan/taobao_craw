// To parse this JSON data, do
//
//     final oderList = oderListFromJson(jsonString);

import 'dart:convert';

OderList oderListFromJson(String str) => OderList.fromJson(json.decode(str));

String oderListToJson(OderList data) => json.encode(data.toJson());

class OderList {
  OderList({
    this.status,
    this.mess,
    this.len,
    this.data,
  });

  final String status;
  final String mess;
  final int len;
  final List<Oder> data;

  factory OderList.fromJson(Map<String, dynamic> json) => OderList(
    status: json["status"],
    mess: json["mess"],
    len: json["len"],
    data: List<Oder>.from(json["data"].map((x) => Oder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mess": mess,
    "len": len,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Oder {
  Oder({
    this.id,
    this.parid,
    this.oid,
    this.type,
    this.shop,
    this.cusId,
    this.cusInfo,
    this.proId,
    this.proInfo,
    this.codeOrder,
    this.codeShip,
    this.sku,
    this.priceCyn,
    this.priceVn,
    this.rateSell,
    this.rateBuy,
    this.quan,
    this.weight,
    this.deposit,
    this.amount,
    this.feeWeight,
    this.feeWeightRoot,
    this.feeShip,
    this.feeService,
    this.feeInsurance,
    this.feeIncurred,
    this.totalMoney,
    this.totalMoneyFund,
    this.source,
    this.saler,
    this.processor,
    this.store,
    this.isWrong,
    this.noteWrong,
    this.notes,
    this.website,
    this.cdate,
    this.mdate,
    this.istach,
    this.ischeck,
    this.isactive,
  });

  final String id;
  final String parid;
  final String oid;
  final String type;
  final String shop;
  final String cusId;
  final CusInfo cusInfo;
  final String proId;
  final ProInfo proInfo;
  final dynamic codeOrder;
  final dynamic codeShip;
  final List<Sku> sku;
  final String priceCyn;
  final String priceVn;
  final String rateSell;
  final dynamic rateBuy;
  final String quan;
  final String weight;
  final String deposit;
  final dynamic amount;
  final String feeWeight;
  final String feeWeightRoot;
  final String feeShip;
  final String feeService;
  final String feeInsurance;
  final String feeIncurred;
  final String totalMoney;
  final dynamic totalMoneyFund;
  final String source;
  final String saler;
  final dynamic processor;
  final String store;
  final String isWrong;
  final dynamic noteWrong;
  final String notes;
  final dynamic website;
  final String cdate;
  final dynamic mdate;
  final String istach;
  final String ischeck;
  final String isactive;

  factory Oder.fromJson(Map<String, dynamic> json) => Oder(
    id: json["id"],
    parid: json["parid"] == null ? null : json["parid"],
    oid: json["oid"],
    type: json["type"],
    shop: json["shop"],
    cusId: json["cus_id"],
    cusInfo: CusInfo.fromJson(json["cus_info"]),
    proId: json["pro_id"],
    proInfo: ProInfo.fromJson(json["pro_info"]),
    codeOrder: json["code_order"],
    codeShip: json["code_ship"],
    sku: json["sku"] == null ? null : List<Sku>.from(json["sku"].map((x) => Sku.fromJson(x))),
    priceCyn: json["price_cyn"],
    priceVn: json["price_vn"],
    rateSell: json["rate_sell"],
    rateBuy: json["rate_buy"],
    quan: json["quan"],
    weight: json["weight"],
    deposit: json["deposit"],
    amount: json["amount"],
    feeWeight: json["fee_weight"],
    feeWeightRoot: json["fee_weight_root"],
    feeShip: json["fee_ship"],
    feeService: json["fee_service"],
    feeInsurance: json["fee_insurance"],
    feeIncurred: json["fee_incurred"],
    totalMoney: json["total_money"],
    totalMoneyFund: json["total_money_fund"],
    source: json["source"],
    saler: json["saler"],
    processor: json["processor"],
    store: json["store"],
    isWrong: json["is_wrong"],
    noteWrong: json["note_wrong"],
    notes: json["notes"],
    website: json["website"],
    cdate: json["cdate"],
    mdate: json["mdate"],
    istach: json["istach"],
    ischeck: json["ischeck"],
    isactive: json["isactive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parid": parid == null ? null : parid,
    "oid": oid,
    "type": type,
    "shop": shop,
    "cus_id": cusId,
    "cus_info": cusInfo.toJson(),
    "pro_id": proId,
    "pro_info": proInfo.toJson(),
    "code_order": codeOrder,
    "code_ship": codeShip,
    "sku": sku == null ? null : List<dynamic>.from(sku.map((x) => x.toJson())),
    "price_cyn": priceCyn,
    "price_vn": priceVn,
    "rate_sell": rateSell,
    "rate_buy": rateBuy,
    "quan": quan,
    "weight": weight,
    "deposit": deposit,
    "amount": amount,
    "fee_weight": feeWeight,
    "fee_weight_root": feeWeightRoot,
    "fee_ship": feeShip,
    "fee_service": feeService,
    "fee_insurance": feeInsurance,
    "fee_incurred": feeIncurred,
    "total_money": totalMoney,
    "total_money_fund": totalMoneyFund,
    "source": source,
    "saler": saler,
    "processor": processor,
    "store": store,
    "is_wrong": isWrong,
    "note_wrong": noteWrong,
    "notes": notes,
    "website": website,
    "cdate": cdate,
    "mdate": mdate,
    "istach": istach,
    "ischeck": ischeck,
    "isactive": isactive,
  };
}

class CusInfo {
  CusInfo({
    this.username,
    this.code,
    this.name,
    this.phone,
    this.addr,
  });

  final String username;
  final String code;
  final String name;
  final String phone;
  final String addr;

  factory CusInfo.fromJson(Map<String, dynamic> json) => CusInfo(
    username: json["username"],
    code: json["code"],
    name: json["name"],
    phone: json["phone"],
    addr: json["addr"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "code": code,
    "name": name,
    "phone": phone,
    "addr": addr,
  };
}

class ProInfo {
  ProInfo({
    this.link,
    this.img,
  });

  final String link;
  final String img;

  factory ProInfo.fromJson(Map<String, dynamic> json) => ProInfo(
    link: json["link"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
    "img": img,
  };
}

class Sku {
  Sku({
    this.name,
    this.idx,
  });

  final String name;
  final String idx;

  factory Sku.fromJson(Map<String, dynamic> json) => Sku(
    name: json["name"],
    idx: json["idx"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "idx": idx,
  };
}

enum Name { MU, KCH_THC }

final nameValues = EnumValues({
  "Kích thước": Name.KCH_THC,
  "Màu": Name.MU
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
