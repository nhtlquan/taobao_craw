import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/helper/ApiService.dart';
import 'package:flutter_app_test/model/ConfigGlobal.dart';
import 'package:flutter_app_test/pages/WebViewPage.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/ResourceUtil.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widget/HeaderWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SeeAllProductPage.dart';
import 'package:flutter_app_test/ResourceUtil.dart' as SUB;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedSliderPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConfig();
  }

  getConfig() async {
    Util.listOderType.add(new TypeOder('', 'Tất cả'));
    Util.listOderType.add(new TypeOder('0', 'Đơn chờ xử lý'));
    Util.listOderType.add(new TypeOder('1', 'Đơn chờ cọc'));
    Util.listOderType.add(new TypeOder('2', 'Đơn chờ phát'));
    Util.listOderType.add(new TypeOder('3', 'Đang vận chuyển'));
    Util.listOderType.add(new TypeOder('4', 'Đơn đã về VN'));
    Util.listOderType.add(new TypeOder('5', 'Lưu kho'));
    Util.listOderType.add(new TypeOder('6', 'Đã thanh toán'));
    Util.listOderType.add(new TypeOder('-1', 'Đơn bị hủy'));
    Map params = new Map<String, dynamic>();
    var encryptString = await SUB.ResourceUtil.stringEncryption(params);
    final response = await ApiService.systemConfig(encryptString);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
      } else {
        Util.configGlobal = ConfigGlobal.fromJson(json.decode(response.data));
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderWidget(),
                /*Slider Section*/
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, left: 16),
                //   child: Text(
                //     "KHUYẾN MẠI ",
                //     style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.black, fontSize: 16),
                //   ),
                // ),
                // Utils.getSizedBox(height: 10),
                // Container(
                //   child: Container(
                //     height: 200,
                //     child: PageView.builder(
                //       itemBuilder: (context, position) {
                //         return createSlider(listImage[position]);
                //       },
                //       allowImplicitScrolling: true,
                //       controller: PageController(viewportFraction: 0.95),
                //       itemCount: listImage.length,
                //       onPageChanged: (position) {
                //         /*setState(() {
                //           selectedSliderPosition = position;
                //         });*/
                //       },
                //     ),
                //   ),
                // ),
                _operationsWidget(context),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => SeeAllProductPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 16),
                        child: Text(
                          "Tra cứu",
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Utils.getSizedBox(height: 10),
                searchWidget(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => SeeAllProductPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 16),
                        child: Text(
                          "Tài khoản ngân hàng",
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Utils.getSizedBox(height: 10),
                /*Group By Product Listing*/
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return createGroupBuyListItem(Util.configGlobal.data.bankList[index], index);
                  },
                  itemCount: Util.configGlobal == null ? 0 : Util.configGlobal.data.bankList.length,
                ),
                Utils.getSizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  createSlider(String image) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      ),
    );
  }

  createGroupBuyListItem(BankList bankList, int index) {
    return InkWell(
      onTap: () {
        Clipboard.setData(new ClipboardData(text: bankList.stk));
        Util.showToast('Đã sao chép');
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, right: 20, left: 20),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          elevation: 0.6,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 80,
                  height: 50,
                  child: SvgPicture.network(
                    bankList.logo,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Utils.getSizedBox(height: 8),
                        Text(
                          bankList.name,
                          style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.black, fontSize: 14),
                        ),
                        Utils.getSizedBox(height: 4),
                        Text(
                          bankList.stk,
                          style: CustomTextStyle.textFormFieldRegular
                              .copyWith(decoration: TextDecoration.underline, color: Colors.blueAccent, fontSize: 12),
                        ),
                        Utils.getSizedBox(height: 4),
                        Text(
                          bankList.nh,
                          style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.black, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.copy,
                  size: 18,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _operationsWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => WebViewExample(
                          url: 'https://m.1688.com',
                        )));
              },
              child: _icon(ResourceUtil.image('logo_1688.png'), '1688', context)),
          InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => WebViewExample(
                          url: 'https://www.tmall.com/',
                        )));
              },
              child: _icon(ResourceUtil.image('logo_tmall.webp'), 'Tmail', context)),
          InkWell(
              onTap: () async {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => WebViewExample(
                          url: 'https://main.m.taobao.com/',
                        )));
              },
              child: _icon(ResourceUtil.image('logo_taobao.webp'), 'Taobao', context))
        ],
      ),
    );
  }

  Widget _icon(String icon, String text, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Image.asset(
            icon,
            fit: BoxFit.fill,
            width: 60,
            height: 60,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(text,
            style: GoogleFonts.muli(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ],
    );
  }

  searchWidget() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10), child: SearchBar('Nhập mã vận đơn'));
  }
}
