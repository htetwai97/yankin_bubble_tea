// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioBtnForRawMaterialScreen extends StatefulWidget {
  Function(int? value) onChooseType;
  int? groupValue;
  String? title;
  RadioBtnForRawMaterialScreen({
    Key? key,
    required this.groupValue,
    required this.onChooseType,
    required this.title,
  }) : super(key: key);

  @override
  State<RadioBtnForRawMaterialScreen> createState() =>
      _RadioBtnForRawMaterialScreenState();
}

class _RadioBtnForRawMaterialScreenState
    extends State<RadioBtnForRawMaterialScreen> {
  int? valueOne = 0;
  int? valueTwo = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title!,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          SizedBox(width: scaleWidth(context) / 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              SizedBox(width: scaleWidth(context) / 10),
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
          ),
        ]);
  }
}
