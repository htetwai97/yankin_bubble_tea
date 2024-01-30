// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class ProductFunctionView extends StatelessWidget {
  String name;
  String url;
  ProductFunctionView({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          url,
          width: 32,
          height: 32,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 2),
        Expanded(
          child: Text(
            name,
            style: ConfigStyle.regularStyle(FONT_SMALL + 2, BLACK_LIGHT),
          ),
        ),
      ],
    );
  }
}