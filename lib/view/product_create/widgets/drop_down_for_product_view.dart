// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class DropDownForProductView extends StatefulWidget {
  String? selectedValue;
  List<String> list;
  String? menuTitle;
  Function(String?) onChange;
  DropDownForProductView({
    super.key,
    this.list = const ["one", "two", "three", "four"],
    this.menuTitle,
    this.selectedValue,
    required this.onChange,
  });

  @override
  State<DropDownForProductView> createState() => _DropDownForProductViewState();
}

class _DropDownForProductViewState extends State<DropDownForProductView> {
  String? dropdownValue;
  String? menuTitle;
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
  void initState() {
    setState(() {
      menuTitle = widget.menuTitle;
      dropdownValue = widget.selectedValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context) / 7.2,
      width: scaleWidth(context),
      padding: EdgeInsets.only(left: scaleHeight(context) / 8, right: 20),
      decoration: BoxDecoration(
        color: TEXT_FIELD_COLOR,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black26, width: 0.6),
      ),
      child: Row(
        children: [
          Text(
            (dropdownValue != null && dropdownValue != "")
                ? dropdownValue ?? "no dropDown"
                : menuTitle ?? "Choose Something",
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          const Spacer(),
          DropdownButton<String>(
              underline: Container(
                color: Colors.transparent,
              ),
              isDense: true,
              isExpanded: false,
              elevation: 0,
              dropdownColor: Colors.white,
              value: null,
              items: widget.list.map(buildMenuItem).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value;
                  menuTitle = null;
                });
                widget.onChange(value);
              }),
        ],
      ),
    );
  }
}
