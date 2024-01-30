// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_add_other_need_for_product_edit/screen/ingredient_add_other_need_for_product_edit_screen.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/bloc/ingredient_list_for_product_edit_bloc.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_item_listview.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_price_editing_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/add_other_need_view.dart';
import 'package:multipurpose_pos_application/view/product_list/screen/product_list_screen.dart';
import 'package:provider/provider.dart';

class IngredientListForProductEditScreen extends StatelessWidget {
  const IngredientListForProductEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IngredientListForProductEditBloc(),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: Consumer<IngredientListForProductEditBloc>(
              builder: (context, bloc, child) => CommonAppBarView(
                onTapBack: () {
                  bloc.onTapCancel().then((value) {
                    Functions.replacementTransition(
                        context,
                        ProductListScreen(
                          newScreen: true,
                          isSomethingChanged: true,
                        ));
                  });
                },
                title: "Ingredient Create Page",
                automaticImply: false,
                isEnableBack: true,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: scaleWidth(context) / 5),
              child: Column(
                children: [
                  AddOtherNeedView(
                    onTap: () {
                      Functions.bottomTopUp(
                        context,
                        const IngredientAddOtherNeedForProductEditScreen(),
                      );
                    },
                  ),
                  SizedBox(height: scaleHeight(context) / 20),
                  Consumer<IngredientListForProductEditBloc>(
                    builder: (context, bloc, child) => Visibility(
                      visible: (bloc.sizeOfIngredientList?.isNotEmpty ?? false),
                      child: IngredientItemListView(
                        sizeOfIngredientList: bloc.sizeOfIngredientList ?? [],
                        onTapEdit: (requestSizeObject) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return IngredientPriceEditingView(
                                  title: "Price Change Dialog",
                                  sellFocus: bloc.sellFocus,
                                  deliFocus: bloc.deliFocus,
                                  onChangeDeliPrice: (deliPrice) {
                                    bloc.onChangeDeliPrice(deliPrice);
                                  },
                                  onChangeSellingPrice: (sellPrice) {
                                    bloc.onChangeSellPrice(sellPrice);
                                  },
                                  onDeliPriceEditingComplete: () {
                                    bloc.onDeliPriceEditingComplete();
                                  },
                                  onSellPriceEditingComplete: () {
                                    bloc.onSellPriceEditingComplete();
                                  },
                                  onTapCross: () {
                                    bloc.onTapCross();
                                    Navigator.pop(context);
                                  },
                                  onTapOK: () {
                                    bloc
                                        .onTapOk(requestSizeObject)
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                );
                              });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: scaleHeight(context) / 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleHeight(context) / 10),
                    child: Consumer<IngredientListForProductEditBloc>(
                      builder: (context, bloc, child) => CategoryButtonsView(
                        text: "Edit",
                        onTapCancel: () {
                          bloc.onTapCancel().then((value) {
                            Functions.replacementTransition(
                                context,
                                ProductListScreen(
                                  newScreen: true,
                                  isSomethingChanged: true,
                                ));
                          });
                        },
                        onTapCreate: () {
                          bloc.onTapEdit().then((value) {
                            Functions.replacementTransition(
                                context,
                                ProductListScreen(
                                  newScreen: true,
                                  isSomethingChanged: true,
                                ));
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
