// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_add_other_need_for_product_create/screen/ingredient_add_other_need_for_product_create_screen.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_item_listview.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/product_create/bloc/product_create_bloc.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/add_other_need_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/drop_down_for_product_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/image_picking_box_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/two_text_view_for_product_create_and_edit_view.dart';
import 'package:multipurpose_pos_application/view/product_list/screen/product_list_screen.dart';
import 'package:provider/provider.dart';

class ProductCreateScreen extends StatelessWidget {
  const ProductCreateScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductCreateBloc(),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: Consumer<ProductCreateBloc>(
              builder: (context, bloc, child) => CommonAppBarView(
                onTapBack: () {
                  bloc.onTapCancel().then((value) {
                    Functions.replacementTransition(
                      context,
                      ProductListScreen(
                        newScreen: true,
                        isSomethingChanged: true,
                      ),
                    );
                  }).catchError((e) {
                    Functions.toast(
                        msg: "Product Id required to delete", status: false);
                  });
                },
                title: "Product Create Page",
                automaticImply: false,
                isEnableBack: true,
              ),
            ),
          ),
          body: Selector<ProductCreateBloc, bool>(
              selector: (context, bloc) => bloc.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return Center(
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
                  );
                } else {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: scaleHeight(context) / 3,
                          vertical: scaleHeight(context) / 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: scaleWidth(context) / 2.4,
                                child: Consumer<ProductCreateBloc>(
                                  builder: (context, bloc, child) =>
                                      TwoTextFieldForProductCreateAndEditView(
                                    firstFocusNode: bloc.firstFocusNode,
                                    secondFocusNode: bloc.secondFocusNode,
                                    preDefinedProductName: bloc.productName,
                                    preDefinedDescription: bloc.description,
                                    onChangeProductName: (productName) {
                                      bloc.onChangeProductName(productName);
                                    },
                                    onChangeDescription: (description) {
                                      bloc.onChangeDescription(description);
                                    },
                                    onFirstEditingComplete: () {
                                      bloc.onFirstEditingComplete();
                                    },
                                    onSecondEditingComplete: () {
                                      bloc.onSecondEditingComplete();
                                    },
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Consumer<ProductCreateBloc>(
                                builder: (context, bloc, child) =>
                                    ImagePickingBoxView(
                                  file: bloc.file,
                                  onTapImagePicker: () async {
                                    final ImagePicker imagePicker =
                                        ImagePicker();
                                    final XFile? image = await imagePicker
                                        .pickImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      bloc.onChangeFile(File(image.path));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          Consumer<ProductCreateBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                              predefinedText: (bloc.displayIndex == 0)
                                  ? null
                                  : bloc.displayIndex.toString(),
                              focusNode: bloc.thirdFocusNode,
                              numberOnly: true,
                              isFilled: true,
                              isBorderIncluded: true,
                              labelText: "Display Serial no",
                              onChanged: (serialNO) {
                                bloc.onChangeDisplayIndex(serialNO);
                              },
                              onEditingComplete: () {
                                bloc.onThirdEditingComplete();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          Consumer<ProductCreateBloc>(
                            builder: (context, bloc, child) =>
                                DropDownForProductView(
                              selectedValue: bloc.categoryDropDownValue,
                              menuTitle: "Choose Category",
                              list: bloc.categoryNameList,
                              onChange: (value) {
                                bloc.onChangedCategory(value ?? "");
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AddOtherNeedView(
                              onTap: () {
                                ProductCreateBloc blocDialog =
                                    Provider.of<ProductCreateBloc>(context,
                                        listen: false);
                                blocDialog.onTapAddOtherNeed().then((value) {
                                  Functions.bottomTopUp(
                                    context,
                                    const IngredientAddOtherNeedForProductCreateScreen(),
                                  );
                                });
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          Consumer<ProductCreateBloc>(
                            builder: (context, bloc, child) => Visibility(
                              visible: (bloc.sizeOfIngredientList?.isNotEmpty ??
                                  false),
                              child: IngredientItemListView(
                                visibleEdit: false,
                                sizeOfIngredientList:
                                    bloc.sizeOfIngredientList ?? [],
                                onTapEdit: (sizeOfIngredientVO) {},
                              ),
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CategoryButtonsView(
                              onTapCancel: () {
                                ProductCreateBloc bloc =
                                    Provider.of<ProductCreateBloc>(context,
                                        listen: false);
                                bloc.onTapCancel().then((value) {
                                  Functions.replacementTransition(
                                    context,
                                    ProductListScreen(
                                      newScreen: true,
                                      isSomethingChanged: true,
                                    ),
                                  );
                                }).catchError((e) {
                                  Functions.toast(
                                      msg: "Product Id required to delete",
                                      status: false);
                                });
                              },
                              onTapCreate: () {
                                ProductCreateBloc bloc =
                                    Provider.of<ProductCreateBloc>(context,
                                        listen: false);
                                bloc.onTapCreate().then((value) {
                                  Functions.replacementTransition(
                                    context,
                                    ProductListScreen(
                                      newScreen: true,
                                      isSomethingChanged: true,
                                    ),
                                  );
                                }).onError((error, stackTrace) {
                                  Functions.toast(
                                      msg: error.toString(), status: false);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
