// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';

class FirstRowOfCardItemView extends StatelessWidget {
  String name;
  String quantity;
  String amount;
  String size;
  Function onTapAdd;
  Function onTapMinus;
  Function(String) onTapMore;
  List<String?> sizeList;
  FirstRowOfCardItemView({
    super.key,
    required this.onTapAdd,
    required this.size,
    required this.quantity,
    required this.name,
    required this.amount,
    required this.onTapMinus,
    required this.onTapMore,
    required this.sizeList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            name,
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM + 2,
              BLACK_LIGHT,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            onTapAdd();
          },
          icon: const Icon(
            Icons.add_circle_outline,
            size: 28,
            color: Colors.green,
          ),
        ),
        Text(
          quantity,
          style: ConfigStyle.regularStyle(
            FONT_MEDIUM,
            BLACK_LIGHT,
          ),
        ),
        IconButton(
          onPressed: () {
            onTapMinus();
          },
          icon: const Icon(
            Icons.remove_circle_outline,
            size: 28,
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Text(
            amount,
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM,
              BLACK_LIGHT,
            ),
          ),
        ),
        Expanded(
          child: Text(
            size,
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM + 2,
              BLACK_LIGHT,
            ),
          ),
        ),
        PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
            itemBuilder: (context) => sizeList
                .map(
                  (e) => PopupMenuItem(
                    child: Text(e ?? ""),
                    onTap: () {
                      onTapMore(e ?? "");
                    },
                  ),
                )
                .toList())
      ],
    );
  }
}
