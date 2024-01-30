import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/view/main_login/screen/main_login_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';
import '../../../core/core_function/functions.dart';
import '../../Admin/screen/admin_screen.dart';
import '../../inventory/screen/inventory_screen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../inventory/widgets/drawer_property_list_view.dart';
import '../../sale_and_history/screen/sale_and_history_screen.dart';
import '../../best_selling_items/screen/best_selling_items_screen.dart';
import '../bloc/cashback_and_promotion_bloc.dart';
import '../widgets/cashback_promo_item_view.dart';
import '../widgets/cashback_promo_title.dart';
import '../widgets/drop_down.dart';
import '../widgets/date_view.dart';

class CashbackAndPromotionScreen extends StatelessWidget {
  const CashbackAndPromotionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CashbackAndPromotionBloc(),
      child: Scaffold(
        drawer: Drawer(
          width: scaleWidth(context) / 3,
          child: Consumer<CashbackAndPromotionBloc>(
            builder: (context, bloc, child) => DrawerPropertyListView(
              groupValue: bloc.value,
              onTapInventory: () {
                Functions.rightToLeftTransition(
                    context, const InventoryScreen());
              },
              onTapBestSellingItems: () {
                Functions.rightToLeftTransition(
                    context, const BestSellingItemsScreen());
              },
              onTapAdmin: () {
                Functions.rightToLeftTransition(context, const AdminScreen());
              },
              onTapSaleAndHistory: () {
                Functions.rightToLeftTransition(
                    context, const SaleAndHistoryScreen());
              },
              onTapCashbackAndPromotion: () {
                Functions.rightToLeftTransition(
                    context, const CashbackAndPromotionScreen());
              },
              onTapRadio: (value) {
               // bloc.onTapRadio(value ?? 1);
              },
              onTapLogOut: () {
                bloc.onTapLogOut().then((value) =>
                    Functions.replacementTransition(
                        context, const MainLoginScreen()));
              },
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
          child: CommonAppBarView(
            onTapBack: () {},
            title: "Cashback and Promotion Review",
          ),
        ),
        body: Selector<CashbackAndPromotionBloc, bool>(
          selector: (context, bloc) => bloc.isLoading,
          builder: (context, isLoading, child) => Stack(
            children: [
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(top: scaleHeight(context) / 20),
                    child: Consumer<CashbackAndPromotionBloc>(
                      builder: (context, bloc, child) => Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: scaleWidth(context) / 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: scaleHeight(context) / 30),
                                  child: Text(
                                    "Type : ",
                                    style: ConfigStyle.regularStyle(
                                        FONT_MEDIUM, BLACK_HEAVY),
                                  ),
                                ),
                                DropDown(
                                  selectedValue: bloc.selectedType,
                                  menuTitle: "Cashback",
                                  list: const [
                                    "Cashback",
                                    "Promotion",
                                    "Reward",
                                    "CT 5%"
                                  ],
                                  onChange: (value) {
                                    bloc.onChangedPromotionType(value ?? "");
                                  },
                                ),
                                DateView(
                                  dateName: bloc.startDate ?? "Start Date",
                                  onTapDateIcon: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2021, 3),
                                      lastDate: DateTime(2101),
                                    );
                                    bloc.onStartDatePick(picked!);
                                  },
                                ),
                                DateView(
                                    dateName: bloc.endDate ?? "End Date",
                                    onTapDateIcon: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2021, 3),
                                        lastDate: DateTime(2101),
                                      );
                                      bloc.onEndDatePick(picked!);
                                    }),
                                IconButton(
                                    onPressed: () => bloc.onQueryByDate(),
                                    icon: Icon(Icons.search)),
                              ],
                            ),
                          ),
                          CashbackPromoTitle(
                              voucherTotal:
                                  "Voucher Total:     ${bloc.totalPrice}",
                              discountTotal:
                                  "Discount Total:     ${bloc.discountTotal}"),
                          SizedBox(
                            height: scaleHeight(context) * 0.5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: scaleHeight(context) / 25),
                              child: ListView.builder(
                                itemBuilder: (context, index) => CashbackPromoItemView(
                                    voucherNo: bloc.cbPromoCollection?[index]
                                            .voucherNumber ??
                                        "",
                                    voucherDate:
                                        bloc.cbPromoCollection?[index].voucherDate ??
                                            "",
                                    voucherTotal: bloc.cbPromoCollection?[index].voucherTotal != null
                                        ? "${bloc.cbPromoCollection?[index].voucherTotal}"
                                        : "0",
                                    promotionType:
                                        bloc.cbPromoCollection?[index].promotionName ??
                                            "",
                                    discountAmount:
                                        bloc.cbPromoCollection?[index].discountAmount != null
                                            ? "${bloc.cbPromoCollection?[index].discountAmount}"
                                            : "zero",
                                    discountPercent:
                                        bloc.cbPromoCollection?[index].discountPercent != null
                                            ? "${bloc.cbPromoCollection?[index].discountPercent}"
                                            : "0"),
                                itemCount: bloc.cbPromoCollection?.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                              ),
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
      ),
    );
  }
}
