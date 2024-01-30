// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';

class TwoTextFieldForProductCreateAndEditView extends StatelessWidget {
  String? preDefinedProductName;
  String? preDefinedDescription;
  Function(String) onChangeProductName;
  Function(String) onChangeDescription;
  Function onFirstEditingComplete;
  Function onSecondEditingComplete;
  FocusNode? firstFocusNode;
  FocusNode? secondFocusNode;
  TwoTextFieldForProductCreateAndEditView({
    super.key,
    required this.onChangeDescription,
    required this.onChangeProductName,
    required this.onFirstEditingComplete,
    required this.onSecondEditingComplete,
    this.preDefinedProductName,
    this.preDefinedDescription,
    this.firstFocusNode,
    this.secondFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFieldView(
          focusNode: firstFocusNode,
          predefinedText: preDefinedProductName,
          labelText: "Product Name",
          onChanged: (e) {
            onChangeProductName(e);
          },
          onEditingComplete: () {
            onFirstEditingComplete();
          },
          isBorderIncluded: true,
          isFilled: true,
        ),
        SizedBox(height: scaleHeight(context) / 30),
        CommonTextFieldView(
          focusNode: secondFocusNode,
          predefinedText: preDefinedDescription,
          labelText: "Description",
          onChanged: (e) {
            onChangeDescription(e);
          },
          onEditingComplete: () {
            onSecondEditingComplete();
          },
          isBorderIncluded: true,
          isFilled: true,
        ),
      ],
    );
  }
}
