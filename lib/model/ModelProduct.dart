// To parse this JSON data, do
//
//     final modelProduct = modelProductFromJson(jsonString);

import 'dart:convert';

ModelProduct modelProductFromJson(String str) => ModelProduct.fromJson(json.decode(str));

String modelProductToJson(ModelProduct data) => json.encode(data.toJson());

class ModelProduct {
  ModelProduct({
    this.firstScreen,
    this.seed,
    this.data,
    this.globalData,
    this.hasMoreModules,
    this.pageInfo,
    this.seedLoadedModules,
    this.seedComboUris,
    this.ssrData,
    this.modelProductClass,
    this.modules,
  });

  bool firstScreen;
  Seed seed;
  Map<String, Datum> data;
  GlobalData globalData;
  bool hasMoreModules;
  PageInfo pageInfo;
  List<String> seedLoadedModules;
  List<SeedComboUris> seedComboUris;
  SsrData ssrData;
  String modelProductClass;
  List<ModuleElement> modules;

  factory ModelProduct.fromJson(Map<String, dynamic> json) => ModelProduct(
    firstScreen: json["firstScreen"] == null ? null : json["firstScreen"],
    seed: json["seed"] == null ? null : Seed.fromJson(json["seed"]),
    data: json["data"] == null ? null : Map.from(json["data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
    globalData: json["globalData"] == null ? null : GlobalData.fromJson(json["globalData"]),
    hasMoreModules: json["hasMoreModules"] == null ? null : json["hasMoreModules"],
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    seedLoadedModules: json["seedLoadedModules"] == null ? null : List<String>.from(json["seedLoadedModules"].map((x) => x)),
    seedComboUris: json["seedComboUris"] == null ? null : List<SeedComboUris>.from(json["seedComboUris"].map((x) => SeedComboUris.fromJson(x))),
    ssrData: json["ssrData"] == null ? null : SsrData.fromJson(json["ssrData"]),
    modelProductClass: json["class"] == null ? null : json["class"],
    modules: json["modules"] == null ? null : List<ModuleElement>.from(json["modules"].map((x) => ModuleElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "firstScreen": firstScreen == null ? null : firstScreen,
    "seed": seed == null ? null : seed.toJson(),
    "data": data == null ? null : Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "globalData": globalData == null ? null : globalData.toJson(),
    "hasMoreModules": hasMoreModules == null ? null : hasMoreModules,
    "pageInfo": pageInfo == null ? null : pageInfo.toJson(),
    "seedLoadedModules": seedLoadedModules == null ? null : List<dynamic>.from(seedLoadedModules.map((x) => x)),
    "seedComboUris": seedComboUris == null ? null : List<dynamic>.from(seedComboUris.map((x) => x.toJson())),
    "ssrData": ssrData == null ? null : ssrData.toJson(),
    "class": modelProductClass == null ? null : modelProductClass,
    "modules": modules == null ? null : List<dynamic>.from(modules.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.componentType,
    this.trackInfo,
    this.data,
  });

  String componentType;
  DatumTrackInfo trackInfo;
  Data data;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    componentType: json["componentType"] == null ? null : json["componentType"],
    trackInfo: json["trackInfo"] == null ? null : DatumTrackInfo.fromJson(json["trackInfo"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "componentType": componentType == null ? null : componentType,
    "trackInfo": trackInfo == null ? null : trackInfo.toJson(),
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.isPrivacy,
    this.offerImgList,
    this.videoUrl,
    this.videoId,
    this.offerInfoModel,
    this.liveInfoModel,
    this.offerId,
    this.trackInfo,
    this.iconBtnItems,
    this.operationGap,
    this.operationRadius,
    this.operationItems,
    this.isChtOffer,
    this.winportUrl,
    this.offerUnit,
    this.userId,
    this.loginId,
    this.offerTitle,
    this.price,
    this.defaultOfferImg,
    this.saledCount,
    this.applyCouponUrl,
    this.sceneKey,
    this.postCategoryId,
    this.sellerMemberId,
    this.bizScene,
    this.isSaleOut,
    this.detailUrl,
    this.title,
    this.propsList,
    this.service1,
    this.service2,
    this.service3,
    this.serviceDetail,
    this.serviceDesc,
    this.location,
    this.logistics,
    this.priceColor,
    this.deliveryLimit,
    this.jicai,
    this.test,
    this.content,
    this.privatePrice,
    this.tagList,
    this.scrollList,
    this.selledNumber,
    this.wantBuy,
    this.sceneList,
    this.selectedScene,
    this.coord,
    this.displayType,
    this.priceModel,
    this.activityModel,
    this.marketScene,
    this.isVipPrice,
    this.isBmPrice,
    this.bigPromotion,
    this.isPrivatePrice,
    this.unit,
    this.channel,
    this.bigPromotionInfo,
  });

  bool isPrivacy;
  List<String> offerImgList;
  String videoUrl;
  int videoId;
  OfferInfoModel offerInfoModel;
  SsrData liveInfoModel;
  dynamic offerId;
  DataTrackInfo trackInfo;
  List<IconBtnItem> iconBtnItems;
  String operationGap;
  String operationRadius;
  List<OperationItem> operationItems;
  bool isChtOffer;
  String winportUrl;
  String offerUnit;
  String userId;
  String loginId;
  String offerTitle;
  String price;
  String defaultOfferImg;
  String saledCount;
  String applyCouponUrl;
  String sceneKey;
  String postCategoryId;
  String sellerMemberId;
  String bizScene;
  bool isSaleOut;
  String detailUrl;
  String title;
  List<PropsList> propsList;
  String service1;
  String service2;
  String service3;
  List<ServiceDetail> serviceDetail;
  List<ServiceDesc> serviceDesc;
  String location;
  String logistics;
  String priceColor;
  String deliveryLimit;
  String jicai;
  Test test;
  String content;
  bool privatePrice;
  List<dynamic> tagList;
  List<ScrollList> scrollList;
  String selledNumber;
  String wantBuy;
  List<SceneList> sceneList;
  SelectedScene selectedScene;
  Coord coord;
  String displayType;
  PriceModel priceModel;
  ActivityModel activityModel;
  String marketScene;
  bool isVipPrice;
  bool isBmPrice;
  bool bigPromotion;
  bool isPrivatePrice;
  String unit;
  String channel;
  BigPromotionInfo bigPromotionInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isPrivacy: json["isPrivacy"] == null ? null : json["isPrivacy"],
    offerImgList: json["offerImgList"] == null ? null : List<String>.from(json["offerImgList"].map((x) => x)),
    videoUrl: json["videoUrl"] == null ? null : json["videoUrl"],
    videoId: json["videoId"] == null ? null : json["videoId"],
    offerInfoModel: json["offerInfoModel"] == null ? null : OfferInfoModel.fromJson(json["offerInfoModel"]),
    liveInfoModel: json["liveInfoModel"] == null ? null : SsrData.fromJson(json["liveInfoModel"]),
    offerId: json["offerId"],
    trackInfo: json["trackInfo"] == null ? null : DataTrackInfo.fromJson(json["trackInfo"]),
    iconBtnItems: json["iconBtnItems"] == null ? null : List<IconBtnItem>.from(json["iconBtnItems"].map((x) => IconBtnItem.fromJson(x))),
    operationGap: json["operationGap"] == null ? null : json["operationGap"],
    operationRadius: json["operationRadius"] == null ? null : json["operationRadius"],
    operationItems: json["operationItems"] == null ? null : List<OperationItem>.from(json["operationItems"].map((x) => OperationItem.fromJson(x))),
    isChtOffer: json["isCHTOffer"] == null ? null : json["isCHTOffer"],
    winportUrl: json["winportUrl"] == null ? null : json["winportUrl"],
    offerUnit: json["offerUnit"] == null ? null : json["offerUnit"],
    userId: json["userId"] == null ? null : json["userId"],
    loginId: json["loginId"] == null ? null : json["loginId"],
    offerTitle: json["offerTitle"] == null ? null : json["offerTitle"],
    price: json["price"] == null ? null : json["price"],
    defaultOfferImg: json["defaultOfferImg"] == null ? null : json["defaultOfferImg"],
    saledCount: json["saledCount"] == null ? null : json["saledCount"],
    applyCouponUrl: json["applyCouponUrl"] == null ? null : json["applyCouponUrl"],
    sceneKey: json["sceneKey"] == null ? null : json["sceneKey"],
    postCategoryId: json["postCategoryId"] == null ? null : json["postCategoryId"],
    sellerMemberId: json["sellerMemberId"] == null ? null : json["sellerMemberId"],
    bizScene: json["bizScene"] == null ? null : json["bizScene"],
    isSaleOut: json["isSaleOut"] == null ? null : json["isSaleOut"],
    detailUrl: json["detailUrl"] == null ? null : json["detailUrl"],
    title: json["title"] == null ? null : json["title"],
    propsList: json["propsList"] == null ? null : List<PropsList>.from(json["propsList"].map((x) => PropsList.fromJson(x))),
    service1: json["service1"] == null ? null : json["service1"],
    service2: json["service2"] == null ? null : json["service2"],
    service3: json["service3"] == null ? null : json["service3"],
    serviceDetail: json["serviceDetail"] == null ? null : List<ServiceDetail>.from(json["serviceDetail"].map((x) => ServiceDetail.fromJson(x))),
    serviceDesc: json["serviceDesc"] == null ? null : List<ServiceDesc>.from(json["serviceDesc"].map((x) => ServiceDesc.fromJson(x))),
    location: json["location"] == null ? null : json["location"],
    logistics: json["logistics"] == null ? null : json["logistics"],
    priceColor: json["priceColor"] == null ? null : json["priceColor"],
    deliveryLimit: json["deliveryLimit"] == null ? null : json["deliveryLimit"],
    jicai: json["jicai"] == null ? null : json["jicai"],
    test: json["test"] == null ? null : Test.fromJson(json["test"]),
    content: json["content"] == null ? null : json["content"],
    privatePrice: json["privatePrice"] == null ? null : json["privatePrice"],
    tagList: json["tagList"] == null ? null : List<dynamic>.from(json["tagList"].map((x) => x)),
    scrollList: json["scrollList"] == null ? null : List<ScrollList>.from(json["scrollList"].map((x) => ScrollList.fromJson(x))),
    selledNumber: json["selledNumber"] == null ? null : json["selledNumber"],
    wantBuy: json["wantBuy"] == null ? null : json["wantBuy"],
    sceneList: json["sceneList"] == null ? null : List<SceneList>.from(json["sceneList"].map((x) => SceneList.fromJson(x))),
    selectedScene: json["selectedScene"] == null ? null : SelectedScene.fromJson(json["selectedScene"]),
    coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
    displayType: json["displayType"] == null ? null : json["displayType"],
    priceModel: json["priceModel"] == null ? null : PriceModel.fromJson(json["priceModel"]),
    activityModel: json["activityModel"] == null ? null : ActivityModel.fromJson(json["activityModel"]),
    marketScene: json["marketScene"] == null ? null : json["marketScene"],
    isVipPrice: json["isVipPrice"] == null ? null : json["isVipPrice"],
    isBmPrice: json["isBmPrice"] == null ? null : json["isBmPrice"],
    bigPromotion: json["bigPromotion"] == null ? null : json["bigPromotion"],
    isPrivatePrice: json["isPrivatePrice"] == null ? null : json["isPrivatePrice"],
    unit: json["unit"] == null ? null : json["unit"],
    channel: json["channel"] == null ? null : json["channel"],
    bigPromotionInfo: json["bigPromotionInfo"] == null ? null : BigPromotionInfo.fromJson(json["bigPromotionInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "isPrivacy": isPrivacy == null ? null : isPrivacy,
    "offerImgList": offerImgList == null ? null : List<dynamic>.from(offerImgList.map((x) => x)),
    "videoUrl": videoUrl == null ? null : videoUrl,
    "videoId": videoId == null ? null : videoId,
    "offerInfoModel": offerInfoModel == null ? null : offerInfoModel.toJson(),
    "liveInfoModel": liveInfoModel == null ? null : liveInfoModel.toJson(),
    "offerId": offerId,
    "trackInfo": trackInfo == null ? null : trackInfo.toJson(),
    "iconBtnItems": iconBtnItems == null ? null : List<dynamic>.from(iconBtnItems.map((x) => x.toJson())),
    "operationGap": operationGap == null ? null : operationGap,
    "operationRadius": operationRadius == null ? null : operationRadius,
    "operationItems": operationItems == null ? null : List<dynamic>.from(operationItems.map((x) => x.toJson())),
    "isCHTOffer": isChtOffer == null ? null : isChtOffer,
    "winportUrl": winportUrl == null ? null : winportUrl,
    "offerUnit": offerUnit == null ? null : offerUnit,
    "userId": userId == null ? null : userId,
    "loginId": loginId == null ? null : loginId,
    "offerTitle": offerTitle == null ? null : offerTitle,
    "price": price == null ? null : price,
    "defaultOfferImg": defaultOfferImg == null ? null : defaultOfferImg,
    "saledCount": saledCount == null ? null : saledCount,
    "applyCouponUrl": applyCouponUrl == null ? null : applyCouponUrl,
    "sceneKey": sceneKey == null ? null : sceneKey,
    "postCategoryId": postCategoryId == null ? null : postCategoryId,
    "sellerMemberId": sellerMemberId == null ? null : sellerMemberId,
    "bizScene": bizScene == null ? null : bizScene,
    "isSaleOut": isSaleOut == null ? null : isSaleOut,
    "detailUrl": detailUrl == null ? null : detailUrl,
    "title": title == null ? null : title,
    "propsList": propsList == null ? null : List<dynamic>.from(propsList.map((x) => x.toJson())),
    "service1": service1 == null ? null : service1,
    "service2": service2 == null ? null : service2,
    "service3": service3 == null ? null : service3,
    "serviceDetail": serviceDetail == null ? null : List<dynamic>.from(serviceDetail.map((x) => x.toJson())),
    "serviceDesc": serviceDesc == null ? null : List<dynamic>.from(serviceDesc.map((x) => x.toJson())),
    "location": location == null ? null : location,
    "logistics": logistics == null ? null : logistics,
    "priceColor": priceColor == null ? null : priceColor,
    "deliveryLimit": deliveryLimit == null ? null : deliveryLimit,
    "jicai": jicai == null ? null : jicai,
    "test": test == null ? null : test.toJson(),
    "content": content == null ? null : content,
    "privatePrice": privatePrice == null ? null : privatePrice,
    "tagList": tagList == null ? null : List<dynamic>.from(tagList.map((x) => x)),
    "scrollList": scrollList == null ? null : List<dynamic>.from(scrollList.map((x) => x.toJson())),
    "selledNumber": selledNumber == null ? null : selledNumber,
    "wantBuy": wantBuy == null ? null : wantBuy,
    "sceneList": sceneList == null ? null : List<dynamic>.from(sceneList.map((x) => x.toJson())),
    "selectedScene": selectedScene == null ? null : selectedScene.toJson(),
    "coord": coord == null ? null : coord.toJson(),
    "displayType": displayType == null ? null : displayType,
    "priceModel": priceModel == null ? null : priceModel.toJson(),
    "activityModel": activityModel == null ? null : activityModel.toJson(),
    "marketScene": marketScene == null ? null : marketScene,
    "isVipPrice": isVipPrice == null ? null : isVipPrice,
    "isBmPrice": isBmPrice == null ? null : isBmPrice,
    "bigPromotion": bigPromotion == null ? null : bigPromotion,
    "isPrivatePrice": isPrivatePrice == null ? null : isPrivatePrice,
    "unit": unit == null ? null : unit,
    "channel": channel == null ? null : channel,
    "bigPromotionInfo": bigPromotionInfo == null ? null : bigPromotionInfo.toJson(),
  };
}

class ActivityModel {
  ActivityModel({
    this.activityId,
    this.activityUrl,
    this.activityName,
    this.countdown,
    this.beforePro,
    this.activityType,
  });

  String activityId;
  String activityUrl;
  String activityName;
  String countdown;
  bool beforePro;
  String activityType;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    activityId: json["activityId"] == null ? null : json["activityId"],
    activityUrl: json["activityUrl"] == null ? null : json["activityUrl"],
    activityName: json["activityName"] == null ? null : json["activityName"],
    countdown: json["countdown"] == null ? null : json["countdown"],
    beforePro: json["beforePro"] == null ? null : json["beforePro"],
    activityType: json["activityType"] == null ? null : json["activityType"],
  );

  Map<String, dynamic> toJson() => {
    "activityId": activityId == null ? null : activityId,
    "activityUrl": activityUrl == null ? null : activityUrl,
    "activityName": activityName == null ? null : activityName,
    "countdown": countdown == null ? null : countdown,
    "beforePro": beforePro == null ? null : beforePro,
    "activityType": activityType == null ? null : activityType,
  };
}

class BigPromotionInfo {
  BigPromotionInfo({
    this.bigPromotionCountdown,
    this.preheatTime,
    this.burstEndTime,
    this.bigPromotionStatus,
    this.burstBeginTime,
  });

  int bigPromotionCountdown;
  int preheatTime;
  int burstEndTime;
  String bigPromotionStatus;
  int burstBeginTime;

  factory BigPromotionInfo.fromJson(Map<String, dynamic> json) => BigPromotionInfo(
    bigPromotionCountdown: json["bigPromotionCountdown"] == null ? null : json["bigPromotionCountdown"],
    preheatTime: json["preheatTime"] == null ? null : json["preheatTime"],
    burstEndTime: json["burstEndTime"] == null ? null : json["burstEndTime"],
    bigPromotionStatus: json["bigPromotionStatus"] == null ? null : json["bigPromotionStatus"],
    burstBeginTime: json["burstBeginTime"] == null ? null : json["burstBeginTime"],
  );

  Map<String, dynamic> toJson() => {
    "bigPromotionCountdown": bigPromotionCountdown == null ? null : bigPromotionCountdown,
    "preheatTime": preheatTime == null ? null : preheatTime,
    "burstEndTime": burstEndTime == null ? null : burstEndTime,
    "bigPromotionStatus": bigPromotionStatus == null ? null : bigPromotionStatus,
    "burstBeginTime": burstBeginTime == null ? null : burstBeginTime,
  };
}

class Coord {
  Coord({
    this.atmosphere,
    this.useCase,
    this.role,
    this.business,
    this.channel,
    this.scene,
  });

  String atmosphere;
  String useCase;
  String role;
  String business;
  String channel;
  String scene;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    atmosphere: json["atmosphere"] == null ? null : json["atmosphere"],
    useCase: json["useCase"] == null ? null : json["useCase"],
    role: json["role"] == null ? null : json["role"],
    business: json["business"] == null ? null : json["business"],
    channel: json["channel"] == null ? null : json["channel"],
    scene: json["scene"] == null ? null : json["scene"],
  );

  Map<String, dynamic> toJson() => {
    "atmosphere": atmosphere == null ? null : atmosphere,
    "useCase": useCase == null ? null : useCase,
    "role": role == null ? null : role,
    "business": business == null ? null : business,
    "channel": channel == null ? null : channel,
    "scene": scene == null ? null : scene,
  };
}

class IconBtnItem {
  IconBtnItem({
    this.type,
    this.icon,
    this.displayType,
    this.link,
    this.selectedIcon,
  });

  String type;
  String icon;
  String displayType;
  String link;
  String selectedIcon;

  factory IconBtnItem.fromJson(Map<String, dynamic> json) => IconBtnItem(
    type: json["type"] == null ? null : json["type"],
    icon: json["icon"] == null ? null : json["icon"],
    displayType: json["displayType"] == null ? null : json["displayType"],
    link: json["link"] == null ? null : json["link"],
    selectedIcon: json["selectedIcon"] == null ? null : json["selectedIcon"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "icon": icon == null ? null : icon,
    "displayType": displayType == null ? null : displayType,
    "link": link == null ? null : link,
    "selectedIcon": selectedIcon == null ? null : selectedIcon,
  };
}

class SsrData {
  SsrData();

  factory SsrData.fromJson(Map<String, dynamic> json) => SsrData(
  );

  Map<String, dynamic> toJson() => {
  };
}

class OfferInfoModel {
  OfferInfoModel({
    this.offerId,
    this.price,
    this.title,
    this.isFav,
  });

  int offerId;
  String price;
  String title;
  bool isFav;

  factory OfferInfoModel.fromJson(Map<String, dynamic> json) => OfferInfoModel(
    offerId: json["offerId"] == null ? null : json["offerId"],
    price: json["price"] == null ? null : json["price"],
    title: json["title"] == null ? null : json["title"],
    isFav: json["isFav"] == null ? null : json["isFav"],
  );

  Map<String, dynamic> toJson() => {
    "offerId": offerId == null ? null : offerId,
    "price": price == null ? null : price,
    "title": title == null ? null : title,
    "isFav": isFav == null ? null : isFav,
  };
}

class OperationItem {
  OperationItem({
    this.type,
    this.dtype,
    this.isGrey,
    this.prefixFontSize,
    this.tempBackColor,
    this.data,
    this.name,
    this.nameFontSize,
    this.subNameFontSize,
    this.wapNameFontSize,
    this.wapSubNameFontSize,
    this.radius,
    this.textColor,
    this.backColor,
  });

  String type;
  String dtype;
  bool isGrey;
  int prefixFontSize;
  String tempBackColor;
  SsrData data;
  String name;
  int nameFontSize;
  int subNameFontSize;
  int wapNameFontSize;
  int wapSubNameFontSize;
  String radius;
  String textColor;
  String backColor;

  factory OperationItem.fromJson(Map<String, dynamic> json) => OperationItem(
    type: json["type"] == null ? null : json["type"],
    dtype: json["dtype"] == null ? null : json["dtype"],
    isGrey: json["isGrey"] == null ? null : json["isGrey"],
    prefixFontSize: json["prefixFontSize"] == null ? null : json["prefixFontSize"],
    tempBackColor: json["tempBackColor"] == null ? null : json["tempBackColor"],
    data: json["data"] == null ? null : SsrData.fromJson(json["data"]),
    name: json["name"] == null ? null : json["name"],
    nameFontSize: json["nameFontSize"] == null ? null : json["nameFontSize"],
    subNameFontSize: json["subNameFontSize"] == null ? null : json["subNameFontSize"],
    wapNameFontSize: json["wapNameFontSize"] == null ? null : json["wapNameFontSize"],
    wapSubNameFontSize: json["wapSubNameFontSize"] == null ? null : json["wapSubNameFontSize"],
    radius: json["radius"] == null ? null : json["radius"],
    textColor: json["textColor"] == null ? null : json["textColor"],
    backColor: json["backColor"] == null ? null : json["backColor"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "dtype": dtype == null ? null : dtype,
    "isGrey": isGrey == null ? null : isGrey,
    "prefixFontSize": prefixFontSize == null ? null : prefixFontSize,
    "tempBackColor": tempBackColor == null ? null : tempBackColor,
    "data": data == null ? null : data.toJson(),
    "name": name == null ? null : name,
    "nameFontSize": nameFontSize == null ? null : nameFontSize,
    "subNameFontSize": subNameFontSize == null ? null : subNameFontSize,
    "wapNameFontSize": wapNameFontSize == null ? null : wapNameFontSize,
    "wapSubNameFontSize": wapSubNameFontSize == null ? null : wapSubNameFontSize,
    "radius": radius == null ? null : radius,
    "textColor": textColor == null ? null : textColor,
    "backColor": backColor == null ? null : backColor,
  };
}

class PriceModel {
  PriceModel({
    this.originalPrices,
    this.currentPrices,
    this.priceDisplayType,
  });

  List<Price> originalPrices;
  List<Price> currentPrices;
  String priceDisplayType;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
    originalPrices: json["originalPrices"] == null ? null : List<Price>.from(json["originalPrices"].map((x) => Price.fromJson(x))),
    currentPrices: json["currentPrices"] == null ? null : List<Price>.from(json["currentPrices"].map((x) => Price.fromJson(x))),
    priceDisplayType: json["priceDisplayType"] == null ? null : json["priceDisplayType"],
  );

  Map<String, dynamic> toJson() => {
    "originalPrices": originalPrices == null ? null : List<dynamic>.from(originalPrices.map((x) => x.toJson())),
    "currentPrices": currentPrices == null ? null : List<dynamic>.from(currentPrices.map((x) => x.toJson())),
    "priceDisplayType": priceDisplayType == null ? null : priceDisplayType,
  };
}

class Price {
  Price({
    this.price,
    this.beginAmount,
  });

  String price;
  String beginAmount;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    price: json["price"] == null ? null : json["price"],
    beginAmount: json["beginAmount"] == null ? null : json["beginAmount"],
  );

  Map<String, dynamic> toJson() => {
    "price": price == null ? null : price,
    "beginAmount": beginAmount == null ? null : beginAmount,
  };
}

class PropsList {
  PropsList({
    this.name,
    this.value,
  });

  String name;
  String value;

  factory PropsList.fromJson(Map<String, dynamic> json) => PropsList(
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "value": value == null ? null : value,
  };
}

class SceneList {
  SceneList({
    this.sceneKey,
    this.sceneName,
    this.wapUrl,
  });

  String sceneKey;
  String sceneName;
  String wapUrl;

  factory SceneList.fromJson(Map<String, dynamic> json) => SceneList(
    sceneKey: json["sceneKey"] == null ? null : json["sceneKey"],
    sceneName: json["sceneName"] == null ? null : json["sceneName"],
    wapUrl: json["wapUrl"] == null ? null : json["wapUrl"],
  );

  Map<String, dynamic> toJson() => {
    "sceneKey": sceneKey == null ? null : sceneKey,
    "sceneName": sceneName == null ? null : sceneName,
    "wapUrl": wapUrl == null ? null : wapUrl,
  };
}

class ScrollList {
  ScrollList({
    this.prefix,
    this.text,
    this.textColor,
    this.icon,
    this.suffix,
    this.highLightTextColor,
  });

  String prefix;
  String text;
  String textColor;
  String icon;
  String suffix;
  String highLightTextColor;

  factory ScrollList.fromJson(Map<String, dynamic> json) => ScrollList(
    prefix: json["prefix"] == null ? null : json["prefix"],
    text: json["text"] == null ? null : json["text"],
    textColor: json["textColor"] == null ? null : json["textColor"],
    icon: json["icon"] == null ? null : json["icon"],
    suffix: json["suffix"] == null ? null : json["suffix"],
    highLightTextColor: json["highLightTextColor"] == null ? null : json["highLightTextColor"],
  );

  Map<String, dynamic> toJson() => {
    "prefix": prefix == null ? null : prefix,
    "text": text == null ? null : text,
    "textColor": textColor == null ? null : textColor,
    "icon": icon == null ? null : icon,
    "suffix": suffix == null ? null : suffix,
    "highLightTextColor": highLightTextColor == null ? null : highLightTextColor,
  };
}

class SelectedScene {
  SelectedScene({
    this.sceneKey,
    this.sceneName,
  });

  String sceneKey;
  String sceneName;

  factory SelectedScene.fromJson(Map<String, dynamic> json) => SelectedScene(
    sceneKey: json["sceneKey"] == null ? null : json["sceneKey"],
    sceneName: json["sceneName"] == null ? null : json["sceneName"],
  );

  Map<String, dynamic> toJson() => {
    "sceneKey": sceneKey == null ? null : sceneKey,
    "sceneName": sceneName == null ? null : sceneName,
  };
}

class ServiceDesc {
  ServiceDesc({
    this.serviceName,
    this.textColor,
  });

  String serviceName;
  String textColor;

  factory ServiceDesc.fromJson(Map<String, dynamic> json) => ServiceDesc(
    serviceName: json["serviceName"] == null ? null : json["serviceName"],
    textColor: json["textColor"] == null ? null : json["textColor"],
  );

  Map<String, dynamic> toJson() => {
    "serviceName": serviceName == null ? null : serviceName,
    "textColor": textColor == null ? null : textColor,
  };
}

class ServiceDetail {
  ServiceDetail({
    this.serviceName,
    this.description,
  });

  String serviceName;
  String description;

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
    serviceName: json["serviceName"] == null ? null : json["serviceName"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "serviceName": serviceName == null ? null : serviceName,
    "description": description == null ? null : description,
  };
}

class Test {
  Test({
    this.subTemplateId,
    this.deliveryFee,
    this.freeDeliverFee,
    this.location,
    this.totalCost,
  });

  int subTemplateId;
  DeliveryFee deliveryFee;
  bool freeDeliverFee;
  String location;
  double totalCost;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    subTemplateId: json["subTemplateId"] == null ? null : json["subTemplateId"],
    deliveryFee: json["deliveryFee"] == null ? null : DeliveryFee.fromJson(json["deliveryFee"]),
    freeDeliverFee: json["freeDeliverFee"] == null ? null : json["freeDeliverFee"],
    location: json["location"] == null ? null : json["location"],
    totalCost: json["totalCost"] == null ? null : json["totalCost"],
  );

  Map<String, dynamic> toJson() => {
    "subTemplateId": subTemplateId == null ? null : subTemplateId,
    "deliveryFee": deliveryFee == null ? null : deliveryFee.toJson(),
    "freeDeliverFee": freeDeliverFee == null ? null : freeDeliverFee,
    "location": location == null ? null : location,
    "totalCost": totalCost == null ? null : totalCost,
  };
}

class DeliveryFee {
  DeliveryFee({
    this.name,
  });

  String name;

  factory DeliveryFee.fromJson(Map<String, dynamic> json) => DeliveryFee(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };
}

class DataTrackInfo {
  DataTrackInfo({
    this.expoData,
    this.uiTrackInfo,
    this.trackInfoClass,
  });

  String expoData;
  PurpleUiTrackInfo uiTrackInfo;
  String trackInfoClass;

  factory DataTrackInfo.fromJson(Map<String, dynamic> json) => DataTrackInfo(
    expoData: json["expoData"] == null ? null : json["expoData"],
    uiTrackInfo: json["uiTrackInfo"] == null ? null : PurpleUiTrackInfo.fromJson(json["uiTrackInfo"]),
    trackInfoClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "expoData": expoData == null ? null : expoData,
    "uiTrackInfo": uiTrackInfo == null ? null : uiTrackInfo.toJson(),
    "class": trackInfoClass == null ? null : trackInfoClass,
  };
}

class PurpleUiTrackInfo {
  PurpleUiTrackInfo({
    this.videoPlay,
    this.odLiveClick,
  });

  VideoPlay videoPlay;
  OdLiveClick odLiveClick;

  factory PurpleUiTrackInfo.fromJson(Map<String, dynamic> json) => PurpleUiTrackInfo(
    videoPlay: json["videoPlay"] == null ? null : VideoPlay.fromJson(json["videoPlay"]),
    odLiveClick: json["od_live_click"] == null ? null : OdLiveClick.fromJson(json["od_live_click"]),
  );

  Map<String, dynamic> toJson() => {
    "videoPlay": videoPlay == null ? null : videoPlay.toJson(),
    "od_live_click": odLiveClick == null ? null : odLiveClick.toJson(),
  };
}

class OdLiveClick {
  OdLiveClick({
    this.args,
    this.odLiveClickClass,
  });

  OdLiveClickArgs args;
  String odLiveClickClass;

  factory OdLiveClick.fromJson(Map<String, dynamic> json) => OdLiveClick(
    args: json["args"] == null ? null : OdLiveClickArgs.fromJson(json["args"]),
    odLiveClickClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "args": args == null ? null : args.toJson(),
    "class": odLiveClickClass == null ? null : odLiveClickClass,
  };
}

class OdLiveClickArgs {
  OdLiveClickArgs({
    this.offerId,
  });

  String offerId;

  factory OdLiveClickArgs.fromJson(Map<String, dynamic> json) => OdLiveClickArgs(
    offerId: json["offerId"] == null ? null : json["offerId"],
  );

  Map<String, dynamic> toJson() => {
    "offerId": offerId == null ? null : offerId,
  };
}

class VideoPlay {
  VideoPlay({
    this.args,
    this.videoPlayClass,
  });

  VideoPlayArgs args;
  String videoPlayClass;

  factory VideoPlay.fromJson(Map<String, dynamic> json) => VideoPlay(
    args: json["args"] == null ? null : VideoPlayArgs.fromJson(json["args"]),
    videoPlayClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "args": args == null ? null : args.toJson(),
    "class": videoPlayClass == null ? null : videoPlayClass,
  };
}

class VideoPlayArgs {
  VideoPlayArgs({
    this.bizScene,
    this.offerId,
    this.videoId,
    this.fromSource,
    this.expoData,
  });

  String bizScene;
  String offerId;
  String videoId;
  String fromSource;
  String expoData;

  factory VideoPlayArgs.fromJson(Map<String, dynamic> json) => VideoPlayArgs(
    bizScene: json["bizScene"] == null ? null : json["bizScene"],
    offerId: json["offerId"] == null ? null : json["offerId"],
    videoId: json["videoId"] == null ? null : json["videoId"],
    fromSource: json["fromSource"] == null ? null : json["fromSource"],
    expoData: json["expoData"] == null ? null : json["expoData"],
  );

  Map<String, dynamic> toJson() => {
    "bizScene": bizScene == null ? null : bizScene,
    "offerId": offerId == null ? null : offerId,
    "videoId": videoId == null ? null : videoId,
    "fromSource": fromSource == null ? null : fromSource,
    "expoData": expoData == null ? null : expoData,
  };
}

class DatumTrackInfo {
  DatumTrackInfo({
    this.expoData,
    this.uiTrackInfo,
    this.trackInfoClass,
  });

  String expoData;
  FluffyUiTrackInfo uiTrackInfo;
  String trackInfoClass;

  factory DatumTrackInfo.fromJson(Map<String, dynamic> json) => DatumTrackInfo(
    expoData: json["expoData"] == null ? null : json["expoData"],
    uiTrackInfo: json["uiTrackInfo"] == null ? null : FluffyUiTrackInfo.fromJson(json["uiTrackInfo"]),
    trackInfoClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "expoData": expoData == null ? null : expoData,
    "uiTrackInfo": uiTrackInfo == null ? null : uiTrackInfo.toJson(),
    "class": trackInfoClass == null ? null : trackInfoClass,
  };
}

class FluffyUiTrackInfo {
  FluffyUiTrackInfo({
    this.videoPlay,
    this.odLiveClick,
    this.attrClick,
    this.serviceClick,
  });

  VideoPlay videoPlay;
  OdLiveClick odLiveClick;
  Click attrClick;
  Click serviceClick;

  factory FluffyUiTrackInfo.fromJson(Map<String, dynamic> json) => FluffyUiTrackInfo(
    videoPlay: json["videoPlay"] == null ? null : VideoPlay.fromJson(json["videoPlay"]),
    odLiveClick: json["od_live_click"] == null ? null : OdLiveClick.fromJson(json["od_live_click"]),
    attrClick: json["attrClick"] == null ? null : Click.fromJson(json["attrClick"]),
    serviceClick: json["serviceClick"] == null ? null : Click.fromJson(json["serviceClick"]),
  );

  Map<String, dynamic> toJson() => {
    "videoPlay": videoPlay == null ? null : videoPlay.toJson(),
    "od_live_click": odLiveClick == null ? null : odLiveClick.toJson(),
    "attrClick": attrClick == null ? null : attrClick.toJson(),
    "serviceClick": serviceClick == null ? null : serviceClick.toJson(),
  };
}

class Click {
  Click({
    this.args,
    this.clickClass,
  });

  SsrData args;
  String clickClass;

  factory Click.fromJson(Map<String, dynamic> json) => Click(
    args: json["args"] == null ? null : SsrData.fromJson(json["args"]),
    clickClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "args": args == null ? null : args.toJson(),
    "class": clickClass == null ? null : clickClass,
  };
}

class GlobalData {
  GlobalData({
    this.componentType,
    this.marketScene,
    this.images,
    this.tempModel,
    this.offerModelSign,
    this.topBarModel,
    this.shareModel,
    this.mixModel,
    this.channelType,
    this.hasConsignReation,
    this.isPicPrivate,
    this.supportPuhuo,
    this.isPricePrivate,
    this.orderParamModel,
    this.skuModel,
    this.detailModel,
    this.offerBaseInfo,
    this.sellerSign,
    this.canIgnoreConsignRelation,
    this.businessType,
  });

  String componentType;
  String marketScene;
  List<ImageModel> images;
  TempModel tempModel;
  Map<String, bool> offerModelSign;
  TopBarModel topBarModel;
  ShareModel shareModel;
  MixModel mixModel;
  String channelType;
  bool hasConsignReation;
  bool isPicPrivate;
  bool supportPuhuo;
  bool isPricePrivate;
  OrderParamModel orderParamModel;
  SkuModel skuModel;
  DetailModel detailModel;
  OfferBaseInfo offerBaseInfo;
  SellerSign sellerSign;
  bool canIgnoreConsignRelation;
  String businessType;

  factory GlobalData.fromJson(Map<String, dynamic> json) => GlobalData(
    componentType: json["componentType"] == null ? null : json["componentType"],
    marketScene: json["marketScene"] == null ? null : json["marketScene"],
    images: json["images"] == null ? null : List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
    tempModel: json["tempModel"] == null ? null : TempModel.fromJson(json["tempModel"]),
    offerModelSign: json["offerModelSign"] == null ? null : Map.from(json["offerModelSign"]).map((k, v) => MapEntry<String, bool>(k, v)),
    topBarModel: json["topBarModel"] == null ? null : TopBarModel.fromJson(json["topBarModel"]),
    shareModel: json["shareModel"] == null ? null : ShareModel.fromJson(json["shareModel"]),
    mixModel: json["mixModel"] == null ? null : MixModel.fromJson(json["mixModel"]),
    channelType: json["channelType"] == null ? null : json["channelType"],
    hasConsignReation: json["hasConsignReation"] == null ? null : json["hasConsignReation"],
    isPicPrivate: json["isPicPrivate"] == null ? null : json["isPicPrivate"],
    supportPuhuo: json["supportPuhuo"] == null ? null : json["supportPuhuo"],
    isPricePrivate: json["isPricePrivate"] == null ? null : json["isPricePrivate"],
    orderParamModel: json["orderParamModel"] == null ? null : OrderParamModel.fromJson(json["orderParamModel"]),
    skuModel: json["skuModel"] == null ? null : SkuModel.fromJson(json["skuModel"]),
    detailModel: json["detailModel"] == null ? null : DetailModel.fromJson(json["detailModel"]),
    offerBaseInfo: json["offerBaseInfo"] == null ? null : OfferBaseInfo.fromJson(json["offerBaseInfo"]),
    sellerSign: json["sellerSign"] == null ? null : SellerSign.fromJson(json["sellerSign"]),
    canIgnoreConsignRelation: json["canIgnoreConsignRelation"] == null ? null : json["canIgnoreConsignRelation"],
    businessType: json["businessType"] == null ? null : json["businessType"],
  );

  Map<String, dynamic> toJson() => {
    "componentType": componentType == null ? null : componentType,
    "marketScene": marketScene == null ? null : marketScene,
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
    "tempModel": tempModel == null ? null : tempModel.toJson(),
    "offerModelSign": offerModelSign == null ? null : Map.from(offerModelSign).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "topBarModel": topBarModel == null ? null : topBarModel.toJson(),
    "shareModel": shareModel == null ? null : shareModel.toJson(),
    "mixModel": mixModel == null ? null : mixModel.toJson(),
    "channelType": channelType == null ? null : channelType,
    "hasConsignReation": hasConsignReation == null ? null : hasConsignReation,
    "isPicPrivate": isPicPrivate == null ? null : isPicPrivate,
    "supportPuhuo": supportPuhuo == null ? null : supportPuhuo,
    "isPricePrivate": isPricePrivate == null ? null : isPricePrivate,
    "orderParamModel": orderParamModel == null ? null : orderParamModel.toJson(),
    "skuModel": skuModel == null ? null : skuModel.toJson(),
    "detailModel": detailModel == null ? null : detailModel.toJson(),
    "offerBaseInfo": offerBaseInfo == null ? null : offerBaseInfo.toJson(),
    "sellerSign": sellerSign == null ? null : sellerSign.toJson(),
    "canIgnoreConsignRelation": canIgnoreConsignRelation == null ? null : canIgnoreConsignRelation,
    "businessType": businessType == null ? null : businessType,
  };
}

class DetailModel {
  DetailModel({
    this.offerId,
    this.detailUrl,
  });

  String offerId;
  String detailUrl;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    offerId: json["offerId"] == null ? null : json["offerId"],
    detailUrl: json["detailUrl"] == null ? null : json["detailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "offerId": offerId == null ? null : offerId,
    "detailUrl": detailUrl == null ? null : detailUrl,
  };
}

class ImageModel {
  ImageModel({
    this.size220X220ImageUri,
    this.imageUri,
    this.searchImageUri,
    this.summImageUri,
    this.size310X310ImageUri,
    this.fullPathImageUri,
  });

  String size220X220ImageUri;
  String imageUri;
  String searchImageUri;
  String summImageUri;
  String size310X310ImageUri;
  String fullPathImageUri;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    size220X220ImageUri: json["size220x220ImageURI"] == null ? null : json["size220x220ImageURI"],
    imageUri: json["imageURI"] == null ? null : json["imageURI"],
    searchImageUri: json["searchImageURI"] == null ? null : json["searchImageURI"],
    summImageUri: json["summImageURI"] == null ? null : json["summImageURI"],
    size310X310ImageUri: json["size310x310ImageURI"] == null ? null : json["size310x310ImageURI"],
    fullPathImageUri: json["fullPathImageURI"] == null ? null : json["fullPathImageURI"],
  );

  Map<String, dynamic> toJson() => {
    "size220x220ImageURI": size220X220ImageUri == null ? null : size220X220ImageUri,
    "imageURI": imageUri == null ? null : imageUri,
    "searchImageURI": searchImageUri == null ? null : searchImageUri,
    "summImageURI": summImageUri == null ? null : summImageUri,
    "size310x310ImageURI": size310X310ImageUri == null ? null : size310X310ImageUri,
    "fullPathImageURI": fullPathImageUri == null ? null : fullPathImageUri,
  };
}

class MixModel {
  MixModel({
    this.isSupportMix,
  });

