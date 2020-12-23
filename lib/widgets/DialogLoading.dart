import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import '../ResourceUtil.dart';

class DialogLoading extends StatelessWidget {
  DialogLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black45,
        ),
        Center(
          child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: CircularProgressIndicator(backgroundColor: Colors.blue,valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),),
          ),
        ),
      ],
    );
  }

}
