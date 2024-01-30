// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/product_list/widgets/avatar_and_name_for_product_view.dart';
import 'package:multipurpose_pos_application/view/product_list/widgets/product_function_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';

class ProductIObjDetailView extends StatelessWidget {
  String productName;
  String productUrl;
  Function onTapEdit;
  Function onTapIngredient;
  Function onTapOption;
  Function onTapDetail;
  ProductIObjDetailView({
    super.key,
    required this.productName,
    required this.productUrl,
    required this.onTapEdit,
    required this.onTapIngredient,
    required this.onTapOption,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleWidth(context) / 2.2,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12, width: 0.3),
        boxShadow: [
          buildBoxShadow(),
        ],
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                onTapEdit();
              },
              child: AvatarAndNameForProductView(
                name: productName,
                ///url: productUrl,
                url: "assets/images/bubbletealogo.jpg",
              ),
            ),
            InkWell(
              onTap: () {
                onTapIngredient();
              },
              child: ProductFunctionView(
                name: "Ingredient",
                url: "assets/images/ingredient_logo_two.png",
              ),
            ),
            InkWell(
              onTap: () {
                onTapOption();
              },
              child: ProductFunctionView(
                name: "Option",
                url: "assets/images/option_two_logo.png",
              ),
            ),
            InkWell(
              onTap: () {
                onTapDetail();
              },
              child: ProductFunctionView(
                name: "Detail",
                url: "assets/images/detail_logo.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
