import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/sales_amounts_vo.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/bloc/sale_and_history_bloc.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/widgets/small_box_for_sale_and_history_page_view.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/widgets/title_and_icon_for_smallbox_view.dart';
import 'package:provider/provider.dart';

class TwoSmallBoxesView extends StatelessWidget {
  const TwoSmallBoxesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: scaleHeight(context) / 4.4),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            SmallBoxForSaleAndHistoryPageView(
              widget: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: scaleHeight(context) / 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleAndIconForSmallBox(
                        title: "This Month",
                        iconData: MdiIcons.calendarWeek,
                      ),
                      const Spacer(),
                      Selector<SaleAndHistoryBloc,SaleAmountVO?>(
                        selector: (context,bloc)=>bloc.saleAmountTotal,
                        builder: (context,saleAmountVO,child)=>
                       Text(
                          "${saleAmountVO?.thisMonthSales} MMK",
                          style:
                              ConfigStyle.boldStyle(FONT_LARGE - 4, BLACK_HEAVY),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            SmallBoxForSaleAndHistoryPageView(
              widget: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: scaleHeight(context) / 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleAndIconForSmallBox(
                        title: "Today Sales",
                        iconData: MdiIcons.calendarAlert,
                      ),
                      const Spacer(),
                      Selector<SaleAndHistoryBloc,SaleAmountVO?>(
                        selector: (context,bloc)=>bloc.saleAmountTotal,
                        builder: (context,saleAmountVO,child)=>
                        Text(
                          "${saleAmountVO?.todaySales} MMK",
                          style:
                              ConfigStyle.boldStyle(FONT_LARGE - 4, BLACK_HEAVY),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
