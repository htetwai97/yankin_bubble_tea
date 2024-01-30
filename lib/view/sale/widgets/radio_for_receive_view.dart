// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioForReceiveView extends StatefulWidget {
  String textOne;
  String textTwo;
  bool isCheckOut;
  Function(int? value) onChooseType;
  int? groupValue;
  RadioForReceiveView({
    Key? key,
    required this.onChooseType,
    this.groupValue,
    this.textOne = "Normal",
    this.textTwo = "Delivery",
    this.isCheckOut = false,
  }) : super(key: key);

  @override
  State<RadioForReceiveView> createState() => _RadioForReceiveViewState();
}

class _RadioForReceiveViewState extends State<RadioForReceiveView> {
  int? valueOne = 1;
  int? valueTwo = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueOne,
          groupValue: widget.groupValue,
          onChanged: (clickValue) {
            setState(() {
              /// widget.groupValue = clickValue;
              widget.onChooseType(clickValue);
            });
          },
        ),
        Text(
          widget.textOne,
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
        (widget.isCheckOut)
            ? const Spacer()
            : SizedBox(width: scaleWidth(context) / 20),
        Radio(
          activeColor: APP_THEME_COLOR,
          value: valueTwo,
          groupValue: widget.groupValue,
          onChanged: (clickValue) {
            setState(() {
              /// widget.groupValue = clickValue;
              widget.onChooseType(clickValue);
            });
          },
        ),
        Text(
          widget.textTwo,
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
      ],
    );
  }
}
