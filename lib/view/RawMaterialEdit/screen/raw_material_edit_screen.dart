import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:provider/provider.dart';
import '../../../core/core_config/config_style.dart';
import '../../../data/vos/raw_material_vo.dart';
import '../../RawMaterialCreate/widgets/radio_btn_for_raw_material_screen.dart';
import '../../RawMaterialCreate/widgets/topping_addition_dialog.dart';
import '../../RawMaterialList/screen/raw_material_list_screen.dart';
import '../../category_create_or_edit/widgets/category_buttons_view.dart';
import '../../employee_create/widgets/employee_profile_view.dart';
import '../bloc/raw_material_edit_bloc.dart';
import '../../RawMaterialCreate/widgets/drop_down.dart';

class RawMaterialEditScreen extends StatelessWidget {
  RawMaterialVO? rawMaterialVO;
  RawMaterialEditScreen({Key? key, required this.rawMaterialVO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RawMaterialEditBloc(rawMaterialVO),
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                Navigator.pop(context);
              },
              title: "Raw Material Edit Page",
            ),
          ),
          body: Selector<RawMaterialEditBloc, bool>(
              selector: (context, bloc) => bloc.isLoading,
              builder: (context, isLoading, child) {
                // if (isLoading) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // } else {
                //
                // }
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: scaleHeight(context) / 3),
                        child: Column(
                          children: [
                            SizedBox(height: scaleHeight(context) / 30),

                            //extra topping dd
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) => DropDown(
                                selectedValue: bloc.extraToppingName,
                                menuTitle: "Extra Topping",
                                list: bloc.categoryNameList,
                                onChange: (value) {
                                  bloc.onChangedCategoryName(value ?? "");
                                },
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //choose brand dd
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) => DropDown(
                                selectedValue: bloc.brandName,
                                menuTitle: "Choose Brand",
                                list: bloc.brandNameList,
                                onChange: (value) {
                                  // bloc.onChangedPromotionType(value ?? "");
                                },
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //choose supplier dd
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) => DropDown(
                                selectedValue: bloc.supplierName,
                                menuTitle: "Choose Supplier",
                                list: bloc.supplierNameList,
                                onChange: (value) {
                                  bloc.onChangedSupplierName(value ?? "");
                                },
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //item name ctf
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) =>
                                  CommonTextFieldView(
                                labelText: "Item Name",
                                focusNode: bloc.firstFocusNode,
                                predefinedText: bloc.name,
                                onChanged: (e) {
                                  bloc.onChangedName(e);
                                },
                                onEditingComplete: () {
                                  bloc.onFirstEditingComplete();
                                },
                                isBorderIncluded: true,
                                isFilled: true,
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //quantity ctf
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) =>
                                  CommonTextFieldView(
                                labelText: "Quantity",
                                numberOnly: true,
                                focusNode: bloc.secondFocusNode,
                                predefinedText: "${bloc.inStockQty}",
                                onChanged: (e) {
                                  bloc.onChangedInStockQty(e);
                                },
                                onEditingComplete: () {
                                  bloc.onSecondEditingComplete();
                                },
                                isBorderIncluded: true,
                                isFilled: true,
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //gram dd
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) => DropDown(
                                selectedValue: bloc.unit,
                                menuTitle: "gram",
                                list: const [
                                  "gram",
                                  "liter",
                                  "milli gram",
                                  "pound"
                                ],
                                onChange: (value) {
                                  bloc.onChangeUnit(value!);
                                },
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //purchase price ctf
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) =>
                                  CommonTextFieldView(
                                labelText: "Purchase Price",
                                numberOnly: true,
                                focusNode: bloc.thirdFocusNode,
                                predefinedText: "${bloc.purchasePrice}",
                                onChanged: (e) {
                                  bloc.onChangedPurchasePrice(e);
                                },
                                onEditingComplete: () {
                                  bloc.onThirdEditingComplete();
                                },
                                isBorderIncluded: true,
                                isFilled: true,
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //reorder level ctf
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) =>
                                  CommonTextFieldView(
                                labelText: "Reorder Level",
                                numberOnly: true,
                                focusNode: bloc.fourthFocusNode,
                                predefinedText: "${bloc.reorderQty}",
                                onChanged: (e) {
                                  bloc.onChangedReorderLevel(e);
                                },
                                onEditingComplete: () {
                                  bloc.onFourthEditingComplete();
                                },
                                isBorderIncluded: true,
                                isFilled: true,
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 15),
                            //topping addition yes no
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) =>
                                  RadioBtnForRawMaterialScreen(
                                title: "Topping Addition",
                                groupValue: bloc.toppingGroupValue ?? 1,
                                onChooseType: (value) {
                                  bloc.onChooseFlag(value);
                                  if (value == 0) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return ToppingAdditionDialog(
                                            onChangedAmount: (amount) {
                                              bloc.onChangedAmount(
                                                  int.parse(amount));
                                            },
                                            onChangedNormalPrice:
                                                (normalPrice) {
                                              bloc.onChangedNormalPrice(
                                                  int.parse(normalPrice));
                                            },
                                            onChangedDeliPrice: (deliPrice) {
                                              bloc.onChangedToppingDeliPrice(
                                                  int.parse(deliPrice));
                                            },
                                            onTapAdd: () {
                                              bloc.onTapAdd();
                                              Navigator.pop(context);
                                            },
                                            onTapCancel: () {
                                              bloc.onTapCancelToppingAddition();
                                              Navigator.pop(context);
                                            },
                                            onTapCross: () {
                                              bloc.onTapCancelToppingAddition();
                                              Navigator.pop(context);
                                            },
                                            firstNode: bloc.fifthFocusNode,
                                            secondNode: bloc.sixthFocusNode,
                                            thirdNode: bloc.seventhFocusNode,
                                            // firstEditingComplete: () {
                                            //   bloc.onFifthEditingComplete();
                                            // },
                                            // secondEditingComplete: () {
                                            //   bloc.onSixthEditingComplete();
                                            // },
                                            // thirdEditingComplete: () {
                                            //   bloc.onSeventhEditingComplete();
                                            //},
                                          );
                                        });
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            //special addition yes no
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) =>
                                  RadioBtnForRawMaterialScreen(
                                title: "Special Addition",
                                groupValue: bloc.specialGroupValue ?? 1,
                                onChooseType: (value) {
                                  bloc.onChooseSpecialFlag(value);
                                },
                              ),
                            ),
                            Consumer<RawMaterialEditBloc>(
                              builder: (context, bloc, child) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Consumer<RawMaterialEditBloc>(
                                        builder: (context, bloc, child) =>
                                            SizedBox(
                                          width: scaleWidth(context) / 3,
                                          child: CommonTextFieldView(
                                            focusNode: bloc.fifthFocusNode,
                                            isFilled: true,
                                            numberOnly: true,
                                            isBorderIncluded: true,
                                            predefinedText:
                                                "${bloc.toppingSalesAmount}",

                                            ///  focusNode: widget.firstNode,
                                            labelText: "Enter Amount",
                                            onChanged: (amount) {
                                              bloc.onChangedAmount(
                                                  int.parse(amount));
                                            },
                                            onEditingComplete: () {
                                              bloc.onFifthEditingComplete();
                                              // amountFNode.unfocus();
                                              // widget.firstEditingComplete();
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: scaleHeight(context) / 30),
                                      Consumer<RawMaterialEditBloc>(
                                        builder: (context, bloc, child) =>
                                            SizedBox(
                                          width: scaleWidth(context) / 3,
                                          child: CommonTextFieldView(
                                            focusNode: bloc.sixthFocusNode,
                                            isFilled: true,
                                            numberOnly: true,
                                            isBorderIncluded: true,
                                            labelText: "Normal Price",
                                            predefinedText:
                                                "${bloc.toppingSalesPrice}",
                                            onChanged: (normalPrice) {
                                              bloc.onChangedNormalPrice(
                                                  int.parse(normalPrice));
                                            },
                                            onEditingComplete: () {
                                              bloc.onSixthEditingComplete();
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: scaleHeight(context) / 30),
                                      Consumer<RawMaterialEditBloc>(
                                        builder: (context, bloc, child) =>
                                            SizedBox(
                                          width: scaleWidth(context) / 3,
                                          child: CommonTextFieldView(
                                            focusNode: bloc.seventhFocusNode,
                                            isFilled: true,
                                            numberOnly: true,
                                            isBorderIncluded: true,
                                            labelText: "Delivery Price",
                                            predefinedText:
                                                "${bloc.toppingDeliPrice}",
                                            onChanged: (deliPrice) {
                                              bloc.onChangedToppingDeliPrice(
                                                  int.parse(deliPrice));
                                            },
                                            onEditingComplete: () {
                                              bloc.onSeventhEditingComplete();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Consumer<RawMaterialEditBloc>(
                                    builder: (context, bloc, child) =>
                                        EmployeeProfileView(
                                      image: bloc.toppingPhotoPath,
                                    ),
                                  ),
                                  SizedBox(height: scaleHeight(context) / 2),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: scaleHeight(context) / 8),
                              child: Consumer<RawMaterialEditBloc>(
                                builder: (context, bloc, child) =>
                                    CategoryButtonsView(
                                  text: "edit",
                                  onTapCreate: () {
                                    if (bloc.isLoading == false) {
                                      bloc.onTapEdit().then((value) {
                                        Functions.replacementTransition(
                                          context,
                                          RawMaterialListScreen(
                                            newScreen: true,
                                          ),
                                        );
                                        // Functions.showSuccessDialog(
                                        //   context,
                                        //   scaleHeight(context) / 3,
                                        //   () {
                                        //
                                        //   },
                                        //   "Editing",
                                        //   "Successful",
                                        // );
                                      }).catchError((e) {
                                        Functions.toast(
                                            msg: "Fail to edit ... $e",
                                            status: false);
                                      });
                                    }
                                  },
                                  onTapCancel: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 20),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLoading,
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
                  ],
                );
              }),
        ),
      ),
    );
  }
}
