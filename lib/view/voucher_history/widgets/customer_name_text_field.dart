// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class CustomerNameTextField extends StatefulWidget {
  String labelText;
  String? predefinedText;
  Function(String) onChanged;
  Function onEditingComplete;
  Function onNamePick;
  FocusNode? focusNode;
  bool secure;
  bool isBorderIncluded;
  bool isFilled;
  CustomerNameTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.focusNode,
    required this.onEditingComplete,
    required this.onNamePick,
    this.secure = false,
    this.predefinedText,
    this.isBorderIncluded = false,
    this.isFilled = false,
  });

  @override
  State<CustomerNameTextField> createState() => _CustomerNameTextFieldState();
}

class _CustomerNameTextFieldState extends State<CustomerNameTextField> {
  var myController = TextEditingController();
  FocusNode? focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    setState(() {
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
    return TextFormField(
      focusNode: widget.focusNode,
      controller: myController,
      obscureText: widget.secure,
      onChanged: (text) {
        widget.onChanged(text);
      },
      onEditingComplete: () {
        widget.onEditingComplete();
      },
      decoration: InputDecoration(
        filled: widget.isFilled,
        fillColor: TEXT_FIELD_COLOR,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        suffixIcon: Visibility(
          visible: true,
          child: IconButton(
            onPressed: () {
              widget.onNamePick();
            },
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              size: 28,
            ),
          ),
        ),
        labelText: "Customer Name",
        labelStyle: ConfigStyle.regularStyle(
          FONT_MEDIUM,
          BLACK_LIGHT,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26, width: 0.3),
        ),
      ),
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }
}
