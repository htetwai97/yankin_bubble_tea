// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/first_row_ingredient_create_item_view.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/second_row_ingredient_create_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class IngredientItemListView extends StatelessWidget {
  List<RequestSizeObjectVO> sizeOfIngredientList;
  Function(RequestSizeObjectVO requestIngredient) onTapEdit;
  bool visibleEdit;
  IngredientItemListView({
    super.key,
    required this.sizeOfIngredientList,
    required this.onTapEdit,
    this.visibleEdit = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        RequestSizeObjectVO sizeOfIngredientVO = sizeOfIngredientList[index];
        List<RequestIngredientVO> ingredientList =
            sizeOfIngredientVO.ingredients ?? [];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          width: scaleWidth(context) / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12, width: 0.3),
            boxShadow: [
              buildBoxShadow(),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FirstRowIngredientCreateItemView(
                  visibleEdit: visibleEdit,
                  size: sizeOfIngredientVO.size ?? "",
                  textOne: "S: ${sizeOfIngredientVO.sellPrice}",
                  textTwo: "D: ${sizeOfIngredientVO.deliPrice}",
                  onTapEditIcon: () {
                    onTapEdit(sizeOfIngredientVO);
                  },
                ),
              ),
              SizedBox(
                height: 20,
                child: Center(
                  child: Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SecondRowIngredientCreateItemView(
                  isBoxDecorated: false,
                  textOne: "Raw Material",
                  textTwo: "Amount",
                  textThree: "Unit",
                ),
              ),
              const SizedBox(height: 3),
              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  RequestIngredientVO ingredient = ingredientList[index];
                  return SecondRowIngredientCreateItemView(
                    textOne: "${ingredient.rawMaterialName}",
                    textTwo: "${ingredient.amount}",
                    textThree: "${ingredient.unitName}",
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 3),
                itemCount: ingredientList.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: sizeOfIngredientList.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
