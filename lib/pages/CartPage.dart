import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

import 'CheckOutPage.dart';
import 'WebViewPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalMoney = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return SafeArea(
              child: Column(
            children: <Widget>[
              createHeader(),
              SizedBox(
                height: 10,
              ),
              createCartList()
            ],
          ));
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moneyTotal();
  }

  moneyTotal() {
    for (var item in Util.listItems) {
      totalMoney = totalMoney + double.parse(item.priceOrigin) * Util.moneyRate * int.parse(item.quantity);
    }
    setState(() {});
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Tổng",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  Util.intToPriceDouble(totalMoney) + ' đ',
                  style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    var size = Util.listItems.length;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Giỏ Hàng",
                style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 21, color: Colors.black),
              ),
              margin: EdgeInsets.only(left: 12, top: 12),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tổng ($size) : ",
                    style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  margin: EdgeInsets.only(
                    left: 12,
                  ),
                ),
                Text(
                  Util.intToPriceDouble(totalMoney) + ' đ',
                  style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => CheckOutPage()));
          },
          color: Colors.green,
          padding: EdgeInsets.only(top: 8, left: 30, right: 30, bottom: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Text(
            "Mua hàng",
            style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  createCartList() {
    return Expanded(
      child: GroupedListView<ItemDetail, String>(
        elements: Util.listItems,
        shrinkWrap: true,
        groupBy: (element) => element.nameshop,
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) => item1.titleOrigin.compareTo(item2.titleOrigin),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: false,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        itemBuilder: (c, element) {
          return InkWell(
              onTap: () {
                print(element.link);
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => WebViewExample(
                          url: element.link,
                          isView: true,
                        )));
              },
              child: createCartListItem(element));
        },
      ),
    );
  }

  Widget createCartListItem(ItemDetail item) {
    var priceVND = Util.intToPriceDouble(double.parse(item.priceOrigin) * Util.moneyRate);
    var totalPrice = Util.intToPriceDouble(double.parse(item.priceOrigin) * int.parse(item.quantity));
    var priceTotalVND =
        Util.intToPriceDouble(double.parse(item.priceOrigin) * Util.moneyRate * int.parse(item.quantity));
    return Stack(
      children: <Widget>[
        Container(
          height: 120,
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
          child: Material(
            color: Colors.white,
            elevation: 0.5,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Image.network(
                  item.img,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            item.titleOrigin,
                            maxLines: 1,
                            softWrap: true,
                            style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 12, color: Colors.blue),
                          ),
                        ),
                        Utils.getSizedBox(height: 6),
                        Text(
                          item.property,
                          maxLines: 1,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                        Utils.getSizedBox(height: 6),
                        Text(
                          'Số lượng: ' + item.quantity + ' x ' + priceVND + ' ($totalPrice ￥)',
                          style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.grey, fontSize: 12),
                        ),
                        Utils.getSizedBox(height: 6),
                        Text(
                          'Thành tiền: ' + priceTotalVND + ' đ',
                          style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.green, fontSize: 12),
                        ),
                        Utils.getSizedBox(height: 3),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.note ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                item.note = await prompt(
                                  context,
                                  title: Text('Ghi chú'),
                                  textOK: Text('Đồng ý'),
                                  textCancel: Text('Hủy'),
                                  hintText: 'Nhập ghi chú cho sản phẩm',
                                  autoFocus: true,
                                  initialValue: item.note ?? '',
                                  obscureText: false,
                                  obscuringCharacter: '•',
                                  textCapitalization: TextCapitalization.words,
                                );
                                setState(() {});
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.orange,
                                size: 21,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Util.listItems.remove(item);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 21,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
