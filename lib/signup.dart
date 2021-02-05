import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/utils/CustomBorder.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';
import 'package:rxdart/rxdart.dart';

import 'ResourceUtil.dart';
import 'helper/ApiService.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  Stream get isLoadingStream => _isLoadingSubject.stream;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupPhoneController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isLoadingSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      streamLoading: isLoadingStream,
      resizeToAvoidBottomPadding: true,
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SafeArea(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black45,
                        size: 38,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Image(
                  image: AssetImage("images/logo.jpg"),
                  color: Colors.blue,
                  height: 100,
                  alignment: Alignment.center,
                  width: 150),
              flex: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: signupNameController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Họ và tên",
                            prefixIcon: Icon(Icons.people),
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular.copyWith(
                                fontSize: MediaQuery.of(context).textScaleFactor * 16,
                                color: Colors.black.withOpacity(0.5))),
                        keyboardType: TextInputType.text),
                    Utils.getSizedBox(height: 20),
                    TextFormField(
                        controller: signupPhoneController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Số điện thoại",
                            prefixIcon: Icon(Icons.phone),
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular.copyWith(
                                fontSize: MediaQuery.of(context).textScaleFactor * 16,
                                color: Colors.black.withOpacity(0.5))),
                        keyboardType: TextInputType.number),
                    Utils.getSizedBox(height: 20),
                    TextFormField(
                        controller: signupEmailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Email",
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular.copyWith(
                                fontSize: MediaQuery.of(context).textScaleFactor * 16,
                                color: Colors.black.withOpacity(0.5))),
                        keyboardType: TextInputType.emailAddress),
                    Utils.getSizedBox(height: 20),
                    TextFormField(
                      controller: signupPasswordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                          border: CustomBorder.enabledBorder,
                          labelText: "Mật khẩu",
                          hasFloatingPlaceholder: true,
                          focusedBorder: CustomBorder.focusBorder,
                          errorBorder: CustomBorder.errorBorder,
                          enabledBorder: CustomBorder.enabledBorder,
                          labelStyle: CustomTextStyle.textFormFieldRegular.copyWith(
                              fontSize: MediaQuery.of(context).textScaleFactor * 16,
                              color: Colors.black.withOpacity(0.5))),
                      obscureText: true,
                    ),
                    Utils.getSizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        onPressed: register,
                        child: Text(
                          "ĐĂNG KÝ",
                          style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ),
                  ],
                ),
              ),
              flex:60,
            )
          ],
        ),
      ),
    );
  }

  void register() async {
    FocusScope.of(context).unfocus();
    var username = signupEmailController.text.trim();
    var password = signupPasswordController.text.trim();
    var fullname = signupNameController.text.trim();
    var phone = signupPhoneController.text.trim();
    if (username.isEmpty) {
      Util.showToast('Vui lòng nhập Email!');
      return;
    }
    if (password.isEmpty) {
      Util.showToast('Vui lòng nhập mật khẩu!');
      return;
    }
    if (fullname.isEmpty) {
      Util.showToast('Vui lòng nhập họ tên!');
      return;
    }
    if (phone.isEmpty) {
      Util.showToast('Vui lòng nhập số điện thoại!');
      return;
    }
    onLoading(true);
    Map params = new Map<String, String>();
    params['email'] = username;
    params['password'] = password;
    params['fullname'] = fullname;
    params['phone'] = phone;
    print(params);
    var encryptString = await ResourceUtil.stringEncryption(params);
    final response = await ApiService.register(encryptString);
    onLoading(false);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if (data['status'] == 'no') {
        Util.showToast(data['mess']);
      } else {
        Util.showToast('Register success');
        Navigator.pop(context);
      }
    }
  }

  onLoading(bool isLoading) {
    _isLoadingSubject.sink.add(isLoading);
  }
}
