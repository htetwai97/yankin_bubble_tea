// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioForToppingDialogView extends StatefulWidget {
  Function(int? value) onChooseType;
  RadioForToppingDialogView({
    Key? key,
    required this.onChooseType,
  }) : super(key: key);

  @override
  State<RadioForToppingDialogView> createState() => _RadioForReceiveViewState();
}

class _RadioForReceiveViewState extends State<RadioForToppingDialogView> {
  int? valueOne = 1;
  int? valueTwo = 2;
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueOne,
          groupValue: groupValue,
          onChanged: (clickValue) {
            setState(() {
              groupValue = clickValue;
              widget.onChooseType(clickValue);
            });
          },
        ),
        Text(
          "Normal",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
        SizedBox(width: scaleWidth(context) / 20),
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueTwo,
          groupValue: groupValue,
          onChanged: (clickValue) {
            setState(() {
              groupValue = clickValue;
              widget.onChooseType(clickValue);
            });
          },
        ),
        Text(
          "Delivery",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
      ],
    );
  }
}
