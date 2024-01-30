// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
// import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
// import 'package:multipurpose_pos_application/core/core_function/functions.dart';
// import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
// import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
// import 'package:provider/provider.dart';

// import '../../../core/core_config/config_style.dart';
// import '../../RawMaterialList/screen/raw_material_list_screen.dart';
// import '../../category_create_or_edit/widgets/category_buttons_view.dart';
// import '../../employee_create/widgets/employee_profile_view.dart';
// import '../bloc/raw_material_create_bloc.dart';
// import '../widgets/drop_down.dart';
// import '../widgets/radio_btn_for_raw_material_screen.dart';
// import '../widgets/topping_addition_dialog.dart';

// class RawMaterialCreateScreen extends StatelessWidget {
//   RawMaterialCreateScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => RawMaterialCreateBloc(),
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
//           child: CommonAppBarView(
//             onTapBack: () {
//               Navigator.pop(context);
//             },
//             title: "Raw Material Create Page",
//             automaticImply: false,
//             isEnableBack: true,
//           ),
//         ),
//         body: Selector<RawMaterialCreateBloc, bool>(
//           selector: (context, bloc) => bloc.isLoading,
//           builder: (context, isLoading, child) => Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: scaleHeight(context) / 3),
//                   child: Column(
//                     children: [
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //extra topping dd
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => DropDown(
//                           selectedValue: bloc.extraToppingName,
//                           menuTitle: "Extra Topping",
//                           list: bloc.categoryNameList,
//                           onChange: (value) {
//                             bloc.onChangedCategoryName(value ?? "");
//                           },
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //choose brand dd
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => DropDown(
//                           selectedValue: "Choose Brand",
//                           menuTitle: "Choose Brand",
//                           list: bloc.brandNameList!,
//                           onChange: (value) {
//                             // bloc.onChangedPromotionType(value ?? "");
//                           },
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //choose supplier dd
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => DropDown(
//                           selectedValue: bloc.supplierName,
//                           menuTitle: "Choose Supplier",
//                           list: bloc.supplierNameList,
//                           onChange: (value) {
//                             bloc.onChangedSupplierName(value ?? "");
//                           },
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //item name ctf
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => CommonTextFieldView(
//                           labelText: "Item Name",
//                           focusNode: bloc.firstFocusNode,
//                           onChanged: (e) {
//                             bloc.onChangedName(e);
//                           },
//                           onEditingComplete: () {
//                             bloc.onFirstEditingComplete();
//                           },
//                           isBorderIncluded: true,
//                           isFilled: true,
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //quantity ctf
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => CommonTextFieldView(
//                           labelText: "Quantity",
//                           numberOnly: true,
//                           focusNode: bloc.secondFocusNode,
//                           onChanged: (e) {
//                             bloc.onChangedInStockQty(e);
//                           },
//                           onEditingComplete: () {
//                             bloc.onSecondEditingComplete();
//                           },
//                           isBorderIncluded: true,
//                           isFilled: true,
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //gram dd
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => DropDown(
//                           selectedValue: bloc.unit,
//                           menuTitle: "gram",
//                           list: const ["gram", "liter", "milli gram", "pound"],
//                           onChange: (value) {
//                             bloc.onChangeUnit(value!);
//                           },
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //purchase price ctf
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => CommonTextFieldView(
//                           labelText: "Purchase Price",
//                           numberOnly: true,
//                           focusNode: bloc.thirdFocusNode,
//                           onChanged: (e) {
//                             bloc.onChangedPurchasePrice(e);
//                           },
//                           onEditingComplete: () {
//                             bloc.onThirdEditingComplete();
//                           },
//                           isBorderIncluded: true,
//                           isFilled: true,
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //reorder level ctf
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => CommonTextFieldView(
//                           labelText: "Reorder Level",
//                           numberOnly: true,
//                           focusNode: bloc.fourthFocusNode,
//                           onChanged: (e) {
//                             bloc.onChangedReorderLevel(e);
//                           },
//                           onEditingComplete: () {
//                             bloc.onFourthEditingComplete();
//                           },
//                           isBorderIncluded: true,
//                           isFilled: true,
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 15),
//                       //topping addition yes no
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) =>
//                             RadioBtnForRawMaterialScreen(
//                           title: "Topping Addition",
//                           groupValue: bloc.toppingGroupValue ?? 1,
//                           onChooseType: (value) {
//                             bloc.onChooseFlag(value);
//                             if (value == 0) {
//                               showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return ToppingAdditionDialog(
//                                       onChangedAmount: (amount) {
//                                         bloc.onChangedAmount(int.parse(amount));
//                                       },
//                                       onChangedNormalPrice: (normalPrice) {
//                                         bloc.onChangedNormalPrice(
//                                             int.parse(normalPrice));
//                                       },
//                                       onChangedDeliPrice: (deliPrice) {
//                                         bloc.onChangedToppingDeliPrice(
//                                             int.parse(deliPrice));
//                                       },
//                                       onTapAdd: () {
//                                         bloc.onTapAdd();
//                                         Navigator.pop(context);
//                                       },
//                                       onTapCancel: () {
//                                         bloc.onTapCancelToppingAddition();
//                                         Navigator.pop(context);
//                                       },
//                                       onTapCross: () {
//                                         bloc.onTapCancelToppingAddition();
//                                         Navigator.pop(context);
//                                       },
//                                       firstNode: bloc.fifthFocusNode,
//                                       secondNode: bloc.sixthFocusNode,
//                                       thirdNode: bloc.seventhFocusNode,
//                                       // firstEditingComplete: () {
//                                       //   bloc.onFifthEditingComplete();
//                                       // },
//                                       // secondEditingComplete: () {
//                                       //   bloc.onSixthEditingComplete();
//                                       // },
//                                       // thirdEditingComplete: () {
//                                       //   bloc.onSeventhEditingComplete();
//                                       //},
//                                     );
//                                   });
//                             }
//                           },
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 30),
//                       //special addition yes no
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) =>
//                             RadioBtnForRawMaterialScreen(
//                           title: "Special Addition",
//                           groupValue: bloc.specialGroupValue ?? 1,
//                           onChooseType: (value) {
//                             bloc.onChooseSpecialFlag(value);
//                           },
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 20),
//                       Consumer<RawMaterialCreateBloc>(
//                         builder: (context, bloc, child) => Visibility(
//                           visible: bloc.toppingGroupValue == 0,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Consumer<RawMaterialCreateBloc>(
//                                     builder: (context, bloc, child) => Text(
//                                       "amount            :     ${bloc.toppingSalesAmount}",
//                                       style: ConfigStyle.boldStyle(
//                                           FONT_LARGE - 3, BLACK_LIGHT),
//                                     ),
//                                   ),
//                                   SizedBox(height: scaleHeight(context) / 20),
//                                   Consumer<RawMaterialCreateBloc>(
//                                     builder: (context, bloc, child) => Text(
//                                       "selling price     :     ${bloc.toppingSalesPrice}",
//                                       style: ConfigStyle.boldStyle(
//                                           FONT_LARGE - 3, BLACK_LIGHT),
//                                     ),
//                                   ),
//                                   SizedBox(height: scaleHeight(context) / 20),
//                                   Consumer<RawMaterialCreateBloc>(
//                                     builder: (context, bloc, child) => Text(
//                                       "deli price          :      ${bloc.toppingDeliPrice}",
//                                       style: ConfigStyle.boldStyle(
//                                           FONT_LARGE - 3, BLACK_LIGHT),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Consumer<RawMaterialCreateBloc>(
//                                 builder: (context, bloc, child) =>
//                                     EmployeeProfileView(
//                                   pickImage: () {
//                                     bloc.pickImage();
//                                   },
//                                   image: bloc.toppingPhotoPath,
//                                 ),
//                               ),
//                               SizedBox(height: scaleHeight(context) / 2),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: scaleHeight(context) / 8),
//                         child: Consumer<RawMaterialCreateBloc>(
//                           builder: (context, bloc, child) =>
//                               CategoryButtonsView(
//                             onTapCreate: () {
//                               bloc.onTapCreate().then((value) {
//                                 Functions.showSuccessDialog(
//                                   context,
//                                   scaleHeight(context) / 3,
//                                   () {
//                                     Functions.replacementTransition(
//                                       context,
//                                       RawMaterialListScreen(
//                                         newScreen: true,
//                                       ),
//                                     );
//                                   },
//                                   "New creation",
//                                   "Successful",
//                                 );
//                               }).catchError((e) {
//                                 Functions.toast(
//                                     msg: "Fail to create new", status: false);
//                               });
//                             },
//                             onTapCancel: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: scaleHeight(context) / 20),
//                     ],
//                   ),
//                 ),
//               ),
//               Visibility(
//                 visible: isLoading,
//                 child: SpinKitFadingCircle(
//                   itemBuilder: (BuildContext context, int index) {
//                     return DecoratedBox(
//                       decoration: BoxDecoration(
//                         color: index.isEven
//                             ? APP_THEME_COLOR_REDUCE
//                             : CARD_FIRST_COLOR,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_style.dart';
import '../../RawMaterialList/screen/raw_material_list_screen.dart';
import '../../category_create_or_edit/widgets/category_buttons_view.dart';
import '../../employee_create/widgets/employee_profile_view.dart';
import '../bloc/raw_material_create_bloc.dart';
import '../widgets/drop_down.dart';
import '../widgets/radio_btn_for_raw_material_screen.dart';
import '../widgets/topping_addition_dialog.dart';

class RawMaterialCreateScreen extends StatelessWidget {
  RawMaterialCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RawMaterialCreateBloc(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
          child: CommonAppBarView(
            onTapBack: () {
              Navigator.pop(context);
            },
            title: "Raw Material Create Page",
            automaticImply: false,
            isEnableBack: true,
          ),
        ),
        body: Selector<RawMaterialCreateBloc, bool>(
          selector: (context, bloc) => bloc.isLoading,
          builder: (context, isLoading, child) => Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: scaleHeight(context) / 3),
                  child: Column(
                    children: [
                      SizedBox(height: scaleHeight(context) / 30),
                      //extra topping dd
                      Consumer<RawMaterialCreateBloc>(
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
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) => DropDown(
                          selectedValue: "Choose Brand",
                          menuTitle: "Choose Brand",
                          list: bloc.brandNameList!,
                          onChange: (value) {
                            // bloc.onChangedPromotionType(value ?? "");
                          },
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 30),
                      //choose supplier dd
                      Consumer<RawMaterialCreateBloc>(
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
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) => CommonTextFieldView(
                          labelText: "Item Name",
                          focusNode: bloc.firstFocusNode,
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
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) => CommonTextFieldView(
                          labelText: "Quantity",
                          numberOnly: true,
                          focusNode: bloc.secondFocusNode,
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
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) => DropDown(
                          selectedValue: bloc.unit,
                          menuTitle: "gram",
                          list: const ["gram", "liter", "milli gram", "pound"],
                          onChange: (value) {
                            bloc.onChangeUnit(value!);
                          },
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 30),
                      //purchase price ctf
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) => CommonTextFieldView(
                          labelText: "Purchase Price",
                          numberOnly: true,
                          focusNode: bloc.thirdFocusNode,
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
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) => CommonTextFieldView(
                          labelText: "Reorder Level",
                          numberOnly: true,
                          focusNode: bloc.fourthFocusNode,
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
                      Consumer<RawMaterialCreateBloc>(
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
                                        bloc.onChangedAmount(int.parse(amount));
                                      },
                                      onChangedNormalPrice: (normalPrice) {
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
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) =>
                            RadioBtnForRawMaterialScreen(
                          title: "Special Addition",
                          groupValue: bloc.specialGroupValue ?? 1,
                          onChooseType: (value) {
                            bloc.onChooseSpecialFlag(value);
                          },
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 20),
                      Consumer<RawMaterialCreateBloc>(
                        builder: (context, bloc, child) => Visibility(
                          visible: bloc.toppingGroupValue == 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Consumer<RawMaterialCreateBloc>(
                                    builder: (context, bloc, child) => Text(
                                      "amount            :     ${bloc.toppingSalesAmount}",
                                      style: ConfigStyle.boldStyle(
                                          FONT_LARGE - 3, BLACK_LIGHT),
                                    ),
                                  ),
                                  SizedBox(height: scaleHeight(context) / 20),
                                  Consumer<RawMaterialCreateBloc>(
                                    builder: (context, bloc, child) => Text(
                                      "selling price     :     ${bloc.toppingSalesPrice}",
                                      style: ConfigStyle.boldStyle(
                                          FONT_LARGE - 3, BLACK_LIGHT),
                                    ),
                                  ),
                                  SizedBox(height: scaleHeight(context) / 20),
                                  Consumer<RawMaterialCreateBloc>(
                                    builder: (context, bloc, child) => Text(
                                      "deli price          :      ${bloc.toppingDeliPrice}",
                                      style: ConfigStyle.boldStyle(
                                          FONT_LARGE - 3, BLACK_LIGHT),
                                    ),
                                  ),
                                ],
                              ),
                              Consumer<RawMaterialCreateBloc>(
                                builder: (context, bloc, child) =>
                                    EmployeeProfileView(
                                  pickImage: () {
                                    bloc.pickImage();
                                  },
                                  image: bloc.toppingPhotoPath,
                                ),
                              ),
                              SizedBox(height: scaleHeight(context) / 2),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: scaleHeight(context) / 8),
                        child: Consumer<RawMaterialCreateBloc>(
                          builder: (context, bloc, child) =>
                              CategoryButtonsView(
                            onTapCreate: () {
                              bloc.onTapCreate().then((value) {
                                Functions.showSuccessDialog(
                                  context,
                                  scaleHeight(context) / 3,
                                  () {
                                    Functions.replacementTransition(
                                      context,
                                      RawMaterialListScreen(
                                        newScreen: true,
                                      ),
                                    );
                                  },
                                  "New creation",
                                  "Successful",
                                );
                              }).catchError((e) {
                                Functions.toast(
                                    msg: "Fail to create new", status: false);
                              });
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
          ),
        ),
      ),
    );
  }
}
