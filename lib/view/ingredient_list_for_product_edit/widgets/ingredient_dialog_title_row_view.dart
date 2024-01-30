// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class IngredientDialogTitleRowView extends StatelessWidget {
  String title;
  Function onTapCross;
  IngredientDialogTitleRowView({
    super.key,
    required this.title,
    required this.onTapCross,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: ConfigStyle.boldStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            onTapCross();
          },
          icon: const Icon(
            Icons.highlight_remove_outlined,
            size: 28,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}