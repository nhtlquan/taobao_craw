import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/ConfigGlobal.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app_test/model/UserInfo.dart';

class Util {
  static List<TypeOder> listOderType = new List();
  static List<ItemDetail> listItems = new List();
  static int moneyRate = 3500;
  static int balance = 3500;
  static UserInfo userInfo;
  static String tokenFireBase = '';
  static bool isShowDialog = false;
  static ConfigGlobal configGlobal;

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.grey);
  }

  static String intToPrice(int price) {
    if (price == null) return '0';
    final oCcy = new NumberFormat("#,###");
    var string = oCcy.format(price);
    return string.replaceAll(",", ".");
  }

  static String intToPriceDouble(dynamic price) {
    if (price == null) return '';
    final oCcy = new NumberFormat("#,###");
    var string = oCcy.format(price);
    return string.replaceAll(",", ".");
  }

  static String doubleToString(double value) {
    if (value == null) {
      return "";
    }
    return value.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }

  static double round(double val, int places) {
    if (val == null) {
      return null;
    }
    double mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }
}

class TypeOder {
  String value;
  String title;

  TypeOder(this.value, this.title);
}
