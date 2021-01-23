// To parse this JSON data, do
//
//     final itemDetail = itemDetailFromJson(jsonString);

import 'dart:convert';

ItemDetail itemDetailFromJson(String str) => ItemDetail.fromJson(json.decode(str));

String itemDetailToJson(ItemDetail data) => json.encode(data.toJson());

class ItemDetail {
  ItemDetail({
    this.dataValue,
    this.imageOrigin,
    this.img,
    this.priceOrigin,
    this.pricePromotion,
    this.property,
    this.quantity,
    this.orders,
    this.titleOrigin,
    this.nameshop,
    this.itemId,
    this.shopId,
    this.note,
    this.wangwang,
  });

  List<DataValue> dataValue;
  String imageOrigin;
  String img;
  String priceOrigin;
  String pricePromotion;
  String property;
  String color;
  String size;
  List<Property> orders;
  dynamic quantity;
  String titleOrigin;
  String link;
  String nameshop;
  String itemId;
  String shopId;
  String note;
  String wangwang;

  factory ItemDetail.fromJson(Map<String, dynamic> json) {
    var itemDetail = new ItemDetail(
      imageOrigin: json["image_origin"] == null ? null : json["image_origin"],
      img: json["image_model"] == null ? null : json["image_model"],
      priceOrigin: json["price_origin"] == null ? null : json["price_origin"],
      pricePromotion: json["price_promotion"] == null ? null : json["price_promotion"],
      property: (json["property"] != null && (json["property"] is String)) ? json["property"] : null,
      quantity: json["quantity"] == null ? null : json["quantity"],
      titleOrigin: json["title_origin"] == null ? null : json["title_origin"],
      nameshop: json["shop_name"] == null ? null : json["shop_name"],
      itemId: json["item_id"],
      shopId: json["shop_id"] == null ? null : json["shop_id"],
      wangwang: json["wangwang"] == null ? null : json["wangwang"],
      orders: List(),
    );
    if (itemDetail.property==null) {
      itemDetail.orders = List<Property>.from(json["property"].map((x) => Property.fromJson(x)));
    }
    return itemDetail;
  }

  Map<String, dynamic> toJson() => {
        "dataValue": dataValue == null ? null : List<dynamic>.from(dataValue.map((x) => x.toJson())),
        "image_origin": imageOrigin == null ? null : imageOrigin,
        "image_model": img == null ? null : img,
        "price_origin": priceOrigin == null ? null : priceOrigin,
        "price_promotion": pricePromotion == null ? null : pricePromotion,
        "quantity": quantity == null ? null : quantity,
        "title_origin": titleOrigin == null ? null : titleOrigin,
        "shop_name": nameshop == null ? null : nameshop,
        "item_id": itemId,
        "shop_id": shopId == null ? null : shopId,
        "wangwang": wangwang == null ? null : wangwang,
      };
}

class DataValue {
  DataValue({
    this.convertPrice,
    this.price,
    this.range,
  });

  String convertPrice;
  String price;
  String range;

  factory DataValue.fromJson(Map<String, dynamic> json) => DataValue(
        convertPrice: json["convertPrice"] == null ? null : json["convertPrice"],
        price: json["price"] == null ? null : json["price"],
        range: json["range"] == null ? null : json["range"],
      );

  Map<String, dynamic> toJson() => {
        "convertPrice": convertPrice == null ? null : convertPrice,
        "price": price == null ? null : price,
        "range": range == null ? null : range,
      };
}

class Property {
  Property({
    this.size,
    this.count,
    this.price,
    this.color,
  });

  String size;
  String count;
  String price;
  String color;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        size: json["size"] == null ? null : json["size"],
        count: json["count"] == null ? null : json["count"],
        price: json["price"] == null ? null : json["price"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "size": size == null ? null : size,
        "count": count == null ? null : count,
        "price": price == null ? null : price,
        "color": color == null ? null : color,
      };
}
