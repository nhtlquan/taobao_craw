import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/OderList.dart';
import 'package:flutter_app_test/pages/WebViewPage.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';

class DetailPage extends StatefulWidget {
  OderItem oderItem;

  DetailPage(this.oderItem);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Chi tiết đơn hàng",
          style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 18, color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      itemWidget('Tên Shop', widget.oderItem.shop),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => WebViewExample(
                                      url: widget.oderItem.proInfo.link,
                                      isView: false,
                                    )));
                          },
                          child: itemWidget('Link', widget.oderItem.proInfo.link)),
                      itemWidget('Giá (¥):', widget.oderItem.priceCyn),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    widget.oderItem.proInfo.img,
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
            itemWidget('Số lượng', widget.oderItem.quan),
            itemWidget('Ship nội địa (¥)', widget.oderItem.feeShip),
            itemWidget('Tỷ giá (¥)', widget.oderItem.rateSell),
            itemWidget('Phí dịch vụ (¥) - ', widget.oderItem.feeService),
            itemWidget('Phí Bảo hiểm (¥)', widget.oderItem.feeInsurance),
            itemWidget('Ghi chú', widget.oderItem.notes),
            itemWidget('Tổng tiền (VNĐ)', widget.oderItem.totalMoney),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => WebViewExample(
                      url: widget.oderItem.proInfo.link,
                      isView: false,
                    )));
              },
              child: Center(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Center(
                    child: Text(
                      'Xem Link',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemWidget(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
