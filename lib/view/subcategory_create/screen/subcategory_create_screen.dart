import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/radio_for_category_create_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';

class SubCategoryCreateScreen extends StatelessWidget {
  const SubCategoryCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
        child: CommonAppBarView(
          onTapBack: () {},
          title: "Subcategory Create Page",
          automaticImply: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaleHeight(context) / 3),
          child: Column(
            children: [
              SizedBox(height: scaleHeight(context) / 20),
              CommonTextFieldView(
                onEditingComplete: () {},
                labelText: "Subcategory Code",
                onChanged: (e) {},
                isBorderIncluded: true,
                isFilled: true,
              ),
              SizedBox(height: scaleHeight(context) / 40),
              CommonTextFieldView(
                onEditingComplete: () {},
                labelText: "Subcategory Name",
                onChanged: (e) {},
                isBorderIncluded: true,
                isFilled: true,
              ),
              SizedBox(height: scaleHeight(context) / 40),
              CommonTextFieldView(
                onEditingComplete: () {},
                labelText: "Category Name",
                onChanged: (e) {},
                isBorderIncluded: true,
                isFilled: true,
              ),
              SizedBox(height: scaleHeight(context) / 40),
              RadioForCategoryCreateView(
                onChooseType: (value) {},
              ),
              SizedBox(height: scaleHeight(context) / 40),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: scaleHeight(context) / 8),
                child: CategoryButtonsView(
                  onTapCreate: () {},
                  onTapCancel: () {},
                ),
              ),
              SizedBox(height: scaleHeight(context) / 20),
            ],
          ),
        ),
      ),
    );
  }
}