  bool isSupportMix;

  factory MixModel.fromJson(Map<String, dynamic> json) => MixModel(
    isSupportMix: json["isSupportMix"] == null ? null : json["isSupportMix"],
  );

  Map<String, dynamic> toJson() => {
    "isSupportMix": isSupportMix == null ? null : isSupportMix,
  };
}

class OfferBaseInfo {
  OfferBaseInfo({
    this.appVersion,
    this.offerId,
    this.bizScene,
    this.loginUserId,
    this.sellerUserId,
    this.sellerLoginId,
    this.appKey,
    this.sellerMemberId,
    this.fromScene,
    this.deviceId,
  });

  String appVersion;
  int offerId;
  String bizScene;
  int loginUserId;
  int sellerUserId;
  String sellerLoginId;
  String appKey;
  String sellerMemberId;
  String fromScene;
  String deviceId;

  factory OfferBaseInfo.fromJson(Map<String, dynamic> json) => OfferBaseInfo(
    appVersion: json["appVersion"] == null ? null : json["appVersion"],
    offerId: json["offerId"] == null ? null : json["offerId"],
    bizScene: json["bizScene"] == null ? null : json["bizScene"],
    loginUserId: json["loginUserId"] == null ? null : json["loginUserId"],
    sellerUserId: json["sellerUserId"] == null ? null : json["sellerUserId"],
    sellerLoginId: json["sellerLoginId"] == null ? null : json["sellerLoginId"],
    appKey: json["appKey"] == null ? null : json["appKey"],
    sellerMemberId: json["sellerMemberId"] == null ? null : json["sellerMemberId"],
    fromScene: json["fromScene"] == null ? null : json["fromScene"],
    deviceId: json["deviceId"] == null ? null : json["deviceId"],
  );

