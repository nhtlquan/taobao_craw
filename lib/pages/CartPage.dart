import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/ItemDetail.dart';
import 'package:flutter_app_test/utils/CustomTextStyle.dart';
import 'package:flutter_app_test/utils/CustomUtils.dart';
import 'package:flutter_app_test/utils/Util.dart';
import 'package:grouped_list/grouped_list.dart';

import 'CheckOutPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[createHeader(), createSubTitle(), createCartList(), footer(context)],
          );
        },
      ),
    );
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
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\$299.00",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 8),
          RaisedButton(
            onPressed: () {
              Util.listItems.clear();
              Navigator.push(context, new MaterialPageRoute(builder: (context) => CheckOutPage()));
            },
            color: Colors.green,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Checkout",
              style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.white),
            ),
          ),
          Utils.getSizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Giỏ Hàng",
        style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 16, color: Colors.black),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle() {
    var size = Util.listItems.length;
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Tổng ($size) sản phẩm",
        style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 12, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList() {
    return GroupedListView<ItemDetail, String>(
      elements: Util.listItems,
      shrinkWrap: true,
      groupBy: (element) => element.shopName,
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1.titleOrigin.compareTo(item2.titleOrigin),
      order: GroupedListOrder.DESC,

      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16,),
          Checkbox(value: false, onChanged: null, ),
          Icon(Icons.shopping_bag_outlined, color: Colors.grey,size: 20,),
          SizedBox(width: 5,),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      itemBuilder: (c, element) {
        return createCartListItem(element);
      },
    );
  }

  createCartListItem(ItemDetail item) {
    print(item.property);
    var priceVND = Util.intToPriceDouble(double.parse(item.priceOrigin) * 3500);
    var totalPrice = Util.intToPriceDouble(double.parse(item.priceOrigin) * int.parse(item.quantity));
    var priceTotalVND = Util.intToPriceDouble(double.parse(item.priceOrigin) * 3500 * int.parse(item.quantity));
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
                Checkbox(value: false, onChanged: null),
                Image.network(
                  item.imageModel,
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
                          'Thành tiền: ' + priceTotalVND + ' VNĐ',
                          style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.green, fontSize: 12),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.edit,
                              color: Colors.orange,
                              size: 18,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: (){
                                Util.listItems.remove(item);
                                setState(() {

                                });
                              },
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 18,
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
