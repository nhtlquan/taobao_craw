import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/utils/CustomBorder.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image(
                  image: AssetImage("images/ic_logo.png"),
                  color: Colors.blue,
                  height: 140,
                  alignment: Alignment.center,
                  width: 200),
              flex:40,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Tên đăng nhập",
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular
                                .copyWith(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            16,
                                    color: Colors.black)),
                        keyboardType: TextInputType.text),
                    Utils.getSizedBox(height: 20),
                    TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Số điện thoại",
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular
                                .copyWith(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            16,
                                    color: Colors.black)),
                        keyboardType: TextInputType.number),
                    Utils.getSizedBox(height: 20),
                    TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Email",
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular
                                .copyWith(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            16,
                                    color: Colors.black)),
                        keyboardType: TextInputType.emailAddress),
                    Utils.getSizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                          border: CustomBorder.enabledBorder,
                          labelText: "Mật khẩu",
                          hasFloatingPlaceholder: true,
                          focusedBorder: CustomBorder.focusBorder,
                          errorBorder: CustomBorder.errorBorder,
                          enabledBorder: CustomBorder.enabledBorder,
                          labelStyle: CustomTextStyle.textFormFieldRegular
                              .copyWith(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16,
                                  color: Colors.black)),
                      obscureText: true,
                    ),
                    Utils.getSizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        onPressed: () {},
                        child: Text(
                          "ĐĂNG KÝ",
                          style: CustomTextStyle.textFormFieldRegular
                              .copyWith(color: Colors.white, fontSize: 14),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 50,
            )
          ],
        ),
      ),
    );
  }
}