  Map<String, dynamic> toJson() => {
    "appVersion": appVersion == null ? null : appVersion,
    "offerId": offerId == null ? null : offerId,
    "bizScene": bizScene == null ? null : bizScene,
    "loginUserId": loginUserId == null ? null : loginUserId,
    "sellerUserId": sellerUserId == null ? null : sellerUserId,
    "sellerLoginId": sellerLoginId == null ? null : sellerLoginId,
    "appKey": appKey == null ? null : appKey,
    "sellerMemberId": sellerMemberId == null ? null : sellerMemberId,
    "fromScene": fromScene == null ? null : fromScene,
    "deviceId": deviceId == null ? null : deviceId,
  };
}

class OrderParamModel {
  OrderParamModel({
    this.orderParam,
  });

  OrderParam orderParam;

  factory OrderParamModel.fromJson(Map<String, dynamic> json) => OrderParamModel(
    orderParam: json["orderParam"] == null ? null : OrderParam.fromJson(json["orderParam"]),
  );

  Map<String, dynamic> toJson() => {
    "orderParam": orderParam == null ? null : orderParam.toJson(),
  };
}

class OrderParam {
  OrderParam({
    this.canBookedAmount,
    this.skuParam,
    this.limitParam,
    this.addCartParam,
    this.beginNum,
    this.saledCount,
    this.flow,
  });

