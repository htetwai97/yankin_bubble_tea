import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class ButtonsForCheckOutView extends StatelessWidget {
  Function onTapDirect;
  Function onTapPromotion;
  bool isVisibleDirectButton;
  ButtonsForCheckOutView({
    super.key,
    required this.onTapDirect,
    required this.onTapPromotion,
    this.isVisibleDirectButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: isVisibleDirectButton,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            color: BUTTON_COLOR,
            onPressed: () {
              onTapDirect();
            },
            child: Text(
              "DIRECT",
              style: ConfigStyle.regularStyle(
                FONT_MEDIUM,
                WHITE_COLOR,
              ),
            ),
          ),
        ),
        const Spacer(),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          color: BUTTON_COLOR,
          onPressed: () {
            onTapPromotion();
          },
          child: Text(
            "PROMOTION",
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM,
              WHITE_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
