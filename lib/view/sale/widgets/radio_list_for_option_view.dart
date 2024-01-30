// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/option_vo.dart';
import 'package:multipurpose_pos_application/network/response/post_option_list_response.dart';

import '../../../data/vos/option_vo.dart';

class RadioListForOptionView extends StatefulWidget {
  List<OptionVO> optionList;
  Function(int?, String?) onChooseType;
  RadioListForOptionView({
    Key? key,
    required this.optionList,
    required this.onChooseType,
  }) : super(key: key);

  @override
  State<RadioListForOptionView> createState() => _RadioListForOptionViewState();
}

class _RadioListForOptionViewState extends State<RadioListForOptionView> {
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.optionList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Radio(
                activeColor: APP_THEME_COLOR,
                value: index + 1,
                groupValue: groupValue,
                onChanged: (clickValue) {
                  setState(() {
                    groupValue = clickValue;
                    widget.onChooseType(widget.optionList[index].id,
                        widget.optionList[index].name);
                  });
                },
              ),
              Text(
                widget.optionList[index].name ?? "",
                style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
              ),
            ],
          );
        });
  }
}
