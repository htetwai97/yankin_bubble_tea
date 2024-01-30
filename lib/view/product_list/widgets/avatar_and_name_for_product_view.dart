// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class AvatarAndNameForProductView extends StatelessWidget {
  String name;
  String url;
  AvatarAndNameForProductView({
    required this.name,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: scaleHeight(context) / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(url),
            radius: 28,
          ),
          // CircleAvatar(
          //   backgroundImage: CachedNetworkImageProvider(url),
          //   radius: 26,
          // ),
          const SizedBox(height: 2),
          Text(
            name,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BUTTON_COLOR),
          ),
        ],
      ),
    );
  }
}
