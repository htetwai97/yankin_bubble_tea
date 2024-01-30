// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class CashbackPromoTitle extends StatelessWidget {
  String? voucherTotal;
  String? discountTotal;
  CashbackPromoTitle({super.key, this.voucherTotal, this.discountTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: APP_THEME_COLOR,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  voucherTotal!,
                  style: ConfigStyle.boldStyle(FONT_LARGE - 4, WHITE_COLOR),
                ),
                SizedBox(width: scaleWidth(context) / 4),
                Text(
                  discountTotal!,
                  style: ConfigStyle.boldStyle(FONT_LARGE - 4, WHITE_COLOR),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Voucher No.",
                style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
              ),
              Text(
                "Voucher Date",
                style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
              ),
              Text(
                "Voucher Total",
                style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
              ),
              Text(
                "Promotion Type",
                style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
              ),
              Text(
                "Discount Percent",
                style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
              ),
              Text(
                "Discount Amount",
                style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
