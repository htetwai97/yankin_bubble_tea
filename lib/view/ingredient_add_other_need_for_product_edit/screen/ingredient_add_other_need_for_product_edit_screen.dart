import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/ingredient_add_other_need_for_product_edit/bloc/ingredient_add_other_need_for_product_edit_bloc.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/screen/ingredient_list_for_product_edit_screen.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_add_other_need_dialog_view.dart';
import 'package:provider/provider.dart';

class IngredientAddOtherNeedForProductEditScreen extends StatelessWidget {
  const IngredientAddOtherNeedForProductEditScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IngredientAddOtherNeedForProductEditBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<IngredientAddOtherNeedForProductEditBloc>(
            builder: (context, blocDialog, child) =>
                IngredientAddOtherNeedDialogView(
              onEditCompleteAmount: () {
                blocDialog.onEditCompleteAmount();
              },
              onEditCompleteDeli: () {
                blocDialog.onEditCompleteDeli();
              },
              onEditCompleteSell: () {
                blocDialog.onEditCompleteSell();
              },
              focusNodeSellPrice: blocDialog.focusNodeSellPrice,
              focusNodeDeliPrice: blocDialog.focusNodeDeliPrice,
              focusNodeAmount: blocDialog.focusNodeAmount,
              visible: blocDialog.visibleRegister,
              ingredientList: blocDialog.requestIngredientList,
              title: "Ingredients Selection",
              onTapCross: () {
                blocDialog.onTapCross();
                Navigator.pop(context);
              },
              sizeList: const ["Small", "Medium", "Large"],
              rawList: blocDialog.rawMaterialNameList,
              unitList: const [
                "gram",
                "litre",
                "milligram",
                "pound",
              ],
              onChangeSize: (size) {
                blocDialog.onChangeSize(size);
              },
              onChangeSellingPrice: (sellPrice) {
                blocDialog.onChangeSellPrice(sellPrice);
              },
              onChangeDeliPrice: (deliPrice) {
                blocDialog.onChangeDeliPrice(deliPrice);
              },
              onChangeRaw: (raw) {
                blocDialog.onChangeRawMaterial(raw);
              },
              onChangeAmount: (amount) {
                blocDialog.onChangeAmount(amount);
              },
              onChangeUnit: (unit) {
                blocDialog.onChangeUnitName(unit);
              },
              onTapAdd: () {
                blocDialog.onTapAdd();
              },
              onTapCancel: () {
                blocDialog.onTapCancel();
                Navigator.pop(context);
              },
              onTapRegister: () {
                blocDialog.onTapRegister().then((value) {
                  Functions.replacementTransition(
                    context,
                    const IngredientListForProductEditScreen(),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
