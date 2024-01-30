// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/sale/bloc/sale_bloc.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/card_item_detail_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/heading_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/show_dialog_for_checkout_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/special_dialog_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/topping_addition_dialog_view.dart';
import 'package:multipurpose_pos_application/view/voucher_store/screen/voucher_store_screen.dart';
import 'package:provider/provider.dart';

class SaleSecondHalfScreenView extends StatelessWidget {
  const SaleSecondHalfScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: scaleWidth(context) / 2,
          child: Column(
            children: [
              Consumer<SaleBloc>(builder: (context, bloc, child) {
                ///  double totalPop = (bloc.displayTotalPop ?? 0.0).toDouble();
                double totalAmount =
                    (bloc.displayTotalAmount ?? 0.0).toDouble();
                var totalQty = bloc.displayTotalQuantity ?? 0;
                return HeadingView(
                  amount: totalAmount.toString(),
                  qty: totalQty.toString(),

                  /// pop: totalPop.toString(),
                );
              }),
              SizedBox(
                height: scaleHeight(context) / 1.4,
                child: Consumer<SaleBloc>(
                  builder: (context, bloc, child) => ListView.builder(
                    itemBuilder: (context, index) {
                      return CardItemDetailView(
                        special:
                            bloc.selectedProductList?[index].specialRemark ??
                                "Special",
                        toppingList:
                            bloc.selectedProductList?[index].toppingList ?? [],
                        amount: bloc.selectedProductList?[index].selectedPrice
                                .toString() ??
                            "",
                        name: bloc.selectedProductList?[index].name ?? "",
                        size:
                            bloc.selectedProductList?[index].selectedSize ?? "",
                        quantity: bloc.selectedProductList?[index].quantity
                                .toString() ??
                            "",
                        sizeList: bloc
                                .selectedProductList?[index].sizeOfIngredient
                                ?.map((e) => e.size)
                                .toList() ??
                            [],
                        onTapAddToppingQuantity: (toppingIndex) {
                          bloc.onAddToppingQuantity(index, toppingIndex);
                        },
                        onTapMinusToppingQuantity: (toppingIndex) {
                          bloc.onReduceToppingQuantity(index, toppingIndex);
                        },
                        onTapAddProduct: () {
                          bloc.onTapQuantityAdd(index);
                        },
                        onTapMinusProduct: () {
                          bloc.onTapQuantityReduce(index);
                        },
                        onTapMore: (size) {
                          bloc.onChooseProductSize(size, index);
                        },
                        onTapPoppingOne: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SpecialDialogView(
                                  focusNode: bloc.focusNodeRemark,
                                  onEditingComplete: () {
                                    bloc.onEditingCompleteRemark();
                                  },
                                  onTapCancel: () {
                                    bloc.onTapCrossSpecial();
                                    Navigator.pop(context);
                                  },
                                  onTapCross: () {
                                    bloc.onTapCrossSpecial();
                                    Navigator.pop(context);
                                  },
                                  onChangeRemark: (remark) {
                                    bloc.onChangeRemark(remark);
                                  },
                                  onChangeSugar: (value) {
                                    bloc.onChooseSugarLevel(value);
                                  },
                                  onChangeIce: (value) {
                                    bloc.onChooseIce(value);
                                  },
                                  onTapAdd: () {
                                    bloc.onTapSpecialAdd(index);
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                        onTapPoppingTwo: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ToppingAdditionDialogView(
                                  rawList: bloc.rawMaterialList
                                          ?.map((e) => e.name ?? "")
                                          .toList() ??
                                      [],
                                  onTapAdd: () {
                                    bloc.onTapAddTopping(index);
                                    Navigator.pop(context);
                                  },
                                  onTapCancel: () {
                                    bloc.onTapCross();
                                    Navigator.pop(context);
                                  },
                                  onTapCross: () {
                                    bloc.onTapCross();
                                    Navigator.pop(context);
                                  },
                                  onChooseRaw: (raw) {
                                    bloc.onChooseTopping(raw, index);
                                  },
                                );
                              });
                        },
                      );
                    },
                    itemCount: bloc.selectedProductList?.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        Consumer<SaleBloc>(
          builder: (context, bloc, child) => MaterialButton(
            onPressed: () {
              if (bloc.selectedProductList?.length != 0) {
                showDialog(
                  context: context,
                  builder: (context) => ShowDialogForCheckOutView(
                    onTapCross: () {
                      bloc.onTapCrossCardSelection();
                      Navigator.pop(context);
                    },
                    onTapPromotion: () {
                      bloc
                          .onTapPromotion()
                          .then((value) => Functions.rightToLeftTransition(
                                context,
                                VoucherStoreScreen(
                                  quantity: bloc.displayTotalQuantity,
                                  selectedProductList: bloc.selectedProductList,
                                  promotionVO: bloc.promotionVO,
                                  backDate: bloc.backDate,
                                  backDateFlag: bloc.backDateFlag,
                                  customerId: bloc.customerId,
                                ),
                              ))
                          .catchError((onError) => Functions.toast(
                              msg: "Choose promotion", status: false));
                    },
                    onTapDirect: () {
                      bloc
                          .onTapDirect()
                          .then((value) => Functions.rightToLeftTransition(
                                context,
                                VoucherStoreScreen(
                                  quantity: bloc.displayTotalQuantity,
                                  selectedProductList: bloc.selectedProductList,
                                  promotionVO: bloc.promotionVO,
                                  backDate: bloc.backDate,
                                  backDateFlag: bloc.backDateFlag,
                                  customerId: bloc.customerId,
                                ),
                              ));
                    },
                    onChooseBackDate: (backDate) {
                      bloc.onChooseBackDate(backDate);
                    },
                    onChooseCustomerName: (customerName) {
                      bloc.onChooseCustomerName(customerName);
                    },
                    onChooseDateRadio: (dateValue) {
                      bloc.onChooseDateRadio(dateValue);
                    },
                    onChoosePromotion: (promotion) {
                      bloc.onChoosePromotion(promotion);
                    },
                    onChooseTypeRadio: (typeValue) {
                      ///bloc.onChooseBuyType(typeValue);
                    },
                    customerDropDownList:
                        bloc.customerList?.map((e) => e.name ?? "").toList() ??
                            [],
                    promotionDropDownList:
                        bloc.promotionList?.map((e) => e.name ?? "").toList() ??
                            [],
                  ),
                );
              } else {
                Functions.toast(msg: "Choose Item", status: false);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 34,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: BUTTON_COLOR,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Checkout",
                style: ConfigStyle.boldStyle(
                  FONT_MEDIUM,
                  WHITE_COLOR,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
