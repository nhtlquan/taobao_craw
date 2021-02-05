import 'dart:convert';

import 'package:auro_avatar/auro_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Util/PreferUtil.dart';
import 'package:flutter_app_test/helper/ApiService.dart';
import 'package:flutter_app_test/helper/Constant.dart';
import 'package:flutter_app_test/login.dart';
import 'package:flutter_app_test/model/list_profile_section.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/Util.dart';

import '../ResourceUtil.dart';
import 'AboutUsPage.dart';
import 'EditProfilePage.dart';
import 'InviteFriendsPage.dart';
import 'NotificationPage.dart';

class ProfilePage1 extends StatefulWidget {
  @override
  _ProfilePage1State createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  List<ListProfileSection> listSection = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection("Thông báo", "images/ic_notification.png", Colors.blue.shade800, NotificationPage()));
    listSection.add(createSection("About Us", "images/ic_about_us.png", Colors.black.withOpacity(0.8), AboutPage()));
    listSection.add(createSection("Đăng xuất", "images/ic_logout.png", Colors.red.withOpacity(0.7), null));
  }

  createSection(String title, String icon, Color color, Widget widget) {
    return ListProfileSection(title, icon, color, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomPadding: true,
      body: Builder(builder: (context) {
        return Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                      ),
                      top: -40,
                      left: -40,
                    ),
                    Positioned(
                      child: Container(
                        width: 300,
                        height: 260,
                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
                      ),
                      top: -40,
                      left: -40,
                    ),
                    Positioned(
                      child: Align(
                        child: Container(
                          width: 400,
                          height: 260,
                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
                        ),
                      ),
                      top: -40,
                      left: -40,
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  "Tài khoản",
                  style: CustomTextStyle.textFormFieldBold.copyWith(color: Colors.white, fontSize: 24),
                ),
                margin: EdgeInsets.only(top: 72, left: 24),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Card(
                              margin: EdgeInsets.only(top: 50, left: 16, right: 16),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.settings),
                                          iconSize: 24,
                                          color: Colors.black,
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          color: Colors.black,
                                          iconSize: 24,
                                          onPressed: () {
                                            // Navigator.push(context,
                                            //     new MaterialPageRoute(builder: (context) => EditProfilePage()));
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    Util.userInfo.data.username,
                                    style: CustomTextStyle.textFormFieldBlack
                                        .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    Util.userInfo.data.email,
                                    style: CustomTextStyle.textFormFieldMedium
                                        .copyWith(color: Colors.grey.shade700, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    height: 2,
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                  ),
                                  buildListView()
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 100,
                              height: 100,
                              child: InitialNameAvatar(
                                Util.userInfo.data.username,
                                circleAvatar: true,
                                borderColor: Colors.white,
                                borderSize: 2.0,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: 10.0,
                                textSize: 32.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 75,
                  ),
                  Expanded(
                    child: Container(),
                    flex: 05,
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () async {
              print(index);
              if (index == 2) {
                await removeToken();
                await PreferUtil.setString(Constant.KEY_USER_NAME, '');
                await PreferUtil.setString(Constant.KEY_PASSWORD, '');
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Login()));
              }
            },
            child: createListViewItem(listSection[index]));
      },
      itemCount: listSection.length,
    );
  }
  void removeToken() async{
    Map params = new Map<String, dynamic>();
    params['username'] = Util.userInfo.data.username;
    params['driver_id'] = Util.tokenFireBase;
    if (Platform.isAndroid) {
      params['driver_type'] = 'Android';
    } else if (Platform.isIOS) {
      params['driver_type'] = 'Ios';
    }
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.removeTokenNotifi(encryptString);
  }
  Widget createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 12),
        padding: EdgeInsets.only(top: 20, bottom: 12),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(listSection.icon),
              width: 20,
              height: 20,
              color: Colors.grey.shade500,
            ),
            SizedBox(
              width: 14,
            ),
            Text(
              listSection.title,
              style: CustomTextStyle.textFormFieldBold.copyWith(color: Colors.grey.shade500),
            ),
            Spacer(
              flex: 1,
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.grey.shade500,
            )
          ],
        ),
      );
    });
  }
}
