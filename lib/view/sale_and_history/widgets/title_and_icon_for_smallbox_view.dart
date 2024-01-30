// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class TitleAndIconForSmallBox extends StatelessWidget {
  IconData? iconData;
  String? title;
  TitleAndIconForSmallBox({
    super.key,
    this.iconData,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 26,
          color: Colors.deepOrangeAccent,
        ),
        SizedBox(width: scaleHeight(context) / 20),
        Text(
          title ?? "",
          style: ConfigStyle.boldStyle(FONT_MEDIUM + 1, BUTTON_COLOR),
        ),
      ],
    );
  }
}
