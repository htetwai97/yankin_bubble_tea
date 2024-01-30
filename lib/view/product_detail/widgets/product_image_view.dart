// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class ProductImageView extends StatelessWidget {
  String name;
  String url;
  ProductImageView({
    required this.name,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: scaleHeight(context) / 3,
      height: scaleHeight(context) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(url),
            radius: 55,
          ),
          SizedBox(height: scaleHeight(context) / 20),
          Text(
            textAlign: TextAlign.center,
            name,
            style: ConfigStyle.regularStyle(FONT_MEDIUM + 5, BUTTON_COLOR),
          ),
        ],
      ),
    );
  }
}
