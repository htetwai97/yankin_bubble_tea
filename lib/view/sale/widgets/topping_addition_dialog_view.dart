// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/drop_down_for_product_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/radio_for_topping_dialog_view.dart';

class ToppingAdditionDialogView extends StatelessWidget {
  Function onTapCross;
  Function(String) onChooseRaw;
  Function onTapAdd;
  Function onTapCancel;
  List<String> rawList;

  ToppingAdditionDialogView({
    super.key,
    required this.onTapCross,
    required this.onChooseRaw,
    required this.onTapAdd,
    required this.onTapCancel,
    required this.rawList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: scaleHeight(context) / 1.7,
          width: scaleWidth(context) / 1.5,
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
                  onTapCross();
                },
              ),
              const SizedBox(height: 8),
              DropDownForProductView(
                menuTitle: "Choose Raw",
                onChange: (raw) {
                  onChooseRaw(raw ?? "");
                },
                list: rawList,
              ),
              const Spacer(),
              CategoryButtonsView(
                text: "ADD",
                onTapCancel: () {
                  onTapCancel();
                },
                onTapCreate: () {
                  onTapAdd();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
