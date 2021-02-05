import 'package:auro_avatar/auro_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/pages/NotificationPage.dart';
import 'package:flutter_app_test/utils/ResourceUtil.dart';
import 'package:flutter_app_test/utils/Util.dart';

const heightAppBar = 140;

class HeaderWidget extends StatelessWidget {
  HeaderWidget();

  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        child: Container(
          width: double.infinity,
          height: heightAppBar + MediaQuery.of(context).padding.top,
          child: Image.asset(
            ResourceUtil.image("header.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        right: 24,
        top: 24,
        child: SafeArea(
          child: InkWell(
            onTap: (){
               Navigator.push(context, new MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 24,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 60,
                height: 60,
                child: InitialNameAvatar(
                  Util.userInfo.data.username,
                  circleAvatar: true,
                  borderColor: Colors.white,
                  borderSize: 2.0,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: 10.0,
                  textSize: 18.0,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'Xin chào, ',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                        new TextSpan(
                            text: Util.userInfo.data.name,
                            style: new TextStyle(
                                fontSize: 18, height: 1, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
                      ],
                    ),
                  ),
                  RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'Số dư: ',
                            style: new TextStyle(
                                fontSize: 16, height: 1.5, fontWeight: FontWeight.normal, color: Colors.white)),
                        new TextSpan(
                            text: '0',
                            style: new TextStyle(
                                fontSize: 16, height: 1.5, fontWeight: FontWeight.normal, color: Colors.greenAccent)),
                        new TextSpan(
                            text: ' đ',
                            style: new TextStyle(
                                fontSize: 16, height: 1.5, fontWeight: FontWeight.normal, color: Colors.white)),
                      ],
                    ),
                  ),
                  RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(fontSize: 16.0, color: Colors.white, height: 1.3),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'Tỷ giá: ',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal)),
                        new TextSpan(
                            text: Util.intToPriceDouble(Util.configGlobal==null?0:Util.configGlobal.data.rate), style:
                        new
                        TextStyle(fontWeight:
                        FontWeight.normal,
                            color: Colors.greenAccent)),
                        new TextSpan(
                            text: ' đ/Y', style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.white)),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                ],
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class AppBarWidget extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String subTitle;
  final TextStyle subTitleStyle;
  final bool isIconLeading;
  final String iconAction;

  AppBarWidget(
    this.title, {
    this.titleStyle,
    this.subTitle,
    this.subTitleStyle,
    this.isIconLeading,
    this.iconAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isIconLeading == true
            ? Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: const Color(0xff0d50b0),
                  ),
                ),
              )
            : Container(),
        Container(
          margin: EdgeInsets.only(left: 16, top: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: titleStyle),
              Text(subTitle ?? "", style: subTitleStyle),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  final String hintText;
  final Function submitted;
  TextEditingController controller = TextEditingController();

  SearchBar(this.hintText, {this.submitted});

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            icon: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                  size: 24,
                )),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          onChanged: (val) {
            submitted(val);
          },
          onSubmitted: (val) {
            submitted(val);
            controller.clear();
          },
        ));
  }
}
