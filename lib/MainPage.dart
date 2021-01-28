import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/ResourceUtil.dart';
import 'package:flutter_app_test/model/ConfigGlobal.dart';
import 'package:flutter_app_test/pages/CartPage.dart';
import 'package:flutter_app_test/pages/HomePage.dart';
import 'package:flutter_app_test/pages/ProfilePage.dart';
import 'package:flutter_app_test/pages/ProfilePage1.dart';
import 'package:flutter_app_test/pages/HistoryPage.dart';
import 'package:flutter_app_test/utils/Util.dart';

import 'helper/ApiService.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addHomePage();
    getConfig();
  }

  getConfig() async {
    Util.listOderType.add(new TypeOder('','Tất cả'));
    Util.listOderType.add(new TypeOder('0','Đơn chờ xử lý'));
    Util.listOderType.add(new TypeOder('1','Đơn chờ cọc'));
    Util.listOderType.add(new TypeOder('2','Đơn chờ phát'));
    Util.listOderType.add(new TypeOder('3','Đang vận chuyển'));
    Util.listOderType.add(new TypeOder('4','Đơn đã về VN'));
    Util.listOderType.add(new TypeOder('5','Lưu kho'));
    Util.listOderType.add(new TypeOder('6','Đã thanh toán'));
    Util.listOderType.add(new TypeOder('-1','Đơn bị hủy'));
    Map params = new Map<String, dynamic>();
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.systemConfig(encryptString);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
      } else {
        Util.configGlobal = ConfigGlobal.fromJson(json.decode(response.data));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Trang chủ",
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(
              "Lịch sử",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.add_shopping_cart),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      Util.listItems.length.toString(),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            title: Text('Giỏ hàng'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
              "Tài khoản",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
        currentIndex: selectedPosition,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        onTap: (position) {
          setState(() {
            selectedPosition = position;
          });
        },
      ),
      body: Builder(builder: (context) {
        return listBottomWidget[selectedPosition];
      }),
    );
  }

  void addHomePage() {
    listBottomWidget.add(HomePage());
    listBottomWidget.add(HistoryPage());
    listBottomWidget.add(CartPage());
    listBottomWidget.add(ProfilePage1());
  }
}
