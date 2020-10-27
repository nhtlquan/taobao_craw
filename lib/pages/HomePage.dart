import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/pages/WebViewPage.dart';
import 'package:flutter_app_test/utils/CustomBorder.dart';
import 'package:flutter_app_test/utils/CustomColors.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/ResourceUtil.dart';
import 'package:flutter_app_test/widget/HeaderWidget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ProductDetailsPage.dart';
import 'SeeAllProductPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listImage = new List();
  List<String> listShoesImage = new List();
  int selectedSliderPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderImage();
    shoesImage();
  }

  void sliderImage() {
    listImage.add("images/slider1.jpg");
    listImage.add("images/slider2.jpg");
    listImage.add("images/slider.jpg");
  }

  void shoesImage() {
    listShoesImage.add("https://static.meeyland.com/articles/meeyland-bank-techcombank.1597661141120.png");
    listShoesImage.add("https://static.meeyland.com/articles/meeyland-bank-vietcombank.1597661206122.png");
    listShoesImage.add("https://static.meeyland.com/articles/meeyland-bank-pvcombank.1597661206121.png");
    listShoesImage.add("https://static.meeyland.com/articles/meeyland-bank-logo-acb.1597661206120.png");
    listShoesImage.add("https://static.meeyland.com/articles/meeyland-bank-tpb.1597661206121.png");
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
                        padding: const EdgeInsets.only(top: 16, left: 16),
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
                    return createGroupBuyListItem(listShoesImage[index], index);
                  },
                  itemCount: listShoesImage.length,
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

  createGroupBuyListItem(String image, int index) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        elevation: 0.6,
        child: Container(
          padding: EdgeInsets.all(13),
          child: Row(
            children: <Widget>[
              Image.network(
                image,
                fit: BoxFit.fill,
                width: 60,
                height: 40,
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
                        "Le Van Quan",
                        style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.black, fontSize: 14),
                      ),
                      Utils.getSizedBox(height: 4),
                      Text(
                        "1236547894455",
                        style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.black, fontSize: 12),
                      ),
                      Utils.getSizedBox(height: 4),
                      Text(
                        "Ngan Hang VietCombank",
                        style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.copy,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _operationsWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 10),
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

  createMostBigListItem(String image, int index, BuildContext context) {
    double leftMargin = 0;
    double rightMargin = 0;
    double radius = 16;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              fit: BoxFit.fill,
              width: 80,
              height: 80,
            ),
            Expanded(
              flex: 25,
              child: Container(
                padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
                width: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Utils.getSizedBox(height: 8),
                    Text(
                      "NIKE Kyire II",
                      style: CustomTextStyle.textFormFieldSemiBold
                          .copyWith(color: Colors.black.withOpacity(.7), fontSize: 12),
                    ),
                    Utils.getSizedBox(height: 4),
                    Text(
                      "Exquisite you need him",
                      style: CustomTextStyle.textFormFieldSemiBold
                          .copyWith(color: Colors.black.withOpacity(.7), fontSize: 10),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius))),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => ProductDetailsPage("$image,$index")));
      },
    );
  }

  searchWidget() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10), child: SearchBar('Nhập mã vận đơn'));
  }
}
