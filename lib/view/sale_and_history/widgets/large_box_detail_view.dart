// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class LargeBoxDetailView extends StatelessWidget {
  String title;
  String image;
  Function onTap;
  LargeBoxDetailView({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: scaleHeight(context) / 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image, height: scaleHeight(context) / 6),
          Text(
            title,
            style: ConfigStyle.boldStyle(FONT_LARGE - 4, CARD_FIRST_COLOR),
          ),
          IconButton(
            onPressed: () {
              onTap();
            },
            icon: const Icon(
              Icons.arrow_forward_outlined,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
