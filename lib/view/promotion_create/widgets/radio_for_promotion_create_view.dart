import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class RadioForPromotionCreateView extends StatefulWidget {
  Function(int? value) onChooseType;
  RadioForPromotionCreateView({
    Key? key,
    required this.onChooseType,
  }) : super(key: key);

  @override
  State<RadioForPromotionCreateView> createState() =>
      _RadioForPromotionCreateViewState();
}

class _RadioForPromotionCreateViewState
    extends State<RadioForPromotionCreateView> {
  int? valueOne = 1;
  int? valueTwo = 2;
  int? valueThree = 3;
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rewards",
          style: ConfigStyle.regularStyle(FONT_MEDIUM + 3, BLACK_HEAVY),
        ),
        SizedBox(height: scaleHeight(context) / 40),
        Row(
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
              "Cash Back",
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
              "Foc Item",
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
              "Discount",
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
            ),
          ],
        ),
      ],
    );
  }
}
