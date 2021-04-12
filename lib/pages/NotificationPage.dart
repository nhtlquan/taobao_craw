import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/ResourceUtil.dart';
import 'package:flutter_app_test/Util/DateTimeUtil.dart';
import 'package:flutter_app_test/helper/ApiService.dart';
import 'package:flutter_app_test/model/NotificationModel.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationModel notificationModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotification();
  }

  getNotification() async {
    Map params = new Map<String, dynamic>();
    params['username'] = Util.userInfo.data.username;
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.getNotification(encryptString);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
      } else {
        notificationModel = NotificationModel.fromJson(json.decode(response.data));
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Thông báo",
          style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 18,color: Colors.white),
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
      child: ListView.builder(
        itemBuilder: (context, index) {
          var item = notificationModel.data[index];
          return createNotificationListItem(item);
        },
        itemCount: notificationModel==null?0:notificationModel.data.length,
      ),
    );
  }

  /*createItem(){
    return ListTile(
      title: Text(
        "Payment Complete",
        style: CustomTextStyle.textFormFieldBlack
            .copyWith(color: Colors.black, fontSize: 16),
      ),
      isThreeLine: true,
      trailing: IconButton(icon: Icon(Icons.close), onPressed: () {}),
      subtitle: Text(
        "Thank you for your recent payment. Your monthly subscription has been activated until June 2020.",
        softWrap: true,
        style: CustomTextStyle.textFormFieldMedium
            .copyWith(color: Colors.grey,fontSize: 14),
      ),
    );
  }*/

  Widget createNotificationListItem(Datum item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                item.title,
                style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 6, top: 5),
            child: Text(
                item.contents,
              softWrap: true,
              textAlign: TextAlign.start,
              style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 12),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 6, top: 5),
            child: Text(
               DateTimeUtil.getDateTimeStamp(int.parse(item.cdate)),
              softWrap: true,
              textAlign: TextAlign.start,
              style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 12),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 0.3,
              color: Colors.grey.withOpacity(0.5)
          )
        ],
      ),
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
