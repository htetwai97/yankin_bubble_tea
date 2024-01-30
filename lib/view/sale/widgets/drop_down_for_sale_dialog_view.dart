// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class DropDownForSaleDialogView extends StatefulWidget {
  List<String> list;
  Function(String?) onChange;
  DropDownForSaleDialogView({
    super.key,
    required this.list,
    required this.onChange,
  });

  @override
  State<DropDownForSaleDialogView> createState() =>
      _DropDownForSaleDialogViewState();
}

class _DropDownForSaleDialogViewState extends State<DropDownForSaleDialogView> {
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        alignment: Alignment.centerLeft,
        value: item,
        child: SizedBox(
          width: 100,
          child: Text(
            item,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        isDense: false,
        isExpanded: false,
        elevation: 0,
        dropdownColor: Colors.white,
        value: null,
        items: widget.list.map(buildMenuItem).toList(),
        onChanged: (value) {
          widget.onChange(value);
        });
  }
}
