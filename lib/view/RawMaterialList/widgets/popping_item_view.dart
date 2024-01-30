import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

import '../../../core/core_function/functions.dart';
import '../../best_selling_items/widgets/box_shadow.dart';

class PoppingItemView extends StatelessWidget {
  String poppingName;
  String poppingImage;
  int totalProfits;
  int qty;

  PoppingItemView({
    super.key,
    required this.poppingName,
    required this.poppingImage,
    required this.totalProfits,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      child: Container(
        width: scaleWidth(context) / 6,
        margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 3),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            boxShadow(),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: scaleHeight(context) / 30,
              ),
              child: InkWell(
                onTap: () {},
                child: const Icon(Icons.edit, color: BLACK_LIGHT, size: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(poppingImage),
              ),
            ),
            SizedBox(height: scaleHeight(context) / 40),
            Text(
              "$poppingName",
              softWrap: true,
              style: ConfigStyle.boldStyle(FONT_LARGE - 4, BLACK_HEAVY),
            ),
            SizedBox(height: scaleHeight(context) / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: CARD_SECOND_COLOR,
                  child: Text("$qty", style: TextStyle(color: WHITE_COLOR)),
                ),
                SizedBox(height: scaleHeight(context) / 10),
                Text("$totalProfits ks")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
