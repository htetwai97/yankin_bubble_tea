// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class SecondRowIngredientCreateItemView extends StatelessWidget {
  String textOne;
  String textTwo;
  String textThree;
  bool isBoxDecorated;
  SecondRowIngredientCreateItemView({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    this.isBoxDecorated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 11),
      decoration: (isBoxDecorated)
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12, width: 0.3),
              boxShadow: [
                buildBoxShadow(),
              ],
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textOne,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
          ),
          Text(
            textTwo,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
          ),
          Text(
            textThree,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
          ),
        ],
      ),
    );
  }
}
