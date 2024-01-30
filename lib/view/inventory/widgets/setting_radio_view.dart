// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class SettingRadioView extends StatefulWidget {
  Function(int? value) onChooseType;
  int? groupValue;
  SettingRadioView({
    Key? key,
    required this.onChooseType,
    required this.groupValue,
  }) : super(key: key);

  @override
  State<SettingRadioView> createState() => _SettingRadioViewState();
}

class _SettingRadioViewState extends State<SettingRadioView> {
  int? valueOne = 1;
  int? valueTwo = 2;
  int? valueThree = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
              activeColor: APP_THEME_COLOR,
              value: valueOne,
              groupValue: widget.groupValue,
              onChanged: (clickValue) {
                setState(() {
                  widget.onChooseType(clickValue);
                });
              },
            ),
            SizedBox(width: scaleHeight(context) / 10),
            Text(
              "Retail",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              activeColor: APP_THEME_COLOR,
              value: valueTwo,
              groupValue: widget.groupValue,
              onChanged: (clickValue) {
                setState(() {
                  widget.onChooseType(clickValue);
                });
              },
            ),
            SizedBox(width: scaleHeight(context) / 10),
            Text(
              "Whole Sale",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              activeColor: APP_THEME_COLOR,
              value: valueThree,
              groupValue: widget.groupValue,
              onChanged: (clickValue) {
                setState(() {
                  widget.onChooseType(clickValue);
                });
              },
            ),
            SizedBox(width: scaleHeight(context) / 10),
            Text(
              "Food",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ],
        ),
      ],
    );
  }
}
