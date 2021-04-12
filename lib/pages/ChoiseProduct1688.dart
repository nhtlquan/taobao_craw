import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:flutter_app_test/model/ModelProduct.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:flutter_app_test/widgets/PageWidget.dart';
import 'package:translator/translator.dart';

class ChoiseProduct1688 extends StatefulWidget {
  ModelProduct modelProduct;
  String linkproduct;

  ChoiseProduct1688({this.modelProduct, this.linkproduct});

  @override
  _ChoiseProduct1688State createState() => _ChoiseProduct1688State();
}

class _ChoiseProduct1688State extends State<ChoiseProduct1688> {
  String image = '';
  String property = '';
  int canBookCount;
  String price = '';
  SkuInfoMap skuInfoMap;
  List<SkuInfoMap> listSkuInfoMap;
  int currentProduct;
  int quantity = 1;
  var priceVND = '';
  String title = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();
    listSkuInfoMap = widget.modelProduct.globalData.skuModel.skuInfoMap.values.toList();
    listSkuInfoMap.removeWhere((element) => element.canBookCount == 0);
    price = widget.modelProduct.globalData.skuModel.skuPriceScale.replaceFirst('￥', '');
    image = widget.modelProduct.globalData.tempModel.defaultOfferImg;
    print(widget.modelProduct.globalData.skuModel.skuInfoMap.length);
  }

  initData() async{
    final translator = GoogleTranslator();
    var data = await translator.translate(widget.modelProduct.globalData.tempModel.offerTitle, to: 'vi', from: 'zh-cn');
    title =data.text;
    setState(() {

    });
  }

  changeProduct() {
    skuInfoMap = listSkuInfoMap[currentProduct];
    image = findImageByName(skuInfoMap.specAttrs);
    if (skuInfoMap.price != null)
      price = skuInfoMap.price;
    else
      price = widget.modelProduct.globalData.tempModel.price;
    canBookCount = skuInfoMap.canBookCount;
    property = skuInfoMap.specAttrs;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (skuInfoMap != null) priceVND = Util.intToPriceDouble(double.parse(price) * Util.moneyRate);
    return PageWidget(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Chọn Sản Phẩm",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    'Thông tin: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  image,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Đơn Giá: ￥' + (price ?? '') + (priceVND.isNotEmpty ? ' ($priceVND đ)' : ''),
                        style: TextStyle(color: Colors.orange),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (property.isNotEmpty) Text('Thuộc tính: ' + property),
                      SizedBox(
                        height: 5,
                      ),
                      if (canBookCount != null) Text('Kho: ' + canBookCount.toString()),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Sản phẩm: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.count(
                      // crossAxisCount is the number of columns
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // This creates two columns with two items in each column
                      children: List.generate(listSkuInfoMap.length, (index) {
                        return itemList(index);
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Số lượng'),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (quantity == 0) return;
                          quantity = quantity - 1;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50)),
                          child: Icon(Icons.remove, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(quantity.toString()),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          quantity = quantity + 1;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50)),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      if (skuInfoMap == null) {
                        Util.showToast('Vui lòng chọn sản phẩm!');
                        return;
                      }
                      ItemDetail itemDetail = new ItemDetail();
                      itemDetail.property = property;
                      itemDetail.quantity = quantity.toString();
                      itemDetail.titleOrigin = title;
                      itemDetail.nameshop = widget.modelProduct.globalData.tempModel.companyName;
                      itemDetail.shopId = widget.modelProduct.globalData.tempModel.sellerMemberId;
                      itemDetail.itemId = widget.modelProduct.globalData.tempModel.offerId;
                      itemDetail.pricePromotion = price;
                      itemDetail.priceOrigin = price;
                      itemDetail.img = image;
                      itemDetail.imageOrigin = image;
                      itemDetail.link = widget.linkproduct;
                      itemDetail.size = property;
                      Util.listItems.add(itemDetail);
                      Util.showToast('Thêm vào giỏ hàng thành công!');
                      Util.gioHangSubject.sink.add(null);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green,
                      ),
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
                              'THÊM VÀO GIỎ HÀNG',
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemList(int i) {
    return InkWell(
      onTap: () {
        currentProduct = i;
        changeProduct();
      },
      child: Container(
        height: 30,
        margin: EdgeInsets.only(bottom: 10, right: 0, left: 5),
        padding: EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: currentProduct == i ? Colors.blue : Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              findImageByName(listSkuInfoMap[i].specAttrs),
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
              child: Text(
                listSkuInfoMap[i].specAttrs,
                style: TextStyle(fontSize: 14, color: currentProduct == i ? Colors.white : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  findImageByName(String name) {
    for (var item in widget.modelProduct.globalData.skuModel.skuProps[0].value) {
      if (name.contains(item.name) && item.imageUrl!=null  && item.imageUrl.isNotEmpty) return item.imageUrl ;
    }
    return widget.modelProduct.globalData.tempModel.defaultOfferImg;
  }
}
