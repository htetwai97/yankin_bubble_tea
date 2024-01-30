// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class SupplierTitleView extends StatelessWidget {
  String textOne;
  String textTwo;
  String textThree;
  SupplierTitleView({
    super.key,
    this.textOne = "Name",
    this.textTwo = "Promotion",
    this.textThree = "Time",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textOne,
          style: ConfigStyle.boldStyle(FONT_LARGE - 4, WHITE_COLOR),
        ),
        Text(
          textTwo,
          style: ConfigStyle.boldStyle(FONT_LARGE - 4, WHITE_COLOR),
        ),
        Text(
          textThree,
          style: ConfigStyle.boldStyle(FONT_LARGE - 4, WHITE_COLOR),
        ),
      ],
    );
  }
}
