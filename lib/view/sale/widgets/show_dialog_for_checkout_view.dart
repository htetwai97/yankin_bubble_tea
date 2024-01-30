// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/ingredient_list_for_product_edit/widgets/ingredient_dialog_title_row_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/build_box_shadow.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/buttons_for_checkout_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/checkout_text_field_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/radio_for_receive_view.dart';

class ShowDialogForCheckOutView extends StatefulWidget {
  Function(int?) onChooseDateRadio;
  Function(int?) onChooseTypeRadio;
  Function(String) onChooseBackDate;
  Function(String) onChooseCustomerName;
  Function(String) onChoosePromotion;
  Function onTapDirect;
  Function onTapPromotion;
  Function onTapCross;
  List<String> customerDropDownList;
  List<String> promotionDropDownList;

  ShowDialogForCheckOutView({
    Key? key,
    required this.onTapPromotion,
    required this.onTapDirect,
    required this.onChooseBackDate,
    required this.onChooseCustomerName,
    required this.onChooseDateRadio,
    required this.onChoosePromotion,
    required this.onChooseTypeRadio,
    required this.onTapCross,
    required this.customerDropDownList,
    required this.promotionDropDownList,
  }) : super(key: key);

  @override
  State<ShowDialogForCheckOutView> createState() =>
      _ShowDialogForCheckOutViewState();
}

class _ShowDialogForCheckOutViewState extends State<ShowDialogForCheckOutView> {
  int? groupValueOne = 1;
  int? groupValueTwo = 1;

  String? displayBackDate;
  String? displayCustomerName;
  String? promotion;

  FocusNode? focusNodeBackDate = FocusNode();
  FocusNode? focusNodeCustomerName = FocusNode();
  FocusNode? focusNodePromotion = FocusNode();

  bool isTypingBackDate = false;
  bool isTypingCustomerName = false;
  bool isTypingPromotion = false;
  bool isVisibleDirectButton = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: scaleWidth(context) / 4.4, vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: WHITE_COLOR,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              buildBoxShadow(),
            ],
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              IngredientDialogTitleRowView(
                title: "Card Selection",
                onTapCross: () {
                  widget.onTapCross();
                },
              ),
              RadioForReceiveView(
                textOne: "Today",
                textTwo: "Back Date",
                isCheckOut: true,
                groupValue: groupValueOne,
                onChooseType: (value) {
                  setState(() {
                    groupValueOne = value;
                    widget.onChooseDateRadio(value);
                  });
                },
              ),
              Visibility(
                visible: (groupValueOne == 2),
                child: CheckoutTextFieldView(
                  isTyping: isTypingBackDate,
                  predefinedText: displayBackDate,
                  focusNode: focusNodeBackDate,
                  isCalendar: true,
                  labelText: "Back Date",
                  onChanged: (backDate) {
                    isTypingBackDate = true;
                    displayBackDate = backDate;
                    widget.onChooseBackDate(backDate);
                  },
                  onEditingComplete: () {
                    setState(() {
                      focusNodeBackDate?.unfocus();
                    });
                  },
                  onTapSuffix: () async {
                    isTypingBackDate = false;
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023, 3),
                      lastDate: DateTime(2101),
                    );
                    final formatter = DateFormat('yyyy-MM-dd');
                    var backDate = formatter.format(picked ?? DateTime.now());
                    setState(() {
                      displayBackDate = backDate;
                      widget.onChooseBackDate(backDate);
                    });
                  },
                  onChooseDropDown: (dropDownValue) {},
                ),
              ),
              RadioForReceiveView(
                textOne: "Walk in",
                textTwo: "Delivery",
                isCheckOut: true,
                groupValue: groupValueTwo,
                onChooseType: (value) {
                  setState(() {
                    groupValueTwo = value;
                    widget.onChooseTypeRadio(value);
                  });
                },
              ),
              Visibility(
                visible: (groupValueTwo == 2),
                child: CheckoutTextFieldView(
                  dropDownList: widget.customerDropDownList,
                  isTyping: isTypingCustomerName,
                  predefinedText: displayCustomerName,
                  focusNode: focusNodeCustomerName,
                  isCalendar: false,
                  labelText: "Customer Name",
                  onChanged: (customerName) {
                    isTypingCustomerName = true;
                    widget.onChooseCustomerName(customerName);
                  },
                  onEditingComplete: () {
                    setState(() {
                      focusNodeCustomerName?.unfocus();
                    });
                  },
                  onTapSuffix: () {},
                  onChooseDropDown: (customerName) {
                    setState(() {
                      isTypingCustomerName = false;
                      displayCustomerName = customerName;
                      widget.onChooseCustomerName(customerName ?? "");
                    });
                  },
                ),
              ),
              Visibility(
                visible: (groupValueTwo == 2),
                child: const SizedBox(height: 10),
              ),
              CheckoutTextFieldView(
                dropDownList: widget.promotionDropDownList,
                isTyping: isTypingPromotion,
                predefinedText: promotion,
                focusNode: focusNodePromotion,
                isCalendar: false,
                labelText: "Choose promotion",
                onChanged: (promotion) {
                  isTypingPromotion = true;
                  widget.onChoosePromotion(promotion);
                  setState(() {
                    isVisibleDirectButton = false;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    focusNodePromotion?.unfocus();
                  });
                },
                onTapSuffix: () {},
                onChooseDropDown: (dropDownValue) {
                  setState(() {
                    isTypingPromotion = false;
                    promotion = dropDownValue;
                    widget.onChoosePromotion(dropDownValue ?? "");
                    isVisibleDirectButton = false;
                  });
                },
              ),
              const SizedBox(height: 20),
              ButtonsForCheckOutView(
                isVisibleDirectButton: isVisibleDirectButton,
                onTapDirect: () {
                  widget.onTapDirect();
                },
                onTapPromotion: () {
                  widget.onTapPromotion();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
