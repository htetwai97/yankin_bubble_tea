// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class NameQuantityAddView extends StatelessWidget {
  Function onTap;
  String size;
  String price;
  NameQuantityAddView({
    super.key,
    required this.onTap,
    required this.size,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            size,
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM,
              BLACK_HEAVY,
            ),
          ),
        ),
        Expanded(
          child: Text(
            price,
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM,
              APP_THEME_COLOR,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: APP_THEME_COLOR,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              size: 20,
              color: WHITE_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
