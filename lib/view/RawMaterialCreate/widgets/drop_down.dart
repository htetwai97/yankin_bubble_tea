// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class DropDown extends StatefulWidget {
  String? selectedValue;
  List<String> list;
  String? menuTitle;
  Function(String?) onChange;
  DropDown({
    super.key,
    this.list = const ["one", "two", "three", "four"],
    this.menuTitle,
    this.selectedValue,
    required this.onChange,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? dropdownValue;
  String? menuTitle;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        alignment: Alignment.centerLeft,
        value: item,
        child: SizedBox(
          width: scaleWidth(context) / 10,
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
      padding: EdgeInsets.only(
          left: scaleHeight(context) / 12,
          top: scaleHeight(context) / 40,
          bottom: scaleHeight(context) / 40),
      decoration: BoxDecoration(
        color: TEXT_FIELD_COLOR,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black26, width: 0.6),
      ),
      child: Row(
        children: [
          SizedBox(width: scaleWidth(context) / 44),
          Text(
            (dropdownValue != null && dropdownValue != "")
                ? dropdownValue!
                : menuTitle ?? "Choose Something",
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          SizedBox(width: scaleWidth(context) / 3),
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
