import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/main_login/screen/main_login_screen.dart';
import 'package:provider/provider.dart';
import '../../customer_list/screen/CustomerListScreen.dart';
import '../../employee_list/screen/employee_list_screen.dart';
import '../../supplier_list/screen/supplier_list_screen.dart';
import '../../inventory/screen/inventory_screen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../inventory/widgets/drawer_property_list_view.dart';
import '../../inventory/widgets/option_item_for_inventory_view.dart';
import '../../sale_and_history/screen/sale_and_history_screen.dart';
import '../../best_selling_items/screen/best_selling_items_screen.dart';
import '../../cashback_and_promotion/screen/cashback_and_promotion_screen.dart';
import '../bloc/admin_bloc.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminBloc(),
      child: Scaffold(
        drawer: Drawer(
          width: scaleWidth(context) / 3,
          child: Consumer<AdminBloc>(
            builder: (context, bloc, child) => DrawerPropertyListView(
              groupValue: bloc.value,
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
              onTapAdmin: () {},
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
            title: "Admin",
            onTapBack: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<AdminBloc>(
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
                    if (name == "Supplier") {
                      Functions.transition(context, SupplierListScreen());
                    } else if (name == "Customer") {
                      Functions.bottomTopUp(context, CustomerListScreen());
                    } else if (name == "Employee") {
                      Functions.transition(context, EmployeeListScreen());
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
