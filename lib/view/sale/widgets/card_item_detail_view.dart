// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/first_row_of_card_item_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/second_row_of_card_item_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/topping_item_detail_view.dart';

class CardItemDetailView extends StatelessWidget {
  String name;
  String quantity;
  String amount;
  String size;
  String special;
  Function onTapAddProduct;
  Function onTapMinusProduct;
  Function(int) onTapAddToppingQuantity;
  Function(int) onTapMinusToppingQuantity;
  Function(String) onTapMore;
  Function onTapPoppingOne;
  Function onTapPoppingTwo;
  List<String?> sizeList;
  List<RequestToppingVO?> toppingList;
  CardItemDetailView({
    super.key,
    required this.onTapAddProduct,
    required this.size,
    required this.quantity,
    required this.name,
    required this.amount,
    required this.onTapMinusProduct,
    required this.onTapMore,
    required this.onTapPoppingOne,
    required this.onTapPoppingTwo,
    required this.sizeList,
    required this.toppingList,
    required this.onTapMinusToppingQuantity,
    required this.onTapAddToppingQuantity,
    required this.special,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: scaleHeight(context) / 40,
        vertical: scaleHeight(context) / 40,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: scaleHeight(context) / 40,
        vertical: scaleHeight(context) / 40,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          buildBoxShadow(),
        ],
        border: Border.all(width: 0.5, color: Colors.black45),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FirstRowOfCardItemView(
            size: size,
            quantity: quantity,
            name: name,
            amount: amount,
            onTapAdd: () {
              onTapAddProduct();
            },
            onTapMinus: () {
              onTapMinusProduct();
            },
            sizeList: sizeList,
            onTapMore: (e) {
              onTapMore(e);
            },
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: toppingList.length,
            itemBuilder: (context, index) => ToppingItemDetailView(
              toppingName: "${toppingList[index]?.rawMaterialName}",
              toppingQuantity: "${toppingList[index]?.rawMaterialQuantity}",
              toppingTotalPrice: "${toppingList[index]?.totalAmount}",
              onTapAddToppingQty: () {
                onTapAddToppingQuantity(index);
              },
              onTapMinusToppingQty: () {
                onTapMinusToppingQuantity(index);
              },
            ),
          ),
          SizedBox(height: scaleHeight(context) / 20),
          SecondRowOfCardItemView(
            text: special,
            onTapPoppingOne: () {
              onTapPoppingOne();
            },
            onTapPoppingTwo: () {
              onTapPoppingTwo();
            },
          ),
        ],
      ),
    );
  }
}
