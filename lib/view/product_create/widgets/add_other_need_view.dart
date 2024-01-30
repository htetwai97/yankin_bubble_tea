// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class AddOtherNeedView extends StatelessWidget {
  Function onTap;
  bool isVisibleAdd;
  AddOtherNeedView({
    super.key,
    required this.onTap,
    this.isVisibleAdd = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Adding Other Need",
          style: ConfigStyle.regularStyle(FONT_MEDIUM + 2, BLACK_HEAVY),
        ),
        const Spacer(),
        Visibility(
          visible: isVisibleAdd,
          child: IconButton(
            onPressed: () {
              onTap();
            },
            icon: const Icon(
              Icons.add_circle_outline,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