  int canBookedAmount;
  SkuParam skuParam;
  SsrData limitParam;
  AddCartParam addCartParam;
  int beginNum;
  int saledCount;
  String flow;

  factory OrderParam.fromJson(Map<String, dynamic> json) => OrderParam(
    canBookedAmount: json["canBookedAmount"] == null ? null : json["canBookedAmount"],
    skuParam: json["skuParam"] == null ? null : SkuParam.fromJson(json["skuParam"]),
    limitParam: json["limitParam"] == null ? null : SsrData.fromJson(json["limitParam"]),
    addCartParam: json["addCartParam"] == null ? null : AddCartParam.fromJson(json["addCartParam"]),
    beginNum: json["beginNum"] == null ? null : json["beginNum"],
    saledCount: json["saledCount"] == null ? null : json["saledCount"],
    flow: json["flow"] == null ? null : json["flow"],
  );

  Map<String, dynamic> toJson() => {
    "canBookedAmount": canBookedAmount == null ? null : canBookedAmount,
    "skuParam": skuParam == null ? null : skuParam.toJson(),
    "limitParam": limitParam == null ? null : limitParam.toJson(),
    "addCartParam": addCartParam == null ? null : addCartParam.toJson(),
    "beginNum": beginNum == null ? null : beginNum,
    "saledCount": saledCount == null ? null : saledCount,
    "flow": flow == null ? null : flow,
  };
}

class AddCartParam {
  AddCartParam({
    this.cartType,
  });

