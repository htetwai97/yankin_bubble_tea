// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

import '../../../data/vos/request_size_object_vo.dart';
import 'ingredient_view.dart';

class SizeItemView extends StatelessWidget {
  RequestSizeObjectVO? sizeOfIngredient;

  SizeItemView({super.key, required this.sizeOfIngredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          buildBoxShadow(),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                "${sizeOfIngredient?.size}",
                style: ConfigStyle.boldStyle(FONT_MEDIUM + 5, BLACK_LIGHT),
              ),
              SizedBox(
                width: scaleHeight(context) / 4,
              ),
              Text(
                textAlign: TextAlign.center,
                "${sizeOfIngredient?.sellPrice}",
                style: ConfigStyle.boldStyle(FONT_MEDIUM + 5, BLACK_LIGHT),
              ),
            ],
          ),
          Text(
            textAlign: TextAlign.center,
            "Ingredients:",
            style: ConfigStyle.boldStyle(FONT_MEDIUM + 5, BLACK_HEAVY),
          ),
          SizedBox(
            height: scaleHeight(context) / 8,
            child: ListView.builder(
              itemBuilder: (context, index) => IngredientView(
                rawMaterialName:
                    sizeOfIngredient?.ingredients?[index].rawMaterialName,
                amount: sizeOfIngredient?.ingredients?[index].amount,
                unitName: sizeOfIngredient?.ingredients?[index].unitName,
              ),
              itemCount: sizeOfIngredient?.ingredients?.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
