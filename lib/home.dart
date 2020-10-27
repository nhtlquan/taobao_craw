import 'package:flutter/material.dart';
import 'package:flutter_app_test/pages/CartPage.dart';
import 'package:flutter_app_test/pages/HomePage.dart';
import 'package:flutter_app_test/pages/ProfilePage.dart';
import 'package:flutter_app_test/pages/ProfilePage1.dart';
import 'package:flutter_app_test/pages/SearchPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_app_test/utils/ResourceUtil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addHomePage();
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
            icon: Icon(Icons.add_shopping_cart),
            title: Text(
              "Giỏ hàng",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
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
    listBottomWidget.add(SearchPage());
    listBottomWidget.add(CartPage());
    listBottomWidget.add(ProfilePage1());
  }
}
