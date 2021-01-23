import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app_test/model/UserInfo.dart';

class Util {
  static List<ItemDetail> listItems = new List();
  static int moneyRate = 3500;
  static int balance = 3500;
  static UserInfo userInfo;

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
}
