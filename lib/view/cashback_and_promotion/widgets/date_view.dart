import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';
import '../../best_selling_items/widgets/box_shadow.dart';

class DateView extends StatelessWidget {
  String dateName;
  Function onTapDateIcon;

  DateView({
    super.key,
    required this.dateName,
    required this.onTapDateIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: scaleHeight(context) / 60,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context) / 50,
          vertical: scaleWidth(context) / 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          boxShadow(),
        ],
      ),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: "$dateName",
            style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
          ),
          WidgetSpan(
              child: Padding(
            padding: EdgeInsets.only(left: scaleWidth(context) / 15),
            child: InkWell(
              onTap: () {
                onTapDateIcon();
              },
              child: Icon(Icons.calendar_month, color: Colors.green, size: 20),
            ),
          ))
        ],
      )),
    );
  }
}
