// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class VoucherSummaryView extends StatelessWidget {
  int voucherNo;
  int totalPrice;
  String date;
  Function onTapDetail;
  Function onTapDeleteIcon;

  VoucherSummaryView({
    super.key,
    required this.voucherNo,
    required this.totalPrice,
    required this.date,
    required this.onTapDetail,
    required this.onTapDeleteIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      onTap: () {
        //onTapDetail();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            buildBoxShadow(),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: scaleWidth(context) / 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Yankinbubbletea",
                    style: ConfigStyle.boldStyle(FONT_LARGE - 4, BLACK_HEAVY),
                  ),
                  Text(
                    "Date : $date",
                    style: ConfigStyle.boldStyle(FONT_LARGE - 4, BLACK_HEAVY),
                  ),
                  InkWell(
                    onTap: () {
                      onTapDeleteIcon();
                    },
                    child: Icon(Icons.delete, color: Colors.red, size: 28),
                  ),
                ],
              ),
            ),
            SizedBox(height: scaleHeight(context) / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: scaleHeight(context) / 6,
                        height: scaleHeight(context) / 6,
                        child: Image.asset('assets/images/option_logo.jpg')),
                    SizedBox(width: scaleHeight(context) / 10),
                    Column(
                      children: [
                        Text(
                          "Voucher No: $voucherNo",
                          style: ConfigStyle.boldStyle(
                              FONT_LARGE - 4, BLACK_LIGHT),
                        ),
                        Text(
                          "Total : $totalPrice",
                          style: ConfigStyle.boldStyle(
                              FONT_LARGE - 4, BLACK_LIGHT),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                  child: InkWell(
                    onTap: () {
                      onTapDetail();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 50),
                      width: scaleHeight(context) / 3,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: BUTTON_COLOR, width: 1),
                      ),
                      child: Center(
                        child: Text("DETAIL",
                            style: ConfigStyle.boldStyle(
                                FONT_LARGE - 4, WHITE_COLOR)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
