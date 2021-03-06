import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_test/Util/DateTimeUtil.dart';
import 'package:flutter_app_test/helper/ApiService.dart';
import 'package:flutter_app_test/model/CountModel.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:flutter_app_test/model/OderList.dart';
import 'package:flutter_app_test/model/UserInfo.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tabbar/tabbar.dart';
import '../ResourceUtil.dart';
import 'BodyHistoryPage.dart';
import 'WebViewPage.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => false;
  List<String> listCategory = new List();
  List<String> listShoesImage = new List();
  var _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  Stream get isLoadingStream => _isLoadingSubject.stream;

  int cupertinoTabBarIIIValue = 3;

  int cupertinoTabBarIIIValueGetter() => cupertinoTabBarIIIValue;
  String currentType = '';
  List<OderItem> oderLists = [];
  TabController tabController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isLoadingSubject.close();
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
      length: Util.listOderType.length,
      vsync: this,
    );

    getCount();
  }

  void getCount() async {
    Map params = new Map<String, dynamic>();
    params['username'] = Util.userInfo.data.username;
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.countOder(encryptString);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
      } else {
        CountModel  countModel = CountModel.fromJson(json.decode(response.data));
        for(var item in Util.listOderType){
          if(item.value.isEmpty)
            continue;
          for (var itemCount in countModel.data){
            if (item.value == itemCount.status){
              item.count = itemCount.num;
            } else {
              item.count ='0';
            }
          }
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Lịch sử",
                style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 21, color: Colors.black),
              ),
              margin: EdgeInsets.only(left: 12, top: 12, bottom: 10),
            ),
            Expanded(
              child: Column(
                children: [
                  ButtonsTabBar(
                    controller: tabController,
                    backgroundColor: Colors.green,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: listTab(),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: listBody(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Tab> listTab() {
    return List<Tab>.generate(Util.listOderType.length, (index) {

      var title = Util.listOderType[index].title + ' (' + Util.listOderType[index].count.toString() + ')';
      if(Util.listOderType[index].count==null)
        title = Util.listOderType[index].title;
      return Tab(text: title);
    });
  }

  List<Widget> listBody() {
    return List<Widget>.generate(
        Util.listOderType.length,
        (index) => BodyHistoryPage(
              typeHistory: Util.listOderType[index].value,
            ));
  }
}
