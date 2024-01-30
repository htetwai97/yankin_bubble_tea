// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class DrawerListTileSectionView extends StatefulWidget {
  IconData icon;
  String text;
  Function onTap;
  DrawerListTileSectionView({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<DrawerListTileSectionView> createState() =>
      _DrawerListTileSectionViewState();
}

class _DrawerListTileSectionViewState extends State<DrawerListTileSectionView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onTap();
      },
      selectedColor: Colors.green,
      dense: true,
      style: ListTileStyle.drawer,
      leading: Icon(
        widget.icon,
        color: Colors.black54,
        size: FONT_XLARGE - 4,
      ),
      title: Text(
        widget.text,
        style: ConfigStyle.regularStyle(
          FONT_MEDIUM,
          BLACK_HEAVY,
        ),
      ),
    );
  }
}
