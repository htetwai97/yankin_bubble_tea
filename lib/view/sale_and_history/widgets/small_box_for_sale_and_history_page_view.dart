// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class SmallBoxForSaleAndHistoryPageView extends StatelessWidget {
  Widget? widget;
  SmallBoxForSaleAndHistoryPageView({
    super.key,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: BLACK_LIGHT,
          width: 0.1,
        ),
        boxShadow: [
          buildBoxShadow(),
        ],
      ),
      height: scaleHeight(context) / 3.6,
      width: scaleWidth(context) / 2.9,
      child: widget,
    );
  }
}
