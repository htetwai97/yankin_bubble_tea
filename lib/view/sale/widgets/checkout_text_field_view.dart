// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/drop_down_for_sale_dialog_view.dart';

class CheckoutTextFieldView extends StatefulWidget {
  String labelText;
  Function(String) onChanged;
  Function onTapSuffix;
  Function(String?) onChooseDropDown;
  Function onEditingComplete;
  FocusNode? focusNode;
  bool isCalendar;
  List<String> dropDownList;
  String? predefinedText;
  bool isTyping;
  CheckoutTextFieldView({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.focusNode,
    required this.onEditingComplete,
    this.isCalendar = true,
    required this.onTapSuffix,
    required this.onChooseDropDown,
    this.predefinedText,
    this.dropDownList = const ["one", "two", "three", "four"],
    this.isTyping = false,
  });

  @override
  State<CheckoutTextFieldView> createState() => _CheckoutTextFieldViewState();
}

class _CheckoutTextFieldViewState extends State<CheckoutTextFieldView> {
  var myController = TextEditingController();
  FocusNode? focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    setState(() {
      focusNode = widget.focusNode;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.black87, width: 0.2),
    );
    var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: APP_THEME_COLOR, width: 0.6),
    );
    return TextFormField(
      focusNode: widget.focusNode,
      controller: (widget.isTyping)
          ? null
          : TextEditingController(text: widget.predefinedText),
      onChanged: (text) {
        widget.onChanged(text);
      },
      onEditingComplete: () {
        widget.onEditingComplete();
      },
      decoration: InputDecoration(
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        filled: true,
        fillColor: TEXT_FIELD_COLOR,
        suffixIcon: (widget.isCalendar)
            ? InkWell(
                onTap: () {
                  widget.onTapSuffix();
                },
                child: const Icon(
                  Icons.calendar_month_sharp,
                  size: 28,
                  color: BUTTON_COLOR,
                ),
              )
            : DropDownForSaleDialogView(
                list: widget.dropDownList,
                onChange: (value) {
                  widget.onChooseDropDown(value);
                },
              ),
        contentPadding: EdgeInsets.symmetric(
          vertical: scaleWidth(context) / 100,
          horizontal: scaleWidth(context) / 100,
        ),
        isDense: true,
        labelText: widget.labelText,
        labelStyle: ConfigStyle.regularStyle(
          FONT_MEDIUM,
          BLACK_LIGHT,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 1,
        ),
      ),
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }
}
