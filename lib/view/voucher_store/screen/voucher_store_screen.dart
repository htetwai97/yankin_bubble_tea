// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/promotion_vo.dart';
import 'package:multipurpose_pos_application/main.dart';
import 'package:multipurpose_pos_application/view/best_selling_items/widgets/box_shadow.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/screen/sale_and_history_screen.dart';
import 'package:multipurpose_pos_application/view/voucher_store/bloc/voucher_store_bloc.dart';
import 'package:multipurpose_pos_application/view/voucher_store/widgets/shop_address_phone_name_view.dart';
import 'package:multipurpose_pos_application/view/voucher_store/widgets/show_modal_voucher_section_view.dart';
import 'package:multipurpose_pos_application/view/voucher_store/widgets/voucher_row_for_list_view.dart';
import 'package:multipurpose_pos_application/view/wifi_printer/screen/wifi_printer_screen.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class VoucherStoreScreen extends StatelessWidget {
  List<ProductVO>? selectedProductList;
  int? quantity;
  String? backDate;
  int? backDateFlag;
  int? customerId;
  PromotionVO? promotionVO;
  VoucherStoreScreen({
    Key? key,
    this.selectedProductList,
    this.promotionVO,
    this.backDateFlag,
    this.customerId,
    this.backDate,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VoucherStoreBloc(backDate, backDateFlag, customerId,
          promotionVO, selectedProductList, quantity),
      child: Scaffold(
        floatingActionButton: Consumer<VoucherStoreBloc>(
          builder: (context, bloc, child) => InkWell(
            onTap: () {
              bloc.onOpenDialog();
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return ShowModalVoucherSectionView(
                      onTapOkCashBack: () {
                        bloc.onTapOk();
                      },
                      onTapCross: () {
                        bloc.onTapCross();
                        Navigator.pop(context);
                      },
                      onCheckCashBack: (cashBack) {
                        bloc.onCheckCashBack(cashBack);
                      },
                      onCheckPrint: (isChecked) {},
                      onCheckTax: (tax, isChecked) {
                        bloc.onCheckTax(tax, isChecked);
                      },
                      onChangeCashBack: (cash) {
                        bloc.onChangeCashBack(cash);
                      },
                      quantity: bloc.quantity ?? 0,
                      total: bloc.totalAll ?? 0.0,
                      promotionVO: bloc.promotionVO,
                      cashBack: bloc.cashBack ?? 0.0,
                      discount: bloc.discount ?? 0.0,
                      tax: bloc.taxAmount ?? 0.0,
                      grandTotal: bloc.grandTotal ?? 0.0,
                      checkValueCashBack: bloc.isCheckedCashBack,
                      checkValueTax: bloc.isCheckedTax,
                    );
                  });
            },
            child: const Icon(
              Icons.arrow_drop_down_circle,
              size: 40,
              color: BUTTON_COLOR,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Consumer<VoucherStoreBloc>(
                builder: (context, bloc, child) => Screenshot(
                  controller: bloc.screenshotController,
                  child: Column(
                    children: [
                      const ShopAddressPhoneNameView(),
                      const SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: APP_THEME_COLOR, width: 0.3),
                        ),
                        child: VoucherRowForListView(
                          color: BLACK_HEAVY,
                          font: 16,
                          textOne: "No",
                          textTwo: "Name",
                          textThree: "Qty",
                          textFour: "Price",
                          textFive: "Size",
                          textSix: "Special",
                        ),
                      ),
                      const SizedBox(height: 4),
                      Consumer<VoucherStoreBloc>(
                        builder: (context, bloc, child) => SizedBox(
                          height: scaleHeight(context) / 2,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: bloc.selectedProductList?.length ?? 0,
                            itemBuilder: (context, index) {
                              var selectedProduct =
                                  bloc.selectedProductList?[index];
                              var toppingList =
                                  selectedProduct?.toppingList ?? [];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1, color: APP_THEME_COLOR),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    boxShadow(),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    VoucherRowForListView(
                                      textOne: "${index + 1}",
                                      textTwo: selectedProduct?.name ?? "",
                                      textThree: selectedProduct?.quantity
                                              .toString() ??
                                          "",
                                      textFour: selectedProduct?.selectedPrice
                                              .toString() ??
                                          "",
                                      textFive:
                                          selectedProduct?.selectedSize ?? "",
                                      textSix: selectedProduct?.specialRemark ??
                                          "no special remark",
                                    ),
                                    ListView.builder(
                                      itemBuilder: (context, index) {
                                        return ToppingVoucherView(
                                          textOne: toppingList[index]
                                                  .rawMaterialName ??
                                              "",
                                          textTwo: toppingList[index]
                                              .rawMaterialQuantity
                                              .toString(),
                                          textThee: toppingList[index]
                                              .rawMaterialPrice
                                              .toString(),
                                        );
                                      },
                                      itemCount: toppingList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Consumer<VoucherStoreBloc>(
                    builder: (context, bloc, child) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context) / 12),
                      child: Row(
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10),
                            color: BUTTON_COLOR,
                            onPressed: () {
                              bloc
                                  .onTapVoucherStore()
                                  .then(
                                    (value) => Functions.transition(
                                      context,
                                      WifiPrinterScreen(
                                        total: bloc.totalAll ?? 0,
                                        cashback: bloc.cashBack ?? 0,
                                        discount: bloc.discount ?? 0,
                                        tax: bloc.taxAmount ?? 0,
                                        grandTotal: bloc.grandTotal ?? 0,
                                        productList:
                                            bloc.selectedProductList ?? [],
                                      ),
                                    ),
                                  )
                                  .catchError((e) {
                                debugPrint(
                                    "here is mhz response of error =====> ${e.toString()}");
                              });
                            },
                            child: SizedBox(
                              width: 120,
                              child: Center(
                                child: Text(
                                  "Voucher Store",
                                  style: ConfigStyle.regularStyle(
                                    FONT_MEDIUM,
                                    WHITE_COLOR,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10),
                            color: BUTTON_COLOR,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              width: 120,
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: ConfigStyle.regularStyle(
                                    FONT_MEDIUM,
                                    WHITE_COLOR,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToppingVoucherView extends StatelessWidget {
  String textOne;
  String textTwo;
  String textThee;
  ToppingVoucherView({
    super.key,
    required this.textTwo,
    required this.textOne,
    required this.textThee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: scaleWidth(context) / 8,
            child: Center(
              child: Text(
                "Topping :",
                style: ConfigStyle.regularStyle(FONT_MEDIUM, APP_THEME_COLOR),
              ),
            ),
          ),
          SizedBox(
            width: scaleWidth(context) / 8,
            child: Center(
              child: Text(
                textOne,
                style: ConfigStyle.regularStyle(FONT_MEDIUM, APP_THEME_COLOR),
              ),
            ),
          ),
          SizedBox(
            width: scaleWidth(context) / 8,
            child: Center(
              child: Text(
                "Qty : $textTwo",
                style: ConfigStyle.regularStyle(FONT_MEDIUM, APP_THEME_COLOR),
              ),
            ),
          ),
          SizedBox(
            width: scaleWidth(context) / 8,
            child: Center(
              child: Text(
                "Price : $textThee",
                style: ConfigStyle.regularStyle(FONT_MEDIUM, APP_THEME_COLOR),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
