// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/chosen_ingredient_item_detail_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/two_buttons_for_ingredient_dialog_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/drop_down_for_product_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class IngredientAddOtherNeedDialogView extends StatefulWidget {
  String title;
  bool visible;
  FocusNode? focusNodeSellPrice;
  FocusNode? focusNodeDeliPrice;
  FocusNode? focusNodeAmount;
  Function onTapCross,
      onTapAdd,
      onTapCancel,
      onTapRegister,
      onEditCompleteSell,
      onEditCompleteDeli,
      onEditCompleteAmount;
  List<String> sizeList, rawList, unitList;
  List<RequestIngredientVO>? ingredientList;
  Function(String) onChangeSize,
      onChangeSellingPrice,
      onChangeDeliPrice,
      onChangeRaw,
      onChangeAmount,
      onChangeUnit;

  IngredientAddOtherNeedDialogView({
    super.key,
    required this.title,
    required this.onTapCross,
    required this.sizeList,
    required this.rawList,
    required this.unitList,
    required this.onChangeSize,
    required this.onChangeSellingPrice,
    required this.onChangeDeliPrice,
    required this.onChangeRaw,
    required this.onChangeAmount,
    required this.onChangeUnit,
    required this.onTapAdd,
    required this.onTapCancel,
    required this.onTapRegister,
    required this.onEditCompleteAmount,
    required this.onEditCompleteDeli,
    required this.onEditCompleteSell,
    this.ingredientList,
    this.visible = false,
    this.focusNodeSellPrice,
    this.focusNodeDeliPrice,
    this.focusNodeAmount,
  });

  @override
  State<IngredientAddOtherNeedDialogView> createState() =>
      _IngredientAddOtherNeedDialogViewState();
}

class _IngredientAddOtherNeedDialogViewState
    extends State<IngredientAddOtherNeedDialogView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(context) / 10, vertical: 20),
          decoration: BoxDecoration(
            color: WHITE_COLOR,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              buildBoxShadow(),
            ],
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              IngredientDialogTitleRowView(
                title: widget.title,
                onTapCross: () {
                  widget.onTapCross();
                },
              ),
              const SizedBox(height: 8),
              DropDownForProductView(
                menuTitle: "Choose Size",
                onChange: (value) {
                  widget.onChangeSize(value ?? "");
                },
                list: widget.sizeList,
              ),
              const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: widget.focusNodeSellPrice,
                isFilled: true,
                isBorderIncluded: true,
                labelText: "Selling Price",
                onChanged: (sellPrice) {
                  widget.onChangeSellingPrice(sellPrice);
                },
                onEditingComplete: () {
                  widget.onEditCompleteSell();
                },
              ),
              const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: widget.focusNodeDeliPrice,
                isFilled: true,
                isBorderIncluded: true,
                labelText: "Delivery Price",
                onChanged: (deliPrice) {
                  widget.onChangeDeliPrice(deliPrice);
                },
                onEditingComplete: () {
                  widget.onEditCompleteDeli();
                },
              ),
              const SizedBox(height: 20),
              Text("Ingredients",
                  style:
                      ConfigStyle.regularStyle(FONT_MEDIUM + 2, BLACK_HEAVY)),
              const SizedBox(height: 8),
              ListView.separated(
                itemBuilder: (context, index) => ChosenIngredientItemDetailView(
                  name: widget.ingredientList?[index].rawMaterialName ?? "",
                  amount:
                      (widget.ingredientList?[index].amount ?? 0).toString(),
                  unit: widget.ingredientList?[index].unitName ?? "",
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 2),
                itemCount: widget.ingredientList?.length ?? 0,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
              ),
              const SizedBox(height: 8),
              DropDownForProductView(
                menuTitle: "Choose Raw",
                onChange: (value) {
                  widget.onChangeRaw(value ?? "");
                },
                list: widget.rawList,
              ),
              const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: widget.focusNodeAmount,
                isFilled: true,
                isBorderIncluded: true,
                labelText: "Amount",
                onChanged: (amount) {
                  widget.onChangeAmount(amount);
                },
                onEditingComplete: () {
                  widget.onEditCompleteAmount();
                },
              ),
              const SizedBox(height: 8),
              DropDownForProductView(
                menuTitle: "Choose Unit",
                onChange: (value) {
                  widget.onChangeUnit(value ?? "");
                },
                list: widget.unitList,
              ),
              const SizedBox(height: 8),
              TwoButtonsForIngredientDialogView(
                isVisibleRegister: widget.visible,
                onTapAdd: () {
                  widget.onTapAdd();
                },
                onTapCancel: () {
                  widget.onTapCancel();
                },
                onTapRegister: () {
                  widget.onTapRegister();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
