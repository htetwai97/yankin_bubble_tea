// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/Admin/screen/admin_screen.dart';
import 'package:provider/provider.dart';
import 'package:multipurpose_pos_application/view/customer_list/widgets/customer_title_view.dart';
import 'package:multipurpose_pos_application/view/customer_create/screen/customer_create_screen.dart';
import '../../../core/core_config/config_color.dart';
import '../../customer_edit/screen/customer_edit_screen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../bloc/customer_list_bloc.dart';
import '../widgets/customer_detail_view.dart';

class CustomerListScreen extends StatelessWidget {
  bool newScreen;
  CustomerListScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerListBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: BUTTON_COLOR,
            onPressed: () {
              Functions.rightToLeftTransition(
                  context, const CustomerCreateScreen());
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
              title: "Customer List Page",
            ),
          ),
          body: Selector<CustomerListBloc, bool>(
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
                            child: CustomerTitleView(),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            height: scaleHeight(context) / 1.6,
                            child: Consumer<CustomerListBloc>(
                              builder: (context, bloc, child) =>
                                  ListView.builder(
                                itemBuilder: (context, index) =>
                                    CustomerDetailView(
                                  name: bloc.customerList?[index].name ?? "",
                                  tax:
                                      bloc.customerList?[index].taxPercent ?? 0,
                                  phone: bloc.customerList?[index].phone ?? "",
                                  onTap: () {
                                    Functions.editDialog(
                                      context,
                                      scaleHeight(context) / 3.4,
                                      () {
                                        Navigator.pop(context);
                                        Functions.rightToLeftTransition(
                                            context,
                                            CustomerEditScreen(
                                              customerVO:
                                                  bloc.customerList?[index],
                                            ));
                                      },
                                      () {
                                        Navigator.pop(context);
                                        Functions.toast(msg: "Cancel Editing");
                                      },
                                      "Edit Data",
                                      "Do you want to edit data?",
                                      "EDIT",
                                      "CANCEL",
                                    );
                                  },
                                ),
                                itemCount: bloc.customerList?.length,
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
