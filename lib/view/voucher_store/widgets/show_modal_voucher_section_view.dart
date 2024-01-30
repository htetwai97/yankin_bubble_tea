// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/promotion_vo.dart';
import 'package:multipurpose_pos_application/view/best_selling_items/widgets/box_shadow.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/voucher_store/widgets/check_box_show_modeal_view.dart';
import 'package:multipurpose_pos_application/view/voucher_store/widgets/display_row_for_voucher_show_modal_view.dart';

class ShowModalVoucherSectionView extends StatefulWidget {
  int quantity;
  double total;
  double cashBack;
  double discount;
  double tax;
  double grandTotal;
  bool? checkValueCashBack;
  bool? checkValueTax;

  PromotionVO? promotionVO;
  Function(double, bool?) onCheckTax;
  Function(bool?) onCheckCashBack;
  Function(double) onChangeCashBack;
  Function(bool) onCheckPrint;
  Function onTapCross;
  Function onTapOkCashBack;

  ShowModalVoucherSectionView({
    super.key,
    required this.quantity,
    required this.total,
    required this.promotionVO,
    required this.onCheckTax,
    required this.onCheckCashBack,
    required this.onCheckPrint,
    required this.onChangeCashBack,
    required this.cashBack,
    required this.tax,
    required this.discount,
    required this.grandTotal,
    this.checkValueCashBack = false,
    this.checkValueTax = false,
    required this.onTapCross,
    required this.onTapOkCashBack,
  });

  @override
  State<ShowModalVoucherSectionView> createState() =>
      _ShowModalVoucherSectionViewState();
}

class _ShowModalVoucherSectionViewState
    extends State<ShowModalVoucherSectionView> {
  FocusNode? focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Quantity : ${widget.quantity}",
                  style: ConfigStyle.regularStyle(16, BLACK_LIGHT),
                ),
              ),
              const SizedBox(height: 4),
              CheckBoxShowModalView(
                checkValue: widget.checkValueTax,
                onCheck: (checkTax) {
                  if (checkTax == true) {
                    setState(() {
                      var e = widget.total * 5;
                      var tax = e / 100;
                      widget.tax = tax;
                      widget.onCheckTax(widget.tax, checkTax);
                    });
                  } else {
                    setState(() {
                      widget.tax = 0;
                      widget.onCheckTax(widget.tax, checkTax);
                    });
                  }
                },
                mes: "CT 5% Tax",
              ),
              CheckBoxShowModalView(
                checkValue: widget.checkValueCashBack,
                onCheck: (checkCashBack) {
                  widget.onCheckCashBack(checkCashBack);
                  if (checkCashBack == true) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Card(
                            color: Colors.transparent,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                height: scaleHeight(context) / 2,
                                width: scaleWidth(context) / 2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    boxShadow(),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    IngredientDialogTitleRowView(
                                      title: "CashBack Dialog",
                                      onTapCross: () {
                                        widget.onTapCross();
                                        Navigator.pop(context, true);
                                      },
                                    ),
                                    CommonTextFieldView(
                                      numberOnly: true,
                                      isBorderIncluded: true,
                                      isFilled: true,
                                      focusNode: focusNode,
                                      labelText: "Cash Back Amount",
                                      onChanged: (cash) {
                                        setState(() {
                                          widget.cashBack = double.parse(cash);
                                          widget.onChangeCashBack(
                                              widget.cashBack);
                                        });
                                      },
                                      onEditingComplete: () {
                                        focusNode?.unfocus();
                                      },
                                    ),
                                    const Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        color: BUTTON_COLOR,
                                        onPressed: () {
                                          widget.onTapOkCashBack();
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: ConfigStyle.regularStyle(
                                            FONT_MEDIUM,
                                            WHITE_COLOR,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    setState(() {
                      widget.cashBack = 0;
                      widget.onChangeCashBack(0);
                    });
                  }
                },
                mes: "Cash Back",
              ),
              CheckBoxShowModalView(
                onCheck: (checkPrint) {
                  widget.onCheckPrint(checkPrint);
                },
                mes: "Print",
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              DisplayRowForVoucherShowModalView(
                title: "Currency Type",
                value: "MMK",
              ),
              DisplayRowForVoucherShowModalView(
                title: "Total",
                value: widget.total.toString(),
              ),
              DisplayRowForVoucherShowModalView(
                title: "Cash Back",
                value: widget.cashBack.toString(),
              ),
              DisplayRowForVoucherShowModalView(
                title: "Discount",
                value: widget.discount.toString(),
              ),
              DisplayRowForVoucherShowModalView(
                title: "Tax",
                value: widget.tax.toString(),
              ),
              DisplayRowForVoucherShowModalView(
                title: "Grand Total",
                value: widget.grandTotal.toString(),
              ),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
