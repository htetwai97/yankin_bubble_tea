// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/chosen_ingredient_item_detail_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/two_buttons_for_ingredient_dialog_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/drop_down_for_product_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class OptionSelectionShowDialogView extends StatefulWidget {
  // String title;
  List<String> dropDownValues;
  List<RawMaterialVO> rawMaterialList;
  int? productId;
  // Function onTapCross;
  // Function onTapAdd;
  // Function onTapCancel;
  Function(List<RequestIngredientVO>) onTapRegister;
  // Function(String) onChangeName;
  // Function(String) onChangeRaw;
  // Function(String) onChangeAmount;
  // List<RequestIngredientVO> requestIngredientList;
  // bool isVisibleRegister;

  OptionSelectionShowDialogView({
    super.key,
    // required this.title,
    // required this.onTapCross,
    this.productId,
    required this.dropDownValues,
    required this.rawMaterialList,
    // required this.onChangeAmount,
    // required this.onChangeName,
    // required this.onChangeRaw,
    // required this.onTapCancel,
    // required this.onTapAdd,
    required this.onTapRegister,
    // required this.requestIngredientList,
    // this.isVisibleRegister = false,
  });

  @override
  State<OptionSelectionShowDialogView> createState() =>
      _OptionSelectionShowDialogViewState();
}

class _OptionSelectionShowDialogViewState
    extends State<OptionSelectionShowDialogView> {
  List<RequestIngredientVO> requestIngredientList = [];

  bool isVisibleRegister = false;

  FocusNode focusNodeOne = FocusNode();

  FocusNode focusNodeTwo = FocusNode();

  String? rawMaterialName;

  String? name;

  int? amount;

  int? rawMaterialId;

  void _onChangeRawMaterial(String rawMaterial) {
    rawMaterialName = rawMaterial;
    List<RawMaterialVO> list = widget.rawMaterialList
        .where((element) => element.name == rawMaterial)
        .toList();
    if (list.isNotEmpty) {
      list.take(1);
      RawMaterialVO rawMaterialVO = list.elementAt(0);
      rawMaterialId = rawMaterialVO.id;
    }
  }

  void _visibleRegisterButton() {
    if (requestIngredientList.isNotEmpty) {
      isVisibleRegister = true;
    } else {
      isVisibleRegister = false;
    }
  }

  void _onTapAdd() {
    if (widget.productId != null &&
        widget.productId != 0 &&
        name != "" &&
        name != null) {
      RequestIngredientVO ingredientVO = RequestIngredientVO(
        size: "Medium",
        productId: widget.productId,
        rawMaterialName: "Grass Jelly",
        rawMaterialId: 53,
        amount: 1,
        optionName: name,
      );
      requestIngredientList.add(ingredientVO);
      _visibleRegisterButton();
      _removeIngredientData();
    }
  }

  void _removeIngredientData() {
    rawMaterialName = null;
    rawMaterialId = null;
    amount = null;
    name = null;
  }

  void _onChangeAmount(String amount) {
    this.amount = int.parse(amount);
  }

  void _onChangeName(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: scaleHeight(context) / 1.3,
          width: scaleWidth(context) / 1.5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              IngredientDialogTitleRowView(
                title: "Option Selection",
                onTapCross: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 8),
              // ListView.separated(
              //   itemBuilder: (context, index) => ChosenIngredientItemDetailView(
              //     name: requestIngredientList[index].rawMaterialName ?? "",
              //     amount: (requestIngredientList[index].amount ?? 0).toString(),
              //     unit: "gram",
              //   ),
              //   separatorBuilder: (context, index) => const SizedBox(height: 2),
              //   itemCount: requestIngredientList.length,
              //   shrinkWrap: true,
              //   scrollDirection: Axis.vertical,
              //   physics: const NeverScrollableScrollPhysics(),
              // ),
              // const SizedBox(height: 8),
              CommonTextFieldView(
                focusNode: focusNodeOne,
                isFilled: true,
                isBorderIncluded: true,
                labelText: "Name",
                onChanged: (nameOne) {
                  _onChangeName(nameOne);
                },
                onEditingComplete: () {
                  focusNodeOne.unfocus();
                },
              ),
              // const SizedBox(height: 8),
              // DropDownForProductView(
              //   list: widget.dropDownValues,
              //   menuTitle: "Choose Raw",
              //   onChange: (value) {
              //     _onChangeRawMaterial(value ?? "");
              //   },
              // ),
              // const SizedBox(height: 8),
              // CommonTextFieldView(
              //   focusNode: focusNodeTwo,
              //   isFilled: true,
              //   isBorderIncluded: true,
              //   labelText: "Amount",
              //   onChanged: (amount) {
              //     _onChangeAmount(amount);
              //   },
              //   onEditingComplete: () {
              //     focusNodeTwo.unfocus();
              //   },
              // ),
              const SizedBox(height: 20),
              TwoButtonsForIngredientDialogView(
                isVisibleRegister: isVisibleRegister,
                onTapAdd: () {
                  setState(() {
                    _onTapAdd();
                  });
                },
                onTapCancel: () {
                  Navigator.pop(context);
                },
                onTapRegister: () {
                  widget.onTapRegister(requestIngredientList);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
