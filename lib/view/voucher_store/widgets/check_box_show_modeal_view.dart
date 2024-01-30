// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';

class CheckBoxShowModalView extends StatefulWidget {
  Function(bool) onCheck;
  bool? checkValue;
  String mes;
  CheckBoxShowModalView({
    super.key,
    required this.onCheck,
    required this.mes,
    this.checkValue,
  });

  @override
  State<CheckBoxShowModalView> createState() => _CheckBoxShowModalViewState();
}

class _CheckBoxShowModalViewState extends State<CheckBoxShowModalView> {
  late bool value;
  @override
  void initState() {
    value = widget.checkValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (e) {
            setState(() {
              value = e ?? false;
              widget.onCheck(e ?? false);
            });
          },
        ),
        Text(
          widget.mes,
          style: const TextStyle(
            color: APP_THEME_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: FONT_MEDIUM,
          ),
        )
      ],
    );
  }
}
