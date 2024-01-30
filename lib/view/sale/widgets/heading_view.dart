// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class HeadingView extends StatelessWidget {
  String qty;
  String amount;

  /// String pop;
  HeadingView({
    super.key,
    required this.amount,

    ///  required this.pop,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scaleHeight(context) / 40,
        vertical: scaleHeight(context) / 20,
      ),
      color: APP_THEME_COLOR_TWO,
      child: Row(
        children: [
          Text(
            "TotalQty:$qty",
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM,
              WHITE_COLOR,
            ),
          ),
          const Spacer(),
          Text(
            "TotalAmount:$amount",
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM,
              WHITE_COLOR,
            ),
          ),
          // const Spacer(),
          // Text(
          //   "TotalPop:$pop",
          //   style: ConfigStyle.regularStyle(
          //     FONT_MEDIUM,
          //     WHITE_COLOR,
          //   ),
          // ),
        ],
      ),
    );
  }
}
