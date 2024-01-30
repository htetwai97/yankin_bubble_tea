// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/best_selling_items/widgets/box_shadow.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/radio_for_special_view.dart';

class SpecialDialogView extends StatefulWidget {
  Function(String?) onChangeRemark;
  Function(int?) onChangeSugar;
  Function(int?) onChangeIce;
  Function onTapCross;
  Function onTapCancel;
  Function onTapAdd;
  FocusNode? focusNode;
  Function onEditingComplete;
  SpecialDialogView({
    Key? key,
    required this.onTapCross,
    required this.onTapAdd,
    required this.onTapCancel,
    required this.onChangeIce,
    required this.onChangeRemark,
    required this.onChangeSugar,
    required this.onEditingComplete,
    this.focusNode,
  }) : super(key: key);

  @override
  State<SpecialDialogView> createState() => _SpecialDialogViewState();
}

class _SpecialDialogViewState extends State<SpecialDialogView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(context) / 20,
              vertical: scaleHeight(context) / 20),
          width: scaleWidth(context) / 1.4,
          height: scaleHeight(context) / 1.4,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              boxShadow(),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IngredientDialogTitleRowView(
                  title: "Special",
                  onTapCross: () {
                    widget.onTapCross();
                  },
                ),
                const SizedBox(height: 10),
                RadioForSpecialView(
                  itemName: "Sugar",
                  onChooseType: (value) {
                    widget.onChangeSugar(value);
                  },
                ),
                const SizedBox(height: 10),
                RadioForSpecialView(
                  itemName: "Ice",
                  onChooseType: (value) {
                    widget.onChangeIce(value);
                  },
                ),
                const SizedBox(height: 10),
                CommonTextFieldView(
                  focusNode: widget.focusNode,
                  isFilled: true,
                  isBorderIncluded: true,
                  labelText: "Remark",
                  onChanged: (text) {
                    widget.onChangeRemark(text);
                  },
                  onEditingComplete: () {
                    widget.onEditingComplete();
                  },
                ),
                const SizedBox(height: 16),
                CategoryButtonsView(
                  text: "ADD",
                  onTapCancel: () {
                    widget.onTapCancel();
                  },
                  onTapCreate: () {
                    widget.onTapAdd();
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
