// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class TwoButtonsForIngredientDialogView extends StatelessWidget {
  Function onTapCancel;
  Function onTapAdd;
  Function onTapRegister;
  bool isVisibleRegister;

  TwoButtonsForIngredientDialogView({
    super.key,
    required this.onTapCancel,
    required this.onTapAdd,
    required this.onTapRegister,
    this.isVisibleRegister = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          color: BUTTON_COLOR,
          onPressed: () {
            onTapAdd();
          },
          child: Text(
            "Add",
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM,
              WHITE_COLOR,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Visibility(
          visible: isVisibleRegister,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            color: BUTTON_COLOR,
            onPressed: () {
              onTapRegister();
            },
            child: Text(
              "Register",
              style: ConfigStyle.regularStyle(
                FONT_MEDIUM,
                WHITE_COLOR,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          color: BUTTON_COLOR,
          onPressed: () {
            onTapCancel();
          },
          child: Text(
            "Cancel",
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
