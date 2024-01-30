// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class CommonTextFieldView extends StatefulWidget {
  String labelText;
  String? predefinedText;
  Function(String) onChanged;
  Function onEditingComplete;
  FocusNode? focusNode;
  bool visibleEye;
  bool visibleSearch;
  bool isBorderIncluded;
  bool isFilled;
  bool numberOnly;
  CommonTextFieldView({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.focusNode,
    required this.onEditingComplete,
    this.predefinedText,
    this.visibleEye = false,
    this.visibleSearch = false,
    this.isBorderIncluded = false,
    this.isFilled = false,
    this.numberOnly = false,
  });

  @override
  State<CommonTextFieldView> createState() => _CommonTextFieldViewState();
}

class _CommonTextFieldViewState extends State<CommonTextFieldView> {
  var myController = TextEditingController();
  FocusNode? focusNode = FocusNode();
  late bool secure;
  @override
  void initState() {
    super.initState();
    setState(() {
      secure = false;
      myController.text = widget.predefinedText ?? "";
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
    //keyboardType: numberOnly == false ?? TextInputType.number: TextInputType.number,
    return TextFormField(
      focusNode: widget.focusNode,
      controller: myController,
      obscureText: secure,
      onChanged: (text) {
        widget.onChanged(text);
      },
      onEditingComplete: () {
        widget.onEditingComplete();
      },
      decoration: InputDecoration(
        enabledBorder: (!widget.isBorderIncluded) ? null : enabledBorder,
        focusedBorder: (!widget.isBorderIncluded) ? null : focusedBorder,
        filled: widget.isFilled,
        fillColor: TEXT_FIELD_COLOR,
        prefixIcon: Visibility(
          visible: widget.visibleSearch,
          child: const Icon(
            Icons.search,
            size: 28,
          ),
        ),
        suffixIcon: Visibility(
          visible: widget.visibleEye,
          child: IconButton(
            onPressed: () {
              setState(() {
                secure = !secure;
              });
            },
            icon: Icon(
              secure ? Icons.visibility_off : Icons.visibility,
              size: 28,
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: scaleWidth(context) / 80,
        ),
        isDense: true,
        isCollapsed: widget.visibleSearch,
        labelText: widget.visibleSearch ? null : widget.labelText,
        hintText: widget.visibleSearch ? "Search" : null,
        labelStyle: ConfigStyle.regularStyle(
          FONT_MEDIUM,
          BLACK_LIGHT,
        ),
        border: (!widget.isBorderIncluded)
            ? const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: BLACK_LIGHT,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                gapPadding: 1,
                //borderSide: const BorderSide(color: Colors.black26, width: 0.3),
              ),
      ),
      keyboardType:
          widget.numberOnly ? TextInputType.number : TextInputType.text,
      style: const TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }
}
