// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class VoucherRowForListView extends StatelessWidget {
  String textOne, textTwo, textThree, textFour, textFive, textSix;
  double font;
  Color color;
  VoucherRowForListView({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.textFour,
    required this.textFive,
    required this.textSix,
    this.font = 14,
    this.color = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: scaleWidth(context) / 10,
          child: Center(
            child: Text(
              textOne,
              style: ConfigStyle.regularStyle(font, color),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: scaleWidth(context) / 5,
          child: Center(
            child: Text(
              textTwo,
              style: ConfigStyle.regularStyle(font, color),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: scaleWidth(context) / 7,
          child: Center(
            child: Text(
              textThree,
              style: ConfigStyle.regularStyle(font, color),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: scaleWidth(context) / 7,
          child: Center(
            child: Text(
              textFour,
              style: ConfigStyle.regularStyle(font, color),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: scaleWidth(context) / 6,
          child: Center(
            child: Text(
              textFive,
              style: ConfigStyle.regularStyle(font, color),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: scaleWidth(context) / 5,
          child: Center(
            child: Text(
              textSix,
              style: ConfigStyle.regularStyle(font, color),
            ),
          ),
        ),
      ],
    );
  }
}
