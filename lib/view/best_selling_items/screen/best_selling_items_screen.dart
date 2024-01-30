import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/main_login/screen/main_login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import '../../Admin/screen/admin_screen.dart';
import '../../cashback_and_promotion/screen/cashback_and_promotion_screen.dart';
import '../../inventory/screen/inventory_screen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../inventory/widgets/drawer_property_list_view.dart';
import '../../sale_and_history/screen/sale_and_history_screen.dart';
import '../../best_selling_items/widgets/best_selling_item_detail_view.dart';
import '../bloc/best_selling_items_bloc.dart';

class BestSellingItemsScreen extends StatelessWidget {
  const BestSellingItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BestSellingItemsBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          drawer: Drawer(
            width: scaleWidth(context) / 3,
            child: Consumer<BestSellingItemsBloc>(
              builder: (context, bloc, child) => DrawerPropertyListView(
                groupValue: bloc.value,
                onTapInventory: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InventoryScreen()));
                },
                onTapBestSellingItems: () {},
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
              title: "Best Selling Items",
              onTapBack: () {},
            ),
          ),
          body: SingleChildScrollView(
            child: Consumer<BestSellingItemsBloc>(
              builder: (context, bloc, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () => bloc.onDatePick(context),
                          icon: Icon(Icons.calendar_today)),
                      Text(bloc.queryDate ?? "2023-05-17"),
                      IconButton(
                          onPressed: () => bloc.onQueryByDate(),
                          icon: Icon(Icons.search)),
                    ],
                  ),
                  SizedBox(height: scaleHeight(context) / 40),
                  Container(
                    height: scaleHeight(context) * 0.75,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          BestSellingItemDetailView(
                              productName:
                                  bloc.itemList?[index].productName ?? "name",
                              productImage:
                                  bloc.itemList?[index].productImage ?? "",
                              sizeName:
                                  bloc.itemList?[index].sizeName ?? "sizeName",
                              totalProfits:
                                  bloc.itemList?[index].totalProfits ?? 0,
                              qty: bloc.itemList?[index].qty ?? 0),
                      itemCount: bloc.itemList?.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