  String cartType;

  factory AddCartParam.fromJson(Map<String, dynamic> json) => AddCartParam(
    cartType: json["cartType"] == null ? null : json["cartType"],
  );

  Map<String, dynamic> toJson() => {
    "cartType": cartType == null ? null : cartType,
  };
}

class SkuParam {
  SkuParam({
    this.skuPriceType,
    this.skuRangePrices,
  });

  String skuPriceType;
  List<Price> skuRangePrices;

  factory SkuParam.fromJson(Map<String, dynamic> json) => SkuParam(
    skuPriceType: json["skuPriceType"] == null ? null : json["skuPriceType"],
    skuRangePrices: json["skuRangePrices"] == null ? null : List<Price>.from(json["skuRangePrices"].map((x) => Price.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "skuPriceType": skuPriceType == null ? null : skuPriceType,
    "skuRangePrices": skuRangePrices == null ? null : List<dynamic>.from(skuRangePrices.map((x) => x.toJson())),
  };
}

class SellerSign {
  SellerSign({
    this.isIndustrySeller,
    this.isSlsj,
    this.signs,
    this.isTp,
    this.isChtMember,
    this.isEaseBuyDealer,
  });

  bool isIndustrySeller;
  bool isSlsj;
  SellerSign signs;
  bool isTp;
  bool isChtMember;
  bool isEaseBuyDealer;

  factory SellerSign.fromJson(Map<String, dynamic> json) => SellerSign(
    isIndustrySeller: json["isIndustrySeller"] == null ? null : json["isIndustrySeller"],
    isSlsj: json["isSlsj"] == null ? null : json["isSlsj"],
    signs: json["signs"] == null ? null : SellerSign.fromJson(json["signs"]),
    isTp: json["isTp"] == null ? null : json["isTp"],
    isChtMember: json["isChtMember"] == null ? null : json["isChtMember"],
    isEaseBuyDealer: json["isEaseBuyDealer"] == null ? null : json["isEaseBuyDealer"],
  );

  Map<String, dynamic> toJson() => {
    "isIndustrySeller": isIndustrySeller == null ? null : isIndustrySeller,
    "isSlsj": isSlsj == null ? null : isSlsj,
    "signs": signs == null ? null : signs.toJson(),
    "isTp": isTp == null ? null : isTp,
    "isChtMember": isChtMember == null ? null : isChtMember,
    "isEaseBuyDealer": isEaseBuyDealer == null ? null : isEaseBuyDealer,
  };
}

class ShareModel {
  ShareModel({
    this.picUrl,
    this.subject,
    this.companyName,
    this.imageUrls,
    this.offerId,
  });

  String picUrl;
  String subject;
  String companyName;
  List<dynamic> imageUrls;
  int offerId;

  factory ShareModel.fromJson(Map<String, dynamic> json) => ShareModel(
    picUrl: json["picUrl"] == null ? null : json["picUrl"],
    subject: json["subject"] == null ? null : json["subject"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    imageUrls: json["imageUrls"] == null ? null : List<dynamic>.from(json["imageUrls"].map((x) => x)),
    offerId: json["offerId"] == null ? null : json["offerId"],
  );

  Map<String, dynamic> toJson() => {
    "picUrl": picUrl == null ? null : picUrl,
    "subject": subject == null ? null : subject,
    "companyName": companyName == null ? null : companyName,
    "imageUrls": imageUrls == null ? null : List<dynamic>.from(imageUrls.map((x) => x)),
    "offerId": offerId == null ? null : offerId,
  };
}

class SkuModel {
  SkuModel({
    this.skuPriceScale,
    this.skuButtonList,
    this.skuInfoMapOriginal,
    this.skuProps,
    this.skuBtnDisType,
    this.skuPriceScaleOriginal,
    this.skuInfoMap,
  });

  String skuPriceScale;
  List<SkuButtonList> skuButtonList;
  Map<String, SkuInfoMap> skuInfoMapOriginal;
  List<SkuProp> skuProps;
  String skuBtnDisType;
  String skuPriceScaleOriginal;
  Map<String, SkuInfoMap> skuInfoMap;

  factory SkuModel.fromJson(Map<String, dynamic> json) => SkuModel(
    skuPriceScale: json["skuPriceScale"] == null ? null : json["skuPriceScale"],
    skuButtonList: json["skuButtonList"] == null ? null : List<SkuButtonList>.from(json["skuButtonList"].map((x) => SkuButtonList.fromJson(x))),
    skuInfoMapOriginal: json["skuInfoMapOriginal"] == null ? null : Map.from(json["skuInfoMapOriginal"]).map((k, v) => MapEntry<String, SkuInfoMap>(k, SkuInfoMap.fromJson(v))),
    skuProps: json["skuProps"] == null ? null : List<SkuProp>.from(json["skuProps"].map((x) => SkuProp.fromJson(x))),
    skuBtnDisType: json["skuBtnDisType"] == null ? null : json["skuBtnDisType"],
    skuPriceScaleOriginal: json["skuPriceScaleOriginal"] == null ? null : json["skuPriceScaleOriginal"],
    skuInfoMap: json["skuInfoMap"] == null ? null : Map.from(json["skuInfoMap"]).map((k, v) => MapEntry<String, SkuInfoMap>(k, SkuInfoMap.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "skuPriceScale": skuPriceScale == null ? null : skuPriceScale,
    "skuButtonList": skuButtonList == null ? null : List<dynamic>.from(skuButtonList.map((x) => x.toJson())),
    "skuInfoMapOriginal": skuInfoMapOriginal == null ? null : Map.from(skuInfoMapOriginal).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "skuProps": skuProps == null ? null : List<dynamic>.from(skuProps.map((x) => x.toJson())),
    "skuBtnDisType": skuBtnDisType == null ? null : skuBtnDisType,
    "skuPriceScaleOriginal": skuPriceScaleOriginal == null ? null : skuPriceScaleOriginal,
    "skuInfoMap": skuInfoMap == null ? null : Map.from(skuInfoMap).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class SkuButtonList {
  SkuButtonList({
    this.name,
    this.isGrey,
    this.type,
  });

  String name;
  bool isGrey;
  String type;

  factory SkuButtonList.fromJson(Map<String, dynamic> json) => SkuButtonList(
    name: json["name"] == null ? null : json["name"],
    isGrey: json["isGrey"] == null ? null : json["isGrey"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "isGrey": isGrey == null ? null : isGrey,
    "type": type == null ? null : type,
  };
}

class SkuInfoMap {
  SkuInfoMap({
    this.specId,
    this.specAttrs,
    this.price,
    this.saleCount,
    this.discountPrice,
    this.canBookCount,
    this.retailPrice,
    this.skuId,
  });

  String specId;
  String specAttrs;
  String price;
  int saleCount;
  String discountPrice;
  int canBookCount;
  String retailPrice;
  int skuId;

  factory SkuInfoMap.fromJson(Map<String, dynamic> json) => SkuInfoMap(
    specId: json["specId"] == null ? null : json["specId"],
    specAttrs: json["specAttrs"] == null ? null : json["specAttrs"],
    price: json["price"] == null ? null : json["price"],
    saleCount: json["saleCount"] == null ? null : json["saleCount"],
    discountPrice: json["discountPrice"] == null ? null : json["discountPrice"],
    canBookCount: json["canBookCount"] == null ? null : json["canBookCount"],
    retailPrice: json["retailPrice"] == null ? null : json["retailPrice"],
    skuId: json["skuId"] == null ? null : json["skuId"],
  );

  Map<String, dynamic> toJson() => {
    "specId": specId == null ? null : specId,
    "specAttrs": specAttrs == null ? null : specAttrs,
    "price": price == null ? null : price,
    "saleCount": saleCount == null ? null : saleCount,
    "discountPrice": discountPrice == null ? null : discountPrice,
    "canBookCount": canBookCount == null ? null : canBookCount,
    "retailPrice": retailPrice == null ? null : retailPrice,
    "skuId": skuId == null ? null : skuId,
  };
}

class SkuProp {
  SkuProp({
    this.prop,
    this.value,
    this.unit,
  });

  String prop;
  List<Value> value;
  String unit;

  factory SkuProp.fromJson(Map<String, dynamic> json) => SkuProp(
    prop: json["prop"] == null ? null : json["prop"],
    value: json["value"] == null ? null : List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    unit: json["unit"] == null ? null : json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "prop": prop == null ? null : prop,
    "value": value == null ? null : List<dynamic>.from(value.map((x) => x.toJson())),
    "unit": unit == null ? null : unit,
  };
}

class Value {
  Value({
    this.imageUrl,
    this.name,
  });

  String imageUrl;
  String name;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl == null ? null : imageUrl,
    "name": name == null ? null : name,
  };
}

class TempModel {
  TempModel({
    this.winportUrl,
    this.addCartUrl,
    this.isFavoriteOffer,
    this.companyName,
    this.selectedScene,
    this.saleOut,
    this.price,
    this.sk,
    this.saledCount,
    this.offerTitle,
    this.defaultOfferImg,
    this.applyCouponUrl,
    this.topCategoryId,
    this.postCategoryId,
    this.offerUnit,
    this.sellerLoginId,
    this.sellerUserId,
    this.sellerMemberId,
    this.sceneKey,
    this.saledCountStr,
    this.isChtOffer,
    this.offerId,
    this.canApplyChtCoupon,
  });

  String winportUrl;
  String addCartUrl;
  bool isFavoriteOffer;
  String companyName;
  String selectedScene;
  bool saleOut;
  String price;
  String sk;
  int saledCount;
  String offerTitle;
  String defaultOfferImg;
  String applyCouponUrl;
  String topCategoryId;
  String postCategoryId;
  String offerUnit;
  String sellerLoginId;
  String sellerUserId;
  String sellerMemberId;
  String sceneKey;
  String saledCountStr;
  bool isChtOffer;
  String offerId;
  bool canApplyChtCoupon;

  factory TempModel.fromJson(Map<String, dynamic> json) => TempModel(
    winportUrl: json["winportUrl"] == null ? null : json["winportUrl"],
    addCartUrl: json["addCartUrl"] == null ? null : json["addCartUrl"],
    isFavoriteOffer: json["isFavoriteOffer"] == null ? null : json["isFavoriteOffer"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    selectedScene: json["selectedScene"] == null ? null : json["selectedScene"],
    saleOut: json["saleOut"] == null ? null : json["saleOut"],
    price: json["price"] == null ? null : json["price"],
    sk: json["sk"] == null ? null : json["sk"],
    saledCount: json["saledCount"] == null ? null : json["saledCount"],
    offerTitle: json["offerTitle"] == null ? null : json["offerTitle"],
    defaultOfferImg: json["defaultOfferImg"] == null ? null : json["defaultOfferImg"],
    applyCouponUrl: json["applyCouponUrl"] == null ? null : json["applyCouponUrl"],
    topCategoryId: json["topCategoryId"] == null ? null : json["topCategoryId"],
    postCategoryId: json["postCategoryId"] == null ? null : json["postCategoryId"],
    offerUnit: json["offerUnit"] == null ? null : json["offerUnit"],
    sellerLoginId: json["sellerLoginId"] == null ? null : json["sellerLoginId"],
    sellerUserId: json["sellerUserId"] == null ? null : json["sellerUserId"],
    sellerMemberId: json["sellerMemberId"] == null ? null : json["sellerMemberId"],
    sceneKey: json["sceneKey"] == null ? null : json["sceneKey"],
    saledCountStr: json["saledCountStr"] == null ? null : json["saledCountStr"],
    isChtOffer: json["isChtOffer"] == null ? null : json["isChtOffer"],
    offerId: json["offerId"] == null ? null : json["offerId"],
    canApplyChtCoupon: json["canApplyChtCoupon"] == null ? null : json["canApplyChtCoupon"],
  );

  Map<String, dynamic> toJson() => {
    "winportUrl": winportUrl == null ? null : winportUrl,
    "addCartUrl": addCartUrl == null ? null : addCartUrl,
    "isFavoriteOffer": isFavoriteOffer == null ? null : isFavoriteOffer,
    "companyName": companyName == null ? null : companyName,
    "selectedScene": selectedScene == null ? null : selectedScene,
    "saleOut": saleOut == null ? null : saleOut,
    "price": price == null ? null : price,
    "sk": sk == null ? null : sk,
    "saledCount": saledCount == null ? null : saledCount,
    "offerTitle": offerTitle == null ? null : offerTitle,
    "defaultOfferImg": defaultOfferImg == null ? null : defaultOfferImg,
    "applyCouponUrl": applyCouponUrl == null ? null : applyCouponUrl,
    "topCategoryId": topCategoryId == null ? null : topCategoryId,
    "postCategoryId": postCategoryId == null ? null : postCategoryId,
    "offerUnit": offerUnit == null ? null : offerUnit,
    "sellerLoginId": sellerLoginId == null ? null : sellerLoginId,
    "sellerUserId": sellerUserId == null ? null : sellerUserId,
    "sellerMemberId": sellerMemberId == null ? null : sellerMemberId,
    "sceneKey": sceneKey == null ? null : sceneKey,
    "saledCountStr": saledCountStr == null ? null : saledCountStr,
    "isChtOffer": isChtOffer == null ? null : isChtOffer,
    "offerId": offerId == null ? null : offerId,
    "canApplyChtCoupon": canApplyChtCoupon == null ? null : canApplyChtCoupon,
  };
}

class TopBarModel {
  TopBarModel({
    this.topNavItems,
  });

  List<TopNavItem> topNavItems;

  factory TopBarModel.fromJson(Map<String, dynamic> json) => TopBarModel(
    topNavItems: json["topNavItems"] == null ? null : List<TopNavItem>.from(json["topNavItems"].map((x) => TopNavItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "topNavItems": topNavItems == null ? null : List<dynamic>.from(topNavItems.map((x) => x.toJson())),
  };
}

class TopNavItem {
  TopNavItem({
    this.tabName,
    this.tabKey,
    this.tabUrl,
  });

  String tabName;
  String tabKey;
  String tabUrl;

  factory TopNavItem.fromJson(Map<String, dynamic> json) => TopNavItem(
    tabName: json["tabName"] == null ? null : json["tabName"],
    tabKey: json["tabKey"] == null ? null : json["tabKey"],
    tabUrl: json["tabUrl"] == null ? null : json["tabUrl"],
  );

  Map<String, dynamic> toJson() => {
    "tabName": tabName == null ? null : tabName,
    "tabKey": tabKey == null ? null : tabKey,
    "tabUrl": tabUrl == null ? null : tabUrl,
  };
}

class ModuleElement {
  ModuleElement({
    this.h5CdnUrl,
    this.modSpec,
    this.spmc,
    this.fullName,
    this.asnyc,
    this.uuid,
    this.version,
    this.dataService,
    this.name,
    this.moduleClass,
  });

  String h5CdnUrl;
  ModSpec modSpec;
  String spmc;
  String fullName;
  bool asnyc;
  String uuid;
  String version;
  DataService dataService;
  String name;
  String moduleClass;

  factory ModuleElement.fromJson(Map<String, dynamic> json) => ModuleElement(
    h5CdnUrl: json["h5CdnUrl"] == null ? null : json["h5CdnUrl"],
    modSpec: json["modSpec"] == null ? null : modSpecValues.map[json["modSpec"]],
    spmc: json["spmc"] == null ? null : json["spmc"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    asnyc: json["asnyc"] == null ? null : json["asnyc"],
    uuid: json["uuid"] == null ? null : json["uuid"],
    version: json["version"] == null ? null : json["version"],
    dataService: json["dataService"] == null ? null : DataService.fromJson(json["dataService"]),
    name: json["name"] == null ? null : json["name"],
    moduleClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "h5CdnUrl": h5CdnUrl == null ? null : h5CdnUrl,
    "modSpec": modSpec == null ? null : modSpecValues.reverse[modSpec],
    "spmc": spmc == null ? null : spmc,
    "fullName": fullName == null ? null : fullName,
    "asnyc": asnyc == null ? null : asnyc,
    "uuid": uuid == null ? null : uuid,
    "version": version == null ? null : version,
    "dataService": dataService == null ? null : dataService.toJson(),
    "name": name == null ? null : name,
    "class": moduleClass == null ? null : moduleClass,
  };
}

class DataService {
  DataService({
    this.apiName,
    this.apiVersion,
    this.param,
    this.needLogin,
    this.apiAlias,
    this.asnyc,
    this.dataServiceClass,
  });

  ApiName apiName;
  String apiVersion;
  Param param;
  bool needLogin;
  String apiAlias;
  bool asnyc;
  String dataServiceClass;

  factory DataService.fromJson(Map<String, dynamic> json) => DataService(
    apiName: json["apiName"] == null ? null : apiNameValues.map[json["apiName"]],
    apiVersion: json["apiVersion"] == null ? null : json["apiVersion"],
    param: json["param"] == null ? null : Param.fromJson(json["param"]),
    needLogin: json["needLogin"] == null ? null : json["needLogin"],
    apiAlias: json["apiAlias"] == null ? null : json["apiAlias"],
    asnyc: json["asnyc"] == null ? null : json["asnyc"],
    dataServiceClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "apiName": apiName == null ? null : apiNameValues.reverse[apiName],
    "apiVersion": apiVersion == null ? null : apiVersion,
    "param": param == null ? null : param.toJson(),
    "needLogin": needLogin == null ? null : needLogin,
    "apiAlias": apiAlias == null ? null : apiAlias,
    "asnyc": asnyc == null ? null : asnyc,
    "class": dataServiceClass == null ? null : dataServiceClass,
  };
}

enum ApiName { MTOP_ALIBABA_CBU_WIRELESS_UNIFORM_PRODUCT_BATCHGETCOMPONENTDATA }

final apiNameValues = EnumValues({
  "mtop.alibaba.cbu.wireless.uniform.product.batchgetcomponentdata": ApiName.MTOP_ALIBABA_CBU_WIRELESS_UNIFORM_PRODUCT_BATCHGETCOMPONENTDATA
});

class Param {
  Param({
    this.componentParams,
    this.params,
    this.isGray,
  });

  String componentParams;
  String params;
  bool isGray;

  factory Param.fromJson(Map<String, dynamic> json) => Param(
    componentParams: json["componentParams"] == null ? null : json["componentParams"],
    params: json["params"] == null ? null : json["params"],
    isGray: json["isGray"] == null ? null : json["isGray"],
  );

  Map<String, dynamic> toJson() => {
    "componentParams": componentParams == null ? null : componentParams,
    "params": params == null ? null : params,
    "isGray": isGray == null ? null : isGray,
  };
}

enum ModSpec { RAX1_0 }

final modSpecValues = EnumValues({
  "rax1.0": ModSpec.RAX1_0
});

class PageInfo {
  PageInfo({
    this.meta,
    this.spmab,
    this.theme,
    this.title,
    this.pageInfoClass,
  });

  String meta;
  String spmab;
  Theme theme;
  String title;
  String pageInfoClass;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    meta: json["meta"] == null ? null : json["meta"],
    spmab: json["spmab"] == null ? null : json["spmab"],
    theme: json["theme"] == null ? null : Theme.fromJson(json["theme"]),
    title: json["title"] == null ? null : json["title"],
    pageInfoClass: json["class"] == null ? null : json["class"],
  );

  Map<String, dynamic> toJson() => {
    "meta": meta == null ? null : meta,
    "spmab": spmab == null ? null : spmab,
    "theme": theme == null ? null : theme.toJson(),
    "title": title == null ? null : title,
    "class": pageInfoClass == null ? null : pageInfoClass,
  };
}

class Theme {
  Theme({
    this.backgroundColor,
  });

  String backgroundColor;

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
    backgroundColor: json["backgroundColor"] == null ? null : json["backgroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "backgroundColor": backgroundColor == null ? null : backgroundColor,
  };
}

class Seed {
  Seed({
    this.packages,
    this.seedClass,
    this.modules,
    this.combine,
  });

  Map<String, Package> packages;
  String seedClass;
  Map<String, ModuleValue> modules;
  bool combine;

  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
    packages: json["packages"] == null ? null : Map.from(json["packages"]).map((k, v) => MapEntry<String, Package>(k, Package.fromJson(v))),
    seedClass: json["class"] == null ? null : json["class"],
    modules: json["modules"] == null ? null : Map.from(json["modules"]).map((k, v) => MapEntry<String, ModuleValue>(k, ModuleValue.fromJson(v))),
    combine: json["combine"] == null ? null : json["combine"],
  );

  Map<String, dynamic> toJson() => {
    "packages": packages == null ? null : Map.from(packages).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "class": seedClass == null ? null : seedClass,
    "modules": modules == null ? null : Map.from(modules).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "combine": combine == null ? null : combine,
  };
}

class ModuleValue {
  ModuleValue({
    this.moduleClass,
    this.requires,
  });

  String moduleClass;
  List<String> requires;

  factory ModuleValue.fromJson(Map<String, dynamic> json) => ModuleValue(
    moduleClass: json["class"] == null ? null : json["class"],
    requires: json["requires"] == null ? null : List<String>.from(json["requires"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "class": moduleClass == null ? null : moduleClass,
    "requires": requires == null ? null : List<dynamic>.from(requires.map((x) => x)),
  };
}

class Package {
  Package({
    this.path,
    this.debug,
    this.ignorePackageNameInUri,
    this.packageClass,
    this.version,
    this.group,
  });

  String path;
  bool debug;
  bool ignorePackageNameInUri;
  String packageClass;
  String version;
  Group group;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    path: json["path"] == null ? null : json["path"],
    debug: json["debug"] == null ? null : json["debug"],
    ignorePackageNameInUri: json["ignorePackageNameInUri"] == null ? null : json["ignorePackageNameInUri"],
    packageClass: json["class"] == null ? null : json["class"],
    version: json["version"] == null ? null : json["version"],
    group: json["group"] == null ? null : groupValues.map[json["group"]],
  );

  Map<String, dynamic> toJson() => {
    "path": path == null ? null : path,
    "debug": debug == null ? null : debug,
    "ignorePackageNameInUri": ignorePackageNameInUri == null ? null : ignorePackageNameInUri,
    "class": packageClass == null ? null : packageClass,
    "version": version == null ? null : version,
    "group": group == null ? null : groupValues.reverse[group],
  };
}

enum Group { TM }

final groupValues = EnumValues({
  "tm": Group.TM
});

class SeedComboUris {
  SeedComboUris({
    this.type,
    this.seedComboUrisClass,
    this.uri,
  });

  String type;
  String seedComboUrisClass;
  String uri;

  factory SeedComboUris.fromJson(Map<String, dynamic> json) => SeedComboUris(
    type: json["type"] == null ? null : json["type"],
    seedComboUrisClass: json["class"] == null ? null : json["class"],
    uri: json["uri"] == null ? null : json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "class": seedComboUrisClass == null ? null : seedComboUrisClass,
    "uri": uri == null ? null : uri,
  };
}

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
