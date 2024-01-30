// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';
import 'package:multipurpose_pos_application/data/vos/voucher_detail_vo.dart';
import 'package:multipurpose_pos_application/view/voucher_store/screen/voucher_store_screen.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';
import '../../sale/widgets/build_box_shadow.dart';

class VoucherItemView extends StatelessWidget {
  int? index;
  String? name;
  int? orderQuantity;
  int? totalPrice;
  String? size;
  List<RequestToppingVO>? toppingList;

  VoucherItemView({
    super.key,
    required this.index,
    required this.name,
    required this.orderQuantity,
    required this.totalPrice,
    required this.size,
    required this.toppingList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          buildBoxShadow(),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  "$index.",
                  style: ConfigStyle.regularStyle(FONT_LARGE - 3, BLACK_LIGHT),
                ),
              ),
              Expanded(
                child: Text(
                  name!,
                  style: ConfigStyle.regularStyle(FONT_LARGE - 3, BLACK_LIGHT),
                ),
              ),
              SizedBox(width: scaleWidth(context) / 25),
              Expanded(
                child: Text(
                  "$orderQuantity",
                  style: ConfigStyle.regularStyle(FONT_LARGE - 3, BLACK_LIGHT),
                ),
              ),
              Expanded(
                child: Text(
                  "$totalPrice",
                  style: ConfigStyle.regularStyle(FONT_LARGE - 3, BLACK_LIGHT),
                ),
              ),
              Expanded(
                child: Text(
                  "$size",
                  style: ConfigStyle.regularStyle(FONT_LARGE - 3, BLACK_LIGHT),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26,width: 0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ToppingVoucherView(
                  textOne: toppingList?[index].rawMaterialName ?? "",
                  textTwo:
                      toppingList?[index].rawMaterialQuantity.toString() ?? "",
                  textThee: toppingList?[index].totalAmount.toString() ?? "",
                ),
              );
            },
            itemCount: toppingList?.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
