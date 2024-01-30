// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/name_quantity_add_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/option_button_view.dart';

class ItemDetailView extends StatelessWidget {
  String itemName;
  String optionName;
  String url;
  String size;
  String price;
  Function onTapOption;
  Function onTapAdd;
  ItemDetailView({
    super.key,
    required this.size,
    required this.price,
    required this.itemName,
    required this.onTapAdd,
    required this.onTapOption,
    required this.url,
    required this.optionName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: scaleHeight(context) / 80,
        vertical: scaleHeight(context) / 50,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: scaleHeight(context) / 50,
        vertical: scaleHeight(context) / 40,
      ),
      width: (scaleWidth(context) / 2) / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          buildBoxShadow(),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(url),
            radius: 30,
          ),
          SizedBox(height: scaleHeight(context) / 40),
          Text(
            itemName,
            style: ConfigStyle.regularStyle(
              FONT_MEDIUM - 2,
              APP_THEME_COLOR,
            ),
          ),
          SizedBox(height: scaleHeight(context) / 40),
          OptionalButtonView(
            optionName: optionName,
            onTap: () {
              onTapOption();
            },
          ),
          SizedBox(height: scaleHeight(context) / 40),
          NameQuantityAddView(
            size: size,
            price: price,
            onTap: () {
              onTapAdd();
            },
          ),
        ],
      ),
    );
  }
}
