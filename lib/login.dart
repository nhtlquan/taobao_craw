import 'package:flutter/material.dart';
import 'package:flutter_app_test/signup.dart';
import 'package:flutter_app_test/utils/CustomBorder.dart';
import 'package:flutter_app_test/utils/CustomColors.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Builder(builder: (context) {
        return Container(
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
                flex: 40,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Tên đăng nhập",
                            hasFloatingPlaceholder: true,
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldMedium
                                .copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: Colors.grey)),
                      ),
                      Utils.getSizedBox(height: 20),
                      TextFormField(
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

                          onPressed: () {
                            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Home()));
                          },
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
                      // Row(
                      //   children: <Widget>[
                      //     Expanded(
                      //       child: Container(
                      //         color: Colors.grey.shade200,
                      //         margin: EdgeInsets.only(right: 16),
                      //         height: 1,
                      //       ),
                      //       flex: 40,
                      //     ),
                      //     Text(
                      //       "Or",
                      //       style: CustomTextStyle.textFormFieldMedium
                      //           .copyWith(fontSize: 14),
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         color: Colors.grey.shade200,
                      //         margin: EdgeInsets.only(left: 16),
                      //         height: 1,
                      //       ),
                      //       flex: 40,
                      //     )
                      //   ],
                      // ),
                      // Utils.getSizedBox(height: 14),
                      // Container(
                      //   width: double.infinity,
                      //   child: RaisedButton(
                      //     onPressed: () {},
                      //     child: Text(
                      //       "FACEBOOK LOGIN",
                      //       style: CustomTextStyle.textFormFieldMedium
                      //           .copyWith(color: Colors.white, fontSize: 14),
                      //     ),
                      //     color: CustomColors.COLOR_FB,
                      //     textColor: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(4))),
                      //   ),
                      // ),
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
}
