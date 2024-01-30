// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class SecondRowOfCardItemView extends StatelessWidget {
  String text;
  Function onTapPoppingOne;
  Function onTapPoppingTwo;
  SecondRowOfCardItemView({
    super.key,
    this.text = "Special",
    required this.onTapPoppingOne,
    required this.onTapPoppingTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: ConfigStyle.regularStyle(
            FONT_MEDIUM + 2,
            BLACK_LIGHT,
          ),
        ),
        InkWell(
          onTap: () {
            onTapPoppingOne();
          },
          child: const Icon(
            MdiIcons.foodForkDrink,
            size: 24,
            color: CARD_FIRST_COLOR,
          ),
        ),
        Text(
          "Popping",
          style: ConfigStyle.regularStyle(
            FONT_MEDIUM + 6,
            BLACK_LIGHT,
          ),
        ),
        InkWell(
          onTap: () {
            onTapPoppingTwo();
          },
          child: const Icon(
            MdiIcons.food,
            size: 24,
            color: CARD_FIRST_COLOR,
          ),
        ),
      ],
    );
  }
}
