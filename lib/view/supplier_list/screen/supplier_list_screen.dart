import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../Admin/screen/admin_screen.dart';
import '../../supplier_create/screen/supplier_create_screen.dart';
import '../../supplier_edit/screen/supplier_edit_screen.dart';
import 'package:multipurpose_pos_application/view/supplier_list/bloc/supplier_list_bloc.dart';

import 'package:multipurpose_pos_application/view/supplier_list/widgets/supplier_title_view.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../widgets/supplier_detail_view.dart';

class SupplierListScreen extends StatelessWidget {
  bool newScreen;
  SupplierListScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupplierListBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: BUTTON_COLOR,
            onPressed: () {
              Functions.rightToLeftTransition(
                  context, const SupplierCreateScreen());
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: WHITE_COLOR,
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                if (newScreen) {
                  Functions.replacementTransition(context, const AdminScreen());
                } else {
                  Navigator.pop(context);
                }
              },
              title: "Supplier List Page",
            ),
          ),
          body: Selector<SupplierListBloc, bool>(
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
                      padding: EdgeInsets.only(
                        left: scaleWidth(context) / 5,
                        right: scaleWidth(context) / 5,
                        top: 6,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: APP_THEME_COLOR_TWO_REDUCE,
                            ),
                            child: SupplierTitleView(),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            height: scaleHeight(context) / 1.6,
                            child: Consumer<SupplierListBloc>(
                              builder: (context, bloc, child) =>
                                  ListView.builder(
                                itemBuilder: (context, index) =>
                                    SupplierDetailView(
                                  name: bloc.supplierList?[index].name ?? "",
                                  address:
                                      bloc.supplierList?[index].address ?? "",
                                  phone: bloc.supplierList?[index].phone ?? "",
                                  onTap: () {
                                    Functions.editDialog(
                                        context, scaleHeight(context) / 3.4,
                                        () {
                                      Functions.rightToLeftTransition(
                                          context,
                                          SupplierEditScreen(
                                            supplierVO:
                                                bloc.supplierList?[index],
                                          ));
                                      Navigator.pop(context);
                                    }, () {
                                      Navigator.pop(context);
                                      Functions.toast(msg: "Cancel Editing");
                                    }, "Edit Data", "Do you want to edit data?",
                                        "EDIT", "CANCEL");
                                  },
                                ),
                                itemCount: bloc.supplierList?.length,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
