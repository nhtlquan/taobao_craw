//System
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:flutter_app_test/model/ModelProduct.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:translator/translator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:html/parser.dart';
import 'dart:convert' show utf8;

import 'ChoiseProduct1688.dart';

class WebViewExample extends StatefulWidget {
  var url;
  bool isView;

  WebViewExample({Key key, @required this.url, this.isView = false}) : super(key: key);

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  WebViewController _myController;
  bool _loadedPage = false;
  var dataJS = '';
  var text = '';
  var isPageDetail = false;
  var _isPageDetailSubject = new BehaviorSubject<bool>.seeded(false);

  Stream get isPageDetailStream => _isPageDetailSubject.stream;
  var _headerSubject = new BehaviorSubject<bool>.seeded(false);

  Stream get headerStream => _headerSubject.stream;
  var currentURL = '';
  var _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  Stream get isLoadingStream => _isLoadingSubject.stream;
  ModelProduct modelProduct1688;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isPageDetailSubject.close();
    _headerSubject.close();
    _isLoadingSubject.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAsset();
    setState(() {
      _loadedPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      streamLoading: isLoadingStream,
      child: Builder(builder: (BuildContext context) {
        return Column(
          children: [
            StreamBuilder<Object>(
                stream: headerStream,
                builder: (context, snapshot) {
                  return headerBar();
                }),
            Expanded(
              child: new Stack(
                children: <Widget>[
                  new WebView(
                    initialUrl: widget.url,
                    debuggingEnabled: true,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      _myController = controller;
                    },
                    onPageStarted: (url) {
                      currentURL = url;
                      changeViewBottom(url);
                    },
                    javascriptChannels: [
                      JavascriptChannel(
                          name: 'Android',
                          onMessageReceived: (JavascriptMessage message) {
                            addItem(message.message);
                          }),
                    ].toSet(),
                    onPageFinished: (url) {
                      setState(() {
                        _loadedPage = true;
                      });
                      if(checkWebb1688())
                        return;
                      _myController.evaluateJavascript(text);
                      changeDataWebview(url);
                    },
                  ),
                  _loadedPage == false
                      ? new Center(
                          child: new CircularProgressIndicator(backgroundColor: Colors.green),
                        )
                      : new Container(),
                ],
              ),
            ),
            StreamBuilder<Object>(
                stream: isPageDetailStream,
                builder: (context, snapshot) {
                  if(widget.isView)
                    return SizedBox();
                  if (!isPageDetail )
                    return Container(
                      width: double.infinity,
                      height: 40,
                    );
                  return InkWell(
                    onTap: () async {
                      getDataInformation();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      color: Colors.green,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              checkWebb1688() ?'CHỌN SẢN PHẨM':'THÊM VÀO GIỎ HÀNG',
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        );
      }),
    );
  }

  void loadAsset() async {
    dataJS = await rootBundle.loadString('data/jsdata.txt');
    var bytes = utf8.encode(dataJS);
    var base64Str = base64.encode(bytes);
    text = "javascript:(function() {" +
        "var parent = document.getElementsByTagName('head').item(0);" +
        "var script = document.createElement('script');" +
        "script.type = 'text/javascript';" +
        "script.innerHTML = window.atob('" +
        base64Str +
        "');" +
        "parent.appendChild(script)" +
        "})()";
  }

  void changeViewBottom(String url) {
    if (url.contains("https://m.1688.com/offer/")) {
      isPageDetail = true;
    } else if (url.contains("taobao.com/detail/detail.html")) {
      isPageDetail = true;
    } else if (url.contains("detail.m.tmall.com/item.htm")) {
      isPageDetail = true;
    } else if (url.contains("https://s.m.taobao.com/h5?q")) {
      isPageDetail = true;
    } else {
      isPageDetail = false;
    }
    _isPageDetailSubject.sink.add(true);
  }

  void changeDataWebview(url) {
    if (url.contains("https://m.1688.com/offer/") && url.contains("spm")) {
      _myController.evaluateJavascript("javascript:changeData1688()");
    } else if (url.contains("taobao.com/detail/detail.html")) {
      _myController.evaluateJavascript("javascript:changeDataTaobao()");
    } else if (url.contains("detail.m.tmall.com/item.htm")) {
      _myController.evaluateJavascript("javascript:changeDataTaobao()");
    } else if (url.contains("https://s.m.taobao.com/h5?q")) {
      _myController.evaluateJavascript("javascript:removeElement()");
    } else if (url.contains("https://list.tmall.com/search_product.htm?q")) {
      _myController.evaluateJavascript("javascript:removeElementTmall()");
    } else if (url.contains("https://m.1688.com/offer/")) {
      _myController.evaluateJavascript("javascript:removeElement1688()");
    }
  }

  bool checkWebb1688(){
      return  currentURL.contains('https://m.1688.com/offer/');
  }

  void getDataInformation() async {
    if (currentURL.contains('https://m.1688.com/offer/')) {
      String docu = await _myController.evaluateJavascript('document.documentElement.innerHTML');
      //
      String decoded = json.decode(docu);
      var content = decoded.split('window.__INIT_DATA=')[1];
      print('content: ' + content);
      List<String> content1 = content.split("</script>");
      var data = content1[0].replaceAll('window.__INIT_DATA=', '');

      data = _parseHtmlString(data);
      print('data: ' + data);
      modelProduct1688 = ModelProduct.fromJson(json.decode(data));
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => ChoiseProduct1688(
            modelProduct: modelProduct1688,
            linkproduct: currentURL,
          )));
    }
    else
      _myController.evaluateJavascript("javascript:getDetailsInfomation()");
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  void addItem(String data) async {
    print(data);
    ItemDetail itemDetail = ItemDetail.fromJson(json.decode(data));
    if ((itemDetail.property == null && itemDetail.orders.isEmpty) || itemDetail.property == '1') {
      Util.showToast('Bạn vui lòng chọn đầy đủ màu sắc kích cỡ');
      openPopupProperty();
      return;
    }
    onLoading(true);

    final translator = GoogleTranslator();
    var title = await translator.translate(itemDetail.titleOrigin, to: 'vi', from: 'zh-cn');

    itemDetail.titleOrigin = title.text;
    _headerSubject.sink.add(null);
    if (itemDetail.orders.isNotEmpty) {
      for (var item in itemDetail.orders) {
        ItemDetail itemDetailSub = ItemDetail.fromJson(json.decode(data));
        itemDetailSub.property = (item.color + '; ' + item.size);
        itemDetailSub.color = item.color;
        itemDetailSub.size = item.size;
        itemDetailSub.link = currentURL;
        itemDetailSub.priceOrigin = item.price.isEmpty ? itemDetail.priceOrigin : item.price.replaceAll('￥', '');
        itemDetailSub.pricePromotion = item.price.isEmpty ? itemDetail.pricePromotion : item.price.replaceAll('￥', '');
        print(title);
        itemDetailSub.titleOrigin = title.text;
        Util.listItems.add(itemDetailSub);
      }
    } else {
      itemDetail.link = currentURL;
      Util.listItems.add(itemDetail);
    }
    for (var item in Util.listItems) {
      print(item.property);
    }
    onLoading(false);
    Util.showToast('Thêm vào giỏ hàng thành công!');
    Util.gioHangSubject.sink.add(null);
  }

  void openPopupProperty() {
    print(currentURL);
    if (currentURL.contains("https://m.1688.com/offer/")) {
      _myController.evaluateJavascript("javascript:openPopupProperty1688()");
    } else if (currentURL.contains("taobao.com/detail/detail.html")) {
      _myController.evaluateJavascript("javascript:openPopupPropertyTaobao()");
    } else if (currentURL.contains("detail.m.tmall.com/item.htm")) {
      _myController.evaluateJavascript("javascript:openPopupPropertyTaobao()");
    }
  }

  Widget headerBar() {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: !_loadedPage
                  ? null
                  : () async {
                      if (await _myController.canGoBack()) {
                        await _myController.goBack();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No back history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: !_loadedPage
                  ? null
                  : () async {
                      if (await _myController.canGoForward()) {
                        await _myController.goForward();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No forward history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay, color: Colors.white),
              onPressed: !_loadedPage
                  ? null
                  : () {
                      _myController.reload();
                    },
            ),
            Spacer(),
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: StreamBuilder<Object>(
                          stream: Util.gioHangStream,
                          builder: (context, snapshot) {
                            return Text(
                              Util.listItems.length.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            );
                          }
                        ),
                      ),
                    ),
                  )
                ],
              ),
              onPressed: !_loadedPage
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
            ),
          ],
        ),
      ),
    );
  }

  onLoading(bool isLoading) {
    _isLoadingSubject.sink.add(isLoading);
  }
}
