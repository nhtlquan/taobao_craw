import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_test/Util/DateTimeUtil.dart';
import 'package:flutter_app_test/helper/ApiService.dart';
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
  List<Oder> oderLists = [];
  TabController tabController;
  DateTime starTime;
  DateTime endTime;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isLoadingSubject.close();
  }

  @override
  void initState() {
    super.initState();
    getListOder();
    tabController = new TabController(
      length: Util.listOderType.length,
      vsync: this,
    );
    tabController.addListener(() {
      var index = tabController.index;
      if (currentType == Util.listOderType[index].value) return;
      currentType = Util.listOderType[index].value;
      getListOder();
    });
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text('Từ: '),
                        InkWell(
                          onTap: () {
                            DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              setState(() {
                                starTime = date;
                              });
                              getListOder();
                            }, currentTime: DateTime.now(), locale: LocaleType.vi);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(DateTimeUtil.getDateTimeToDateSub(starTime)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Đến: '),
                        InkWell(
                          onTap: () {
                            DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              setState(() {
                                endTime = date;
                              });
                              getListOder();
                            }, currentTime: DateTime.now(), locale: LocaleType.vi);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(DateTimeUtil.getDateTimeToDateSub(endTime)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
      return Tab(text: Util.listOderType[index].title);
    });
  }

  List<Widget> listBody() {
    return List<Widget>.generate(Util.listOderType.length, (index) => bodyTab());
  }

  bodyTab() {
    print(oderLists.length);
    return ListView.builder(
        itemCount: oderLists.length,
        shrinkWrap: false,
        padding: EdgeInsets.zero,
        itemBuilder: (context, position) {
          return itemHistory(position);
        });
  }

  Widget itemHistory(int pos) {
    var item = oderLists[pos];
    var priceTotalVND = Util.intToPriceDouble(double.parse(item.priceCyn) * Util.moneyRate * int.parse(item.quan));
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.shop,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              createCartListItem(item),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    item.quan + ' sản phẩm',
                    style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.grey, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    'Thành tiền: ' + priceTotalVND + ' đ',
                    style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.black, fontSize: 12),
                  ),
                  Utils.getSizedBox(height: 3),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Thời gian: ' + DateTimeUtil.getDateTimeStamp(int.parse(item.cdate)),
                    maxLines: 1,
                    softWrap: true,
                    style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.grey, fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      Util.listOderType.firstWhere((element) => element.value== item.isactive).title,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 10,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    );
  }

  createCartListItem(Oder item) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => WebViewExample(
                  url: item.proInfo.link,
                  isView: true,
                )));
          },
          child: Container(
            height: 100,
            child: Row(
              children: <Widget>[
                Image.network(
                  item.proInfo.img,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            item.shop,
                            maxLines: 1,
                            softWrap: true,
                            style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 12, color: Colors.blue),
                          ),
                        ),
                        Utils.getSizedBox(height: 6),
                        Text(
                          sku(item.sku),
                          maxLines: 1,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                        Utils.getSizedBox(height: 6),
                        Text(
                          item.notes,
                          maxLines: 1,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                        Utils.getSizedBox(height: 6),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  String sku(List<Sku> skus) {
    if (skus == null) return '';
    var sku = '';
    for (var item in skus) {
      sku = sku + item.name + ':' + item.idx + ', ';
    }
    return sku;
  }

  void getListOder() async {
    onLoading(true);
    Map params = new Map<String, dynamic>();
    params['username'] = Util.userInfo.data.username;
    params['ftime'] = starTime == null ? '' : starTime.microsecondsSinceEpoch;
    params['ttime'] = endTime == null ? '' : starTime.millisecondsSinceEpoch;
    params['len'] = 50;
    params['page'] = 1;
    params['status'] = currentType;
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.oderList(encryptString);
    onLoading(false);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
      } else {
        var oderData = OderList.fromJson(json.decode(response.data));
        setState(() {
          oderLists.clear();
          oderLists = oderData.data;
        });
      }
    }
  }

  onLoading(bool isLoading) {
    _isLoadingSubject.sink.add(isLoading);
  }
}
