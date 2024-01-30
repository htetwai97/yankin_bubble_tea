// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class OptionalButtonView extends StatelessWidget {
  Function onTap;
  String optionName;
  OptionalButtonView({
    super.key,
    required this.onTap,
    required this.optionName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            height: scaleWidth(context) / 30,
            width: scaleWidth(context) / 12,
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                buildBoxShadow(),
              ],
            ),
            child: Center(
              child: Text(
                optionName,
                style: ConfigStyle.regularStyle(
                  FONT_MEDIUM - 2,
                  BLACK_HEAVY,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            onTap();
          },
          child: const Icon(
            Icons.more_vert,
            size: 26,
          ),
        ),
      ],
    );
  }
}
