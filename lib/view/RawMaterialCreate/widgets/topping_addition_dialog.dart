// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';

import '../../main_login/widgets/common_text_field_view.dart';

class ToppingAdditionDialog extends StatefulWidget {
  Function onTapCross;
  Function(String) onChangedAmount, onChangedNormalPrice, onChangedDeliPrice;
  Function onTapAdd;
  Function onTapCancel;
  FocusNode firstNode, secondNode, thirdNode;
  // Function firstEditingComplete, secondEditingComplete, thirdEditingComplete;

  ToppingAdditionDialog({
    super.key,
    required this.onTapCross,
    required this.onChangedAmount,
    required this.onChangedNormalPrice,
    required this.onChangedDeliPrice,
    required this.onTapAdd,
    required this.onTapCancel,
    required this.firstNode,
    required this.secondNode,
    required this.thirdNode,
    // required this.firstEditingComplete,
    // required this.secondEditingComplete,
    // required this.thirdEditingComplete,
  });

  @override
  State<ToppingAdditionDialog> createState() => _ToppingAdditionDialogState();
}

class _ToppingAdditionDialogState extends State<ToppingAdditionDialog> {
  /*
  String? amount;
  String? normalPrice;
  String? deliPrice;
  */
  FocusNode amountFNode = FocusNode();
  FocusNode normalPriceFNode = FocusNode();
  FocusNode deliveryPriceFNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: scaleWidth(context) / 2,
          height: scaleHeight(context) / 1.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              IngredientDialogTitleRowView(
                title: "Topping Addition",
                onTapCross: () {
                  widget.onTapCross();
                },
              ),
              CommonTextFieldView(
                focusNode: amountFNode,
                isFilled: true,
                numberOnly: true,
                isBorderIncluded: true,

                ///  focusNode: widget.firstNode,
                labelText: "Enter Amount",
                onChanged: (amount) {
                  widget.onChangedAmount(amount);
                },
                onEditingComplete: () {
                  normalPriceFNode.requestFocus();
                  // amountFNode.unfocus();
                  // widget.firstEditingComplete();
                },
              ),
              const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: normalPriceFNode,
                isFilled: true,
                numberOnly: true,
                isBorderIncluded: true,

                ///  focusNode: widget.secondNode,
                labelText: "Normal Price",
                onChanged: (normalPrice) {
                  widget.onChangedNormalPrice(normalPrice);
                },
                onEditingComplete: () {
                  deliveryPriceFNode.requestFocus();
                  // normalPriceFNode.unfocus();
                  // widget.secondEditingComplete();
                },
              ),
              const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: deliveryPriceFNode,
                isFilled: true,
                numberOnly: true,
                isBorderIncluded: true,

                /// focusNode: widget.thirdNode,
                labelText: "Delivery Price",
                onChanged: (deliPrice) {
                  widget.onChangedDeliPrice(deliPrice);
                },
                onEditingComplete: () {
                  amountFNode.unfocus();
                  normalPriceFNode.unfocus();
                  deliveryPriceFNode.unfocus();
                  //  widget.thirdEditingComplete();
                },
              ),
              const Spacer(),
              CategoryButtonsView(
                text: "ADD",
                onTapCancel: () {
                  widget.onTapCancel();
                },
                onTapCreate: () {
                  widget.onTapAdd();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
