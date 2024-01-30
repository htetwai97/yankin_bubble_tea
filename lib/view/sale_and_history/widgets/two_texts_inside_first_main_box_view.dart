import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/sales_amounts_vo.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/bloc/sale_and_history_bloc.dart';
import 'package:provider/provider.dart';

class TwoTextsInsideFirstMainBoxView extends StatelessWidget {
  const TwoTextsInsideFirstMainBoxView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Container(
      height: scaleHeight(context) / 1.8,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            APP_THEME_COLOR_TWO_REDUCE,
            APP_THEME_COLOR_REDUCE,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: scaleHeight(context) / 20,
              bottom: scaleHeight(context) / 4,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "TODAY $today",
                style: ConfigStyle.boldStyle(
                  FONT_LARGE - 4,
                  WHITE_COLOR,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Selector<SaleAndHistoryBloc, SaleAmountVO?>(
              selector: (context, bloc) => bloc.saleAmountTotal,
              builder: (context, saleAmountVO, child) => Text(
                "TOTAL SALES : ${saleAmountVO?.totalSales} MMK",
                style: ConfigStyle.regularStyle(
                  FONT_LARGE - 2,
                  WHITE_COLOR,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
