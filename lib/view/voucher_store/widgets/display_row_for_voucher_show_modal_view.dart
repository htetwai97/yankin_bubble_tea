// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class DisplayRowForVoucherShowModalView extends StatelessWidget {
  String title;
  String value;
  DisplayRowForVoucherShowModalView({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Center(
            child: Text(
              title,
              style: ConfigStyle.regularStyle(
                14,
                BLACK_LIGHT,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Text(
            ": $value",
            style: ConfigStyle.regularStyle(
              14,
              BLACK_LIGHT,
            ),
          ),
        ),
      ],
    );
  }
}
