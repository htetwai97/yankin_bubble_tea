// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class CategoryButtonsView extends StatelessWidget {
  Function onTapCreate;
  Function onTapCancel;
  String text;
  CategoryButtonsView({
    super.key,
    required this.onTapCancel,
    required this.onTapCreate,
    this.text = "Create",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          buildBoxShadow(),
        ],
        gradient: const LinearGradient(
          colors: [
            APP_THEME_COLOR_REDUCE,
            APP_THEME_COLOR_TWO_REDUCE,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              onTapCreate();
            },
            child: Text(
              text,
              style: ConfigStyle.regularStyle(FONT_LARGE - 4, WHITE_COLOR),
            ),
          ),
          Container(
            width: 1,
            height: scaleHeight(context) / 8,
            color: SEPERATOR_COLOR,
          ),
          InkWell(
            onTap: () {
              onTapCancel();
            },
            child: Text(
              "Cancel",
              style: ConfigStyle.boldStyle(FONT_LARGE - 4, WHITE_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}
