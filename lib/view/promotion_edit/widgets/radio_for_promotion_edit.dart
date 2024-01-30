import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioForPromotionEditView extends StatefulWidget {
  Function(int? value) onChooseType;
  int? groupValue;

  RadioForPromotionEditView({
    Key? key,
    this.groupValue,
    required this.onChooseType,
  }) : super(key: key);

  @override
  State<RadioForPromotionEditView> createState() =>
      _RadioForPromotionEditViewState();
}

class _RadioForPromotionEditViewState extends State<RadioForPromotionEditView> {
  int? valueOne = 1;
  int? valueTwo = 2;
  int? valueThree = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rewards",
          style: ConfigStyle.regularStyle(FONT_MEDIUM + 3, BLACK_HEAVY),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              "Cash Back",
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
              "Foc Item",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
            ),
            SizedBox(width: scaleWidth(context) / 20),
            Radio(
              activeColor: APP_THEME_COLOR,
              value: valueThree,
              groupValue: widget.groupValue,
              onChanged: (clickValue) {
                setState(() {
                  widget.groupValue = clickValue;
                  widget.onChooseType(widget.groupValue);
                });
              },
            ),
            Text(
              "Discount",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
            ),
          ],
        ),
      ],
    );
  }
}
