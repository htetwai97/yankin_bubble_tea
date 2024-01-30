// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class ToppingItemDetailView extends StatelessWidget {
  String toppingName;
  String toppingTotalPrice;
  String toppingQuantity;
  Function onTapAddToppingQty;
  Function onTapMinusToppingQty;
  ToppingItemDetailView({
    super.key,
    required this.onTapAddToppingQty,
    required this.onTapMinusToppingQty,
    required this.toppingName,
    required this.toppingTotalPrice,
    required this.toppingQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          buildBoxShadow(),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      // width: scaleWidth(context) / 2.8,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Topping :",
                style: ConfigStyle.boldStyle(14, BLACK_HEAVY),
              ),
              const Spacer(),
              Text(
                toppingName,
                style: ConfigStyle.regularStyle(14, BLACK_LIGHT),
              ),
              const SizedBox(width: 50),
              Text(
                toppingTotalPrice,
                style: ConfigStyle.regularStyle(14, BLACK_LIGHT),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    onTapAddToppingQty();
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 28,
                    color: Colors.green,
                  ),
                ),
                Text(
                  toppingQuantity,
                  style: ConfigStyle.regularStyle(
                    FONT_MEDIUM,
                    BLACK_LIGHT,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onTapMinusToppingQty();
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 28,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
