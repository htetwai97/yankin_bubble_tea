// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioForCategoryCreateView extends StatefulWidget {
  Function(int? value) onChooseType;
  RadioForCategoryCreateView({
    Key? key,
    required this.onChooseType,
  }) : super(key: key);

  @override
  State<RadioForCategoryCreateView> createState() =>
      _RadioForCategoryCreateViewState();
}

class _RadioForCategoryCreateViewState
    extends State<RadioForCategoryCreateView> {
  int? valueOne = 1;
  int? valueTwo = 2;
  int? valueThree = 3;
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueOne,
          groupValue: groupValue,
          onChanged: (clickValue) {
            setState(() {
              groupValue = clickValue;
              widget.onChooseType(groupValue);
            });
          },
        ),
        Text(
          "For Raw Material",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
        ),
        SizedBox(width: scaleWidth(context) / 20),
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueTwo,
          groupValue: groupValue,
          onChanged: (clickValue) {
            setState(() {
              groupValue = clickValue;
              widget.onChooseType(groupValue);
            });
          },
        ),
        Text(
          "For Product",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
        ),
        SizedBox(width: scaleWidth(context) / 20),
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueThree,
          groupValue: groupValue,
          onChanged: (clickValue) {
            setState(() {
              groupValue = clickValue;
              widget.onChooseType(groupValue);
            });
          },
        ),
        Text(
          "All",
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
        ),
      ],
    );
  }
}
