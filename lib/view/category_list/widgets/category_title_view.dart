// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class CategoryTitleView extends StatelessWidget {
  String textOne;
  String textTwo;
  String textThree;
  CategoryTitleView({
    super.key,
    this.textOne = "Category Code",
    this.textTwo = "Name",
    this.textThree = "Unit Name",
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
