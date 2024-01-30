// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/screen/ingredient_list_for_product_edit_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/screen/inventory_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/product_create/screen/product_create_screen.dart';
import 'package:multipurpose_pos_application/view/product_detail/screen/product_detail_screen.dart';
import 'package:multipurpose_pos_application/view/product_edit/screen/product_edit_screen.dart';
import 'package:multipurpose_pos_application/view/product_list/bloc/product_list_bloc.dart';
import 'package:multipurpose_pos_application/view/product_list/widgets/option_selection_dialog_view.dart';
import 'package:multipurpose_pos_application/view/product_list/widgets/product_obj_detail_view.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  bool newScreen;
  bool isSomethingChanged;
  ProductListScreen({
    Key? key,
    this.newScreen = false,
    this.isSomethingChanged = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductListBloc(isSomethingChanged),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: BUTTON_COLOR,
          onPressed: () {
            Functions.rightToLeftTransition(
                context, const ProductCreateScreen());
          },
          child: const Icon(
            Icons.add_circle_outline,
            color: WHITE_COLOR,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
          child: CommonAppBarView(
            onTapBack: () {
              if (newScreen) {
                Functions.replacementTransition(
                    context, const InventoryScreen());
              } else {
                Navigator.pop(context);
              }
            },
            title: "Product List Page",
            automaticImply: false,
            isEnableBack: true,
          ),
        ),
        body: Selector<ProductListBloc, bool>(
          selector: (context, bloc) => bloc.isApiCalling,
          builder: (context, isApiCalling, child) => Stack(
            children: [
              Consumer<ProductListBloc>(builder: (context, bloc, child) {
                if (bloc.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        vertical: scaleWidth(context) / 40,
                        horizontal: 10,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 2.2

                              ///mainAxisExtent: scaleHeight(context) / 2.5,
                              ),
                      itemBuilder: (context, index) {
                        var product = bloc.productList?[index];
                        return ProductIObjDetailView(
                          productName: product?.name ?? "error",
                          productUrl: product?.photo ?? "",
                          onTapEdit: () {
                            Functions.editAndDeleteDialog(
                              context,
                              scaleHeight(context) / 3.4,
                              () {
                                Functions.rightToLeftTransition(
                                    context,
                                    ProductEditScreen(
                                      productVO: product,
                                    ));
                              },
                              () {
                                Navigator.pop(context);
                                Functions.toast(msg: "Cancel Editing");
                              },
                              () {
                                Navigator.pop(context);
                                bloc.onTapDelete(product?.id).then((value) {
                                  Functions.replacementTransition(
                                      context,
                                      ProductListScreen(
                                        newScreen: true,
                                        isSomethingChanged: true,
                                      ));
                                });
                              },
                              "Edit Data",
                              "Do you want to edit data?",
                              "EDIT",
                              "CANCEL",
                              "DELETE",
                            );
                          },
                          onTapIngredient: () {
                            var sizeOfIngredientList =
                                bloc.productList?[index].sizeOfIngredient;
                            var productId = bloc.productList?[index].id;
                            bloc
                                .onTapIngredient(
                                    sizeOfIngredientList, productId)
                                .then((value) {
                              Functions.transition(context,
                                  const IngredientListForProductEditScreen());
                            });
                          },
                          onTapOption: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return OptionSelectionShowDialogView(
                                    productId: bloc.productList?[index].id,
                                    dropDownValues: bloc.rawMaterialNameList,
                                    rawMaterialList: bloc.rawMaterialList ?? [],
                                    onTapRegister: (requestIngredientList) {
                                      bloc
                                          .onTapRegister(requestIngredientList)
                                          .then(
                                            (value) =>
                                                Functions.replacementTransition(
                                              context,
                                              ProductListScreen(
                                                newScreen: true,
                                                isSomethingChanged: true,
                                              ),
                                            ),
                                          );
                                    },
                                  );
                                });
                          },
                          onTapDetail: () {
                            Functions.transition(
                                context,
                                ProductDetailScreen(
                                    productVO: bloc.productList?[index]));
                          },
                        );
                      },
                      itemCount: bloc.productList?.length,
                    ),
                  );
                }
              }),
              Visibility(
                visible: isApiCalling,
                child: Center(
                  child: SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? APP_THEME_COLOR_REDUCE
                              : CARD_FIRST_COLOR,
                        ),
                      );
                    },
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
