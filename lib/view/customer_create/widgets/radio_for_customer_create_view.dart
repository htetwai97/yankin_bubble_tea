// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioForCustomerCreateView extends StatefulWidget {
  Function(int? value) onChooseType;
  int? groupValue;
  RadioForCustomerCreateView({
    Key? key,
    required this.groupValue,
    required this.onChooseType,
  }) : super(key: key);

  @override
  State<RadioForCustomerCreateView> createState() =>
      _RadioForCustomerCreateViewState();
}

class _RadioForCustomerCreateViewState
    extends State<RadioForCustomerCreateView> {
  int? valueOne = 1;
  int? valueTwo = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Tax Percent",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
        ),
        SizedBox(width: scaleWidth(context) / 9),
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueOne,
          groupValue: widget.groupValue,
          onChanged: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onChooseType(widget.groupValue);
            });
          },
        ),
        Text(
          "Yes",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
        ),
        SizedBox(width: scaleWidth(context) / 20),
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueTwo,
          groupValue: widget.groupValue,
          onChanged: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onChooseType(widget.groupValue);
            });
          },
        ),
        Text(
          "No",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
        ),
        SizedBox(width: scaleWidth(context) / 20),
      ],
    );
  }
}
