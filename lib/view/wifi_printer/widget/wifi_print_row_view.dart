import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';

class WifiPrintRowView extends StatelessWidget {
  final String no, name, size, quantity, price, multiply;
  final List<RequestToppingVO> toppingList;
  const WifiPrintRowView({
    super.key,
    required this.name,
    required this.size,
    required this.quantity,
    required this.price,
    required this.no,
    required this.toppingList,
    required this.multiply,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  no,
                  style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  name,
                  style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  size,
                  style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  price,
                  style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Center(
                child: Text(
                  multiply,
                  style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  quantity,
                  style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: toppingList.length,
          itemBuilder: (context, index) {
            var toppingName = toppingList[index].rawMaterialName ?? "";
            var toppingPrice = toppingList[index].rawMaterialPrice ?? 0;
            var toppingQty = toppingList[index].rawMaterialQuantity ?? 0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "",
                      style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "Top(${index + 1})",
                      style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      toppingName,
                      style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      toppingPrice.toString(),
                      style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Center(
                    child: Text(
                      "x",
                      style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      toppingQty.toString(),
                      style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
