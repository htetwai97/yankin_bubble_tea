// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class ChosenIngredientItemDetailView extends StatelessWidget {
  String name;
  String amount;
  String unit;
  ChosenIngredientItemDetailView({
    super.key,
    required this.amount,
    required this.name,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: TEXT_FIELD_COLOR,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26, width: 0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
          ),
          Text(
            amount,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
          ),
          Text(
            unit,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
          ),
        ],
      ),
    );
  }
}
