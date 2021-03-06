import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/signup.dart';
import 'package:flutter_app_test/utils/CustomBorder.dart';
import 'package:flutter_app_test/utils/CustomColors.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app_test/model/UserInfo.dart';
import 'ResourceUtil.dart';
import 'Util/PreferUtil.dart';
import 'helper/ApiService.dart';
import 'MainPage.dart';
import 'helper/Constant.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  Stream get isLoadingStream => _isLoadingSubject.stream;

  TextEditingController loginEmailController;

  TextEditingController loginPasswordController;

  var username;

  var password;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isLoadingSubject.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginEmailController = new TextEditingController(text: '');
    loginPasswordController = new TextEditingController(text: '');
    initData();
  }

  initData() async {
    username = await PreferUtil.getString(Constant.KEY_USER_NAME);
    password = await PreferUtil.getString(Constant.KEY_PASSWORD);
    if (username.isNotEmpty & password.isNotEmpty) {
      login(isLogin : true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      streamLoading: isLoadingStream,
      child: Builder(builder: (context) {
        return Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image(
                    image: AssetImage("images/logo.jpg"),
                    color: Colors.blue,
                    height: 100,
                    alignment: Alignment.center,
                    width: 150),
                flex: 40,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: loginEmailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Số điện thoại",
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldMedium
                                .copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: Colors.grey)),
                      ),
                      Utils.getSizedBox(height: 20),
                      TextFormField(
                        controller: loginPasswordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Mật khẩu",
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldMedium
                                .copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: Colors.grey)),
                        obscureText: true,
                      ),
                      Utils.getSizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          onPressed: login,
                          child: Text(
                            "ĐĂNG NHẬP",
                            style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      Utils.getSizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Text(
                            "Quên mật khẩu?",
                            style: CustomTextStyle.textFormFieldBold.copyWith(color: Colors.blue, fontSize: 14),
                          ),
                        ),
                      ),
                      Utils.getSizedBox(height: 10),
                      Utils.getSizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Chưa có tài khoản?",
                            style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 14),
                          ),
                          Utils.getSizedBox(width: 4),
                          GestureDetector(
                            child: Text(
                              "Đăng ký",
                              style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 14, color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => SignUp()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                flex: 60,
              )
            ],
          ),
        );
      }),
    );
  }

  void login({isLogin = false}) async {
    FocusScope.of(context).unfocus();
    if (!isLogin) {
      username = loginEmailController.text.trim();
      password = loginPasswordController.text.trim();
    }
    print(password);
    if (username.isEmpty) {
      Util.showToast('Vui lòng nhập tên truy cập!');
      return;
    }
    if (password.isEmpty) {
      Util.showToast('Vui lòng nhập mật khẩu!');
      return;
    }
    onLoading(true);
    print('login ');
    Map params = new Map<String, String>();
    params['username'] = username;
    params['password'] = password;
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);

    final response = await ApiService.login(encryptString);
    onLoading(false);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
        Util.showToast('Đăng nhập không thành công');
      } else {
        await PreferUtil.setString(Constant.KEY_USER_NAME,username);
        await PreferUtil.setString(Constant.KEY_PASSWORD,password);
        Util.showToast('Đăng nhập thành công');
        Util.userInfo = UserInfo.fromJson(json.decode(response.data));
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Main()));
      }
    }
  }

  onLoading(bool isLoading) {
    _isLoadingSubject.sink.add(isLoading);
  }
}
