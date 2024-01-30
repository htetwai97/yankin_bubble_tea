// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class IngredientView extends StatelessWidget {
  String? rawMaterialName;
  String? unitName;
  int? amount;

  IngredientView({
    super.key,
    required this.unitName,
    required this.amount,
    required this.rawMaterialName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            rawMaterialName!,
            style: ConfigStyle.regularStyle(FONT_MEDIUM + 3, BLACK_LIGHT),
          ),
        ),
        Expanded(
          child: Text(
            "${amount}",
            style: ConfigStyle.regularStyle(FONT_MEDIUM + 3, BLACK_LIGHT),
          ),
        ),
        Expanded(
          child: Text(
            unitName!,
            style: ConfigStyle.regularStyle(FONT_MEDIUM + 3, BLACK_LIGHT),
          ),
        )
      ],
    );
  }
}
