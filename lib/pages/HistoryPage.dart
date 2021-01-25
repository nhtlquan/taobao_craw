import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_test/helper/ApiService.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:flutter_app_test/model/UserInfo.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tabbar/tabbar.dart';
import '../ResourceUtil.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> listCategory = new List();
  List<String> listShoesImage = new List();
  var _isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  var _headerSubject = BehaviorSubject<bool>.seeded(false);

  Stream get isLoadingStream => _isLoadingSubject.stream;

  Stream get streamHeader => _headerSubject.stream;
  int cupertinoTabBarIIIValue = 3;

  int cupertinoTabBarIIIValueGetter() => cupertinoTabBarIIIValue;
  final controller = PageController();
  var currentPage = 0.0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isLoadingSubject.close();
    _headerSubject.close();
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      currentPage = controller.page;
      _headerSubject.sink.add(true);
    });
    getListOder();
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      streamLoading: isLoadingStream,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Lịch sử",
                style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 21, color: Colors.black),
              ),
              margin: EdgeInsets.only(left: 12, top: 12, bottom: 0),
            ),
            StreamBuilder<Object>(
                stream: streamHeader,
                builder: (context, snapshot) {
                  return TabbarHeader(
                    controller: controller,
                    backgroundColor: Colors.white,
                    indicatorColor: Colors.green,
                    foregroundColor: Colors.green,
                    tabs: [
                      Tab(
                          child: Text(
                        'Tất cả',
                        style: TextStyle(
                          color: currentPage < 0.5 ? Colors.green : Colors.black,
                          fontWeight: currentPage < 1 ? FontWeight.bold : null,
                          fontSize: currentPage < 1 ? 16 : 14,
                        ),
                      )),
                      Tab(
                          child: Text(
                        'Đang xử lý',
                        style: TextStyle(
                          color: currentPage > 0.5 && currentPage < 1.5 ? Colors.green : Colors.black,
                          fontWeight: currentPage > 0.5 && currentPage < 1.5 ? FontWeight.bold : null,
                          fontSize: currentPage > 0.5 && currentPage < 1.5 ? 16 : 14,
                        ),
                      )),
                      Tab(
                          child: Text(
                        'Hoàn thành',
                        style: TextStyle(
                          color: currentPage > 1.5 ? Colors.green : Colors.black,
                          fontWeight: currentPage > 1.5 ? FontWeight.bold : null,
                          fontSize: currentPage > 1.5 ? 16 : 14,
                        ),
                      )),
                    ],
                  );
                }),
            Expanded(
              child: TabbarContent(
                controller: controller,
                children: <Widget>[
                  bodyTabbar(),
                  bodyTabbar(),
                  bodyTabbar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyTabbar() {
    return ListView.builder(
      itemCount: Util.listItems.length,
      shrinkWrap: true,
      itemBuilder: (context, position) {
        return itemHistory(position);
      },
    );
  }

  Widget itemHistory(int pos) {
    var item = Util.listItems[pos];
    var priceTotalVND =
        Util.intToPriceDouble(double.parse(item.priceOrigin) * Util.moneyRate * int.parse(item.quantity));
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.nameshop,
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
                    item.quantity + ' sản phẩm',
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
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: pos % 2 == 0 ? Colors.green : Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(4)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      pos % 2 == 0 ? 'Đang xử lý' : 'Hoàn thành',
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
        )
      ],
    );
  }

  createCartListItem(ItemDetail item) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Image.network(
                item.img,
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
                          item.titleOrigin,
                          maxLines: 1,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        item.property,
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
      ],
    );
  }

  void getListOder() async {
    onLoading(true);
    Map params = new Map<String, dynamic>();
    // params['ftime'] = Util.userInfo.data.username;
    // params['ttime'] = Util.userInfo.data.username;
    params['status'] = 0;
    params['len'] = 50;
    params['page'] = 1;
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.oderList(encryptString);
    onLoading(false);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
      } else {}
    }
  }

  onLoading(bool isLoading) {
    _isLoadingSubject.sink.add(isLoading);
  }
}
