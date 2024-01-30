// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class FirstRowIngredientCreateItemView extends StatelessWidget {
  String size;
  String textOne;
  String textTwo;
  Function onTapEditIcon;
  bool visibleEdit;
  FirstRowIngredientCreateItemView({
    super.key,
    required this.size,
    required this.textOne,
    required this.textTwo,
    required this.onTapEditIcon,
    this.visibleEdit = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          size,
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
        Text(
          textOne,
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
        Text(
          textTwo,
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
        Visibility(
          visible: visibleEdit,
          child: InkWell(
            onTap: () {
              onTapEditIcon();
            },
            child: const Icon(
              Icons.edit,
              color: APP_THEME_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
