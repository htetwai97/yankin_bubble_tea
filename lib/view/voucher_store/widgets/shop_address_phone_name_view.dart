import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class ShopAddressPhoneNameView extends StatelessWidget {
  const ShopAddressPhoneNameView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Yankinbubbletea",
              style: ConfigStyle.boldStyle(18, APP_THEME_COLOR),
            ),
            const SizedBox(height: 8),
            Text(
              "Yankin Road,Yankin Township,Yangon, Myanmar",
              style: ConfigStyle.boldStyle(18, APP_THEME_COLOR),
            ),
            const SizedBox(height: 8),
            Text(
              "09-420080780",
              style: ConfigStyle.boldStyle(18, APP_THEME_COLOR),
            ),
          ],
        ),
      ),
    );
  }
}