// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class OptionItemForInventoryView extends StatelessWidget {
  String name;
  IconData icon;
  Function(String) onTap;
  OptionItemForInventoryView({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(name);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            buildBoxShadow(),
          ],
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              APP_THEME_COLOR_REDUCE,
              APP_THEME_COLOR_TWO_REDUCE,
            ],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: FONT_LARGE + 10,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: scaleHeight(context) / 20,
              ),
              Text(
                name,
                style: ConfigStyle.boldStyle(FONT_LARGE - 4, WHITE_COLOR),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
