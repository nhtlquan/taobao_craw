import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/ResourceUtil.dart';
import 'package:flutter_app_test/Util/DateTimeUtil.dart';
import 'package:flutter_app_test/helper/ApiService.dart';
import 'package:flutter_app_test/model/WalletHistoryModel.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HistoryWalletPage extends StatefulWidget {
  @override
  _HistoryWalletPageState createState() => _HistoryWalletPageState();
}

class _HistoryWalletPageState extends State<HistoryWalletPage> {
  WalletHistoryModel walletHistoryModel;
  DateTime starTime;
  DateTime endTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryWallet();
  }



  @override
  Widget build(BuildContext context) {
    return PageWidget(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Lịch sử ví",
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
      child: Column(
        children: [
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
                      getHistoryWallet();
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
                      getHistoryWallet();
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
            child: ListView.builder(
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = walletHistoryModel.data[index];
                return createNotificationListItem(item);
              },
              itemCount: walletHistoryModel == null ? 0 : walletHistoryModel.data.length,
            ),
          ),
        ],
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

  Widget createNotificationListItem(History item) {
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
                item.note,
                style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 6, top: 5),
            child: Text(
              'Thời gian: ' + DateTimeUtil.getDateTimeStamp(int.parse(item.cdate)),
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

  getHistoryWallet() async {
    Map params = new Map<String, dynamic>();
    params['username'] = '0869993221';
    params['page'] = '1';
    params['len'] = 100;
    params['ftime'] = starTime == null ? '' : starTime.microsecondsSinceEpoch;
    params['ttime'] = endTime == null ? '' : starTime.millisecondsSinceEpoch;
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.getHistoryWallet(encryptString);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
      } else {
        walletHistoryModel = WalletHistoryModel.fromJson(json.decode(response.data));
        setState(() {});
      }
    }
  }
}
