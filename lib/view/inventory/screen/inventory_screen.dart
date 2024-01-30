// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/brand_list/screen/brand_list_screen.dart';
import 'package:multipurpose_pos_application/view/category_list/screen/category_list_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/bloc/inventory_bloc.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/drawer_property_list_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/option_item_for_inventory_view.dart';
import 'package:multipurpose_pos_application/view/main_login/screen/main_login_screen.dart';
import 'package:multipurpose_pos_application/view/product_list/screen/product_list_screen.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/screen/sale_and_history_screen.dart';
import 'package:multipurpose_pos_application/view/subcategory_list/screen/subcategory_list_screen.dart';
import 'package:multipurpose_pos_application/view/best_selling_items/screen/best_selling_items_screen.dart';
import 'package:multipurpose_pos_application/view/cashback_and_promotion/screen/cashback_and_promotion_screen.dart';
import 'package:provider/provider.dart';

import '../../Admin/screen/admin_screen.dart';
import '../../RawMaterialList/screen/raw_material_list_screen.dart';
import '../../promotion_list/screen/promotion_list_screen.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InventoryBloc(),
      child: Scaffold(
        drawer: Drawer(
          width: scaleWidth(context) / 3,
          child: Consumer<InventoryBloc>(
            builder: (context, bloc, child) => DrawerPropertyListView(
              groupValue: bloc.value,
              onTapInventory: () {},
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
                //  bloc.onTapRadio(value ?? 1);
              },
              onTapLogOut: () {
                bloc.onTapLogOut().then((value) {
                  Functions.replacementTransition(
                      context, const MainLoginScreen());
                });
              },
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
          child: CommonAppBarView(
            title: "Inventory",
            onTapBack: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<InventoryBloc>(
            builder: (context, bloc, child) => GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(context) / 6,
                vertical: scaleWidth(context) / 40,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: scaleHeight(context) / 4,
              ),
              itemBuilder: (context, index) {
                return OptionItemForInventoryView(
                  name: bloc.inventoryList[index].name ?? "",
                  icon: bloc.inventoryList[index].icon ?? Icons.filter_none,
                  onTap: (name) {
                    if (name == "Category") {
                      Functions.transition(context, CategoryListScreen());
                    } else if (name == "Subcategory") {
                      Functions.bottomTopUp(
                          context, const SubCategoryListScreen());
                    } else if (name == "Brand") {
                      Functions.rightToLeftTransition(
                          context, const BrandListScreen());
                    } else if (name == "Product") {
                      Functions.transition(context, ProductListScreen());
                    } else if (name == "Material") {
                      Functions.transition(context, RawMaterialListScreen());
                    } else if (name == "Promotion") {
                      Functions.transition(context, PromotionListScreen());
                    }
                  },
                );
              },
              itemCount: bloc.inventoryList.length,
            ),
          ),
        ),
      ),
    );
  }
}
