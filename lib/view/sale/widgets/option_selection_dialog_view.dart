// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/data/vos/option_vo.dart';
import 'package:multipurpose_pos_application/network/response/post_option_list_response.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/radio_list_for_option_view.dart';

import '../../../data/vos/option_vo.dart';

class OptionSelectionDialogView extends StatelessWidget {
  List<OptionVO> optionList;
  Function onTapOK;
  Function onTapCross;
  Function(int?, String?) onChooseType;
  OptionSelectionDialogView({
    super.key,
    required this.optionList,
    required this.onTapCross,
    required this.onTapOK,
    required this.onChooseType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: scaleHeight(context) / 2,
          width: scaleWidth(context) / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IngredientDialogTitleRowView(
                  title: "Option Selection",
                  onTapCross: () {
                    onTapCross();
                  },
                ),
                RadioListForOptionView(
                  optionList: optionList,
                  onChooseType: (optionId, optionName) {
                    onChooseType(optionId, optionName);
                  },
                ),
                Visibility(
                  visible: (optionList.length != 0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: BUTTON_COLOR,
                      onPressed: () {
                        onTapOK();
                      },
                      child: Text(
                        "OK",
                        style: ConfigStyle.regularStyle(
                          FONT_MEDIUM,
                          WHITE_COLOR,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
