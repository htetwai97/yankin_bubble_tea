// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class IngredientPriceEditingView extends StatelessWidget {
  String title;
  Function onTapCross;
  Function(String) onChangeSellingPrice;
  Function(String) onChangeDeliPrice;
  Function onSellPriceEditingComplete;
  Function onDeliPriceEditingComplete;
  Function onTapOK;
  FocusNode? sellFocus;
  FocusNode? deliFocus;

  IngredientPriceEditingView({
    Key? key,
    required this.title,
    required this.onTapCross,
    required this.onChangeDeliPrice,
    required this.onChangeSellingPrice,
    required this.onDeliPriceEditingComplete,
    required this.onSellPriceEditingComplete,
    required this.onTapOK,
    this.deliFocus,
    this.sellFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: scaleHeight(context) / 1.5,
          width: scaleWidth(context) / 1.6,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: WHITE_COLOR,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              buildBoxShadow(),
            ],
          ),
          child: ListView(
            children: [
              IngredientDialogTitleRowView(
                title: title,
                onTapCross: () {
                  onTapCross();
                },
              ),
              const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: sellFocus,
                isFilled: true,
                isBorderIncluded: true,
                labelText: "Selling Price",
                onChanged: (sellPrice) {
                  onChangeSellingPrice(sellPrice);
                },
                onEditingComplete: () {
                  onSellPriceEditingComplete();
                },
              ),
              const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: deliFocus,
                isFilled: true,
                isBorderIncluded: true,
                labelText: "Delivery Price",
                onChanged: (deliPrice) {
                  onChangeDeliPrice(deliPrice);
                },
                onEditingComplete: () {
                  onDeliPriceEditingComplete();
                },
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  color: BUTTON_COLOR,
                  onPressed: () {
                    onTapOK();
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
  }
}
