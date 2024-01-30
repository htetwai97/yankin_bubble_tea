// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class CashbackPromoItemView extends StatelessWidget {
  String voucherNo;
  String voucherDate;
  String voucherTotal;
  String promotionType;
  String discountPercent;
  String discountAmount;
  CashbackPromoItemView({
    super.key,
    required this.voucherNo,
    required this.voucherDate,
    required this.voucherTotal,
    required this.promotionType,
    required this.discountPercent,
    required this.discountAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context) / 22,
          vertical: scaleHeight(context) / 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              voucherNo,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ),
          Expanded(
            child: Text(
              voucherDate,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ),
          Expanded(
            child: Text(
              voucherTotal,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ),
          Expanded(
            child: Text(
              promotionType,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ),
          Expanded(
            child: Text(
              discountPercent,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ),
          Expanded(
            child: Text(
              discountAmount,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ),
        ],
      ),
    );
  }
}
