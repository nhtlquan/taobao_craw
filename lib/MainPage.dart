import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/ResourceUtil.dart';
import 'package:flutter_app_test/model/ConfigGlobal.dart';
import 'package:flutter_app_test/pages/CartPage.dart';
import 'package:flutter_app_test/pages/HomePage.dart';
import 'package:flutter_app_test/pages/NotificationPage.dart';
import 'package:flutter_app_test/pages/ProfilePage.dart';
import 'package:flutter_app_test/pages/ProfilePage1.dart';
import 'package:flutter_app_test/pages/HistoryPage.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'dart:io' show Platform;
import 'helper/ApiService.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = new List();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addHomePage();
    notification();
  }

  notification() async{
    await Firebase.initializeApp();
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async {
        if(Util.isShowDialog = true)
          return;
        Util.isShowDialog = true;
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => NotificationPage()));
      },
    );
    _firebaseMessaging
        .requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      Util.tokenFireBase = token;
      addTokenToSV(token);
      print('Token: '+ token);
    });
  }

  void addTokenToSV(String token) async{
    Map params = new Map<String, dynamic>();
    params['username'] = Util.userInfo.data.username;
    params['driver_id'] = token;
    if (Platform.isAndroid) {
      params['driver_type'] = 'Android';
    } else if (Platform.isIOS) {
      params['driver_type'] = 'Ios';
    }
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.addTokenNotifi(encryptString);
    if (response.statusCode == 200) {
    }
  }



  @override
  Widget build(BuildContext context) {
    print('reload');
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
