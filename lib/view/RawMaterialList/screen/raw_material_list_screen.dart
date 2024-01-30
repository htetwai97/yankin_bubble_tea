// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/RawMaterialList/screen/popping_list_screen.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/screen/category_create_or_edit_screen.dart';

import 'package:multipurpose_pos_application/view/RawMaterialEdit/screen/raw_material_edit_screen.dart';
import 'package:multipurpose_pos_application/view/category_list/bloc/category_list_bloc.dart';
import 'package:multipurpose_pos_application/view/category_list/widgets/category_title_view.dart';
import 'package:multipurpose_pos_application/view/inventory/screen/inventory_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_style.dart';
import '../../RawMaterialCreate/screen/raw_material_create_screen.dart';
import '../bloc/raw_material_list_bloc.dart';
import '../widgets/raw_material_title_view.dart';
import '../widgets/common_item_detail_view.dart';

class RawMaterialListScreen extends StatelessWidget {
  bool newScreen;
  RawMaterialListScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RawMaterialListBloc(false),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: BUTTON_COLOR,
          onPressed: () {
            Functions.rightToLeftTransition(context, RawMaterialCreateScreen());
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
                Functions.replacementTransition(
                    context, const InventoryScreen());
              } else {
                Navigator.pop(context);
              }
            },
            title: "Raw Material List Page",
          ),
        ),
        body: Selector<RawMaterialListBloc, bool>(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Popping List",
                                  style: ConfigStyle.boldStyle(
                                      FONT_LARGE - 4, BLACK_LIGHT)),
                              SizedBox(width: scaleWidth(context) / 40),
                              InkWell(
                                onTap: () {
                                  Functions.replacementTransition(
                                      context, const PoppingListScreen());
                                },
                                child: const Icon(Icons.arrow_forward_outlined,
                                    color: Colors.green, size: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: APP_THEME_COLOR_TWO_REDUCE,
                          ),
                          child: RawMaterialTitleView(),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          height: scaleHeight(context) / 1.6,
                          child: Consumer<RawMaterialListBloc>(
                            builder: (context, bloc, child) => ListView.builder(
                              itemBuilder: (context, index) =>
                                  CommonItemDetailView(
                                name: bloc.rawMaterialList?[index].name ?? "",
                                stockQty: bloc.rawMaterialList?[index]
                                            .inStockQty !=
                                        null
                                    ? "${bloc.rawMaterialList?[index].inStockQty}"
                                    : "0",
                                purchasePrice: bloc.rawMaterialList?[index]
                                            .purchasePrice !=
                                        null
                                    ? "${bloc.rawMaterialList?[index].purchasePrice}"
                                    : "0",
                                onTap: () {
                                  Functions.editDialog(
                                    context,
                                    scaleHeight(context) / 3.4,
                                    () {
                                      Navigator.pop(context);
                                      Functions.rightToLeftTransition(
                                          context,
                                          RawMaterialEditScreen(
                                              rawMaterialVO: bloc
                                                  .rawMaterialList?[index]));
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
                              itemCount: bloc.rawMaterialList?.length,
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
    );
  }
}
