import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'box_shadow.dart';

class BestSellingItemDetailView extends StatelessWidget {
  String productName;
  String productImage;
  String sizeName;
  int totalProfits;
  int qty;

  BestSellingItemDetailView({
    super.key,
    required this.productName,
    required this.productImage,
    required this.sizeName,
    required this.totalProfits,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 9),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            boxShadow(),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                decoration: BoxDecoration(
                  color: CARD_FIRST_COLOR,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(productImage),
                ),
              ),
            ),
            SizedBox(height: scaleHeight(context) / 40),
            Text(
              "$productName \n ($sizeName)",
              softWrap: true,
              style: ConfigStyle.boldStyle(FONT_LARGE - 4, BLACK_HEAVY),
            ),
            SizedBox(height: scaleHeight(context) / 40),
            Container(
              width: scaleWidth(context) / 6.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: CARD_SECOND_COLOR,
                    child: Text("$qty", style: TextStyle(color: WHITE_COLOR)),
                  ),
                  Text("$totalProfits ks")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
