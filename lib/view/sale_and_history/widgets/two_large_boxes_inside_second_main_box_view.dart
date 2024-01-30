import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/sale/screen/sale_screen.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/widgets/large_box_detail_view.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/widgets/large_box_for_sale_and_history_page_view.dart';

import '../../voucher_history/screen/voucher_history_screen.dart';

class TwoLargeBoxesInsideSecondMainBoxView extends StatelessWidget {
  const TwoLargeBoxesInsideSecondMainBoxView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(context) / 1.8,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context) / 20,
          vertical: scaleWidth(context) / 30,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              LargeBoxFoSaleAndHistoryPageView(
                widget: LargeBoxDetailView(
                  title: "Voucher History",
                  image: "assets/images/vouncher_history.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VoucherHistoryScreen()));
                  },
                ),
              ),
              const Spacer(),
              LargeBoxFoSaleAndHistoryPageView(
                widget: LargeBoxDetailView(
                  title: "Sale Page",
                  image: "assets/images/sales.png",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SaleScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
