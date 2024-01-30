// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioForSpecialView extends StatefulWidget {
  String itemName;
  Function(int?) onChooseType;
  RadioForSpecialView({
    Key? key,
    required this.itemName,
    required this.onChooseType,
  }) : super(key: key);

  @override
  State<RadioForSpecialView> createState() => _RadioForSpecialViewState();
}

class _RadioForSpecialViewState extends State<RadioForSpecialView> {
  int? valueOne = 1;
  int? valueTwo = 2;
  int? valueThree = 3;
  int? groupValue = 2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            widget.itemName,
            style: ConfigStyle.regularStyle(14, BLACK_LIGHT),
          ),
        ),
        Column(
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
              "low",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ],
        ),
        Column(
          children: [
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
              "normal",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ],
        ),
        Column(
          children: [
            Radio(
              activeColor: APP_THEME_COLOR,
              value: valueThree,
              groupValue: groupValue,
              onChanged: (clickValue) {
                setState(() {
                  groupValue = clickValue;
                  widget.onChooseType(clickValue);
                });
              },
            ),
            Text(
              "high",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ],
        ),
      ],
    );
  }
}
