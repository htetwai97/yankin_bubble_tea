import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/cashback_and_promotion/widgets/cashback_promo_title.dart';
import 'package:multipurpose_pos_application/view/inventory/screen/inventory_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/drawer_property_list_view.dart';
import 'package:multipurpose_pos_application/view/main_login/screen/main_login_screen.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/bloc/sale_and_history_bloc.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/widgets/two_large_boxes_inside_second_main_box_view.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/widgets/two_small_boxes_view.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/widgets/two_texts_inside_first_main_box_view.dart';
import 'package:provider/provider.dart';
import '../../Admin/screen/admin_screen.dart';
import '../../best_selling_items/screen/best_selling_items_screen.dart';
import '../../cashback_and_promotion/screen/cashback_and_promotion_screen.dart';

class SaleAndHistoryScreen extends StatelessWidget {
  const SaleAndHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SaleAndHistoryBloc(),
      child: Scaffold(
        drawer: Drawer(
          width: scaleWidth(context) / 3,
          child: Consumer<SaleAndHistoryBloc>(
            builder: (context, bloc, child) => DrawerPropertyListView(
              groupValue: 1,
              onTapInventory: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InventoryScreen()));
              },
              onTapBestSellingItems: () {
                Functions.rightToLeftTransition(
                    context, const BestSellingItemsScreen());
              },
              onTapAdmin: () {
                Functions.rightToLeftTransition(context, const AdminScreen());
              },
              onTapSaleAndHistory: () {},
              onTapCashbackAndPromotion: () {
                Functions.rightToLeftTransition(
                    context, const CashbackAndPromotionScreen());
              },
              onTapRadio: (value) {},
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
            title: "Sale and History",
            onTapBack: () {},
          ),
        ),
        body: Selector<SaleAndHistoryBloc, bool>(
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        child: Column(
                          children: const [
                            TwoTextsInsideFirstMainBoxView(),
                            TwoLargeBoxesInsideSecondMainBoxView(),
                          ],
                        ),
                      ),
                      const TwoSmallBoxesView(),
                    ],
                  ),
                );
              }
            },
            selector: (context, bloc) => bloc.isLoading),
      ),
    );
  }
}
