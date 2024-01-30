// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class CustomerDetailView extends StatelessWidget {
  String? name;
  int? tax;
  String? phone;
  Function onTap;

  CustomerDetailView({
    super.key,
    required this.name,
    required this.tax,
    required this.phone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            buildBoxShadow(),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name!,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
            Text(
              '$tax',
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
            Text(
              phone!,
              style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
            ),
          ],
        ),
      ),
    );
  }
}
