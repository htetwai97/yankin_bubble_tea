// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/vos/supplier_vo.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/drop_down_for_product_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/image_picking_box_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/two_text_view_for_product_create_and_edit_view.dart';
import 'package:multipurpose_pos_application/view/product_edit/bloc/product_edit_bloc.dart';
import 'package:multipurpose_pos_application/view/product_list/screen/product_list_screen.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import '../../supplier_list/screen/supplier_list_screen.dart';
import '../bloc/supplier_edit_bloc.dart';
import '../../../core/core_config/config_style.dart';

class SupplierEditScreen extends StatelessWidget {
  SupplierVO? supplierVO;
  SupplierEditScreen({
    Key? key,
    required this.supplierVO,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupplierEditBloc(supplierVO),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                Navigator.pop(context);
              },
              title: "Supplier Edit Page",
              automaticImply: false,
            ),
          ),
          body: Selector<SupplierEditBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleHeight(context) / 3),
                    child: Column(
                      children: [
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<SupplierEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Name",
                            predefinedText: bloc.name,
                            focusNode: bloc.firstFocusNode,
                            onChanged: (e) {
                              bloc.onChangeSupplierName(e);
                            },
                            onEditingComplete: () {
                              bloc.onFirstEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<SupplierEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "address",
                            predefinedText: bloc.address,
                            focusNode: bloc.secondFocusNode,
                            onChanged: (e) {
                              bloc.onChangeAddress(e);
                            },
                            onEditingComplete: () {
                              bloc.onSecondEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<SupplierEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Phone No",
                            predefinedText: bloc.phone,
                            focusNode: bloc.thirdFocusNode,
                            onChanged: (e) {
                              bloc.onChangePhone(e);
                            },
                            onEditingComplete: () {
                              bloc.onThirdEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<SupplierEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "email",
                            predefinedText: bloc.email,
                            focusNode: bloc.fourthFocusNode,
                            onChanged: (e) {
                              bloc.onChangeEmail(e);
                            },
                            onEditingComplete: () {
                              bloc.onFourthEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<SupplierEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Credit Limit Amount",
                            predefinedText: bloc.creditAmount.toString(),
                            focusNode: bloc.fifthFocusNode,
                            numberOnly: true,
                            onChanged: (e) {
                              int i = int.parse(e);
                              bloc.onChangeCreditAmount(i);
                            },
                            onEditingComplete: () {
                              bloc.onFifthEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 40),
                        Consumer<SupplierEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Repayment Period(Week Count)",
                            predefinedText: bloc.repaymentPeriod.toString(),
                            focusNode: bloc.sixthFocusNode,
                            numberOnly: true,
                            onChanged: (e) {
                              int i = int.parse(e);
                              bloc.onChangeRepaymentPeriod(i);
                            },
                            onEditingComplete: () {
                              bloc.onSixthEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Consumer<SupplierEditBloc>(
                            builder: (context, bloc, child) =>
                                BrandAdditionView(
                              brandAddition: bloc.brandId ?? "BrandAddition",
                              onTap: () {
                                bloc.onChooseBrandId(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: scaleHeight(context) / 8),
                          child: Consumer<SupplierEditBloc>(
                            builder: (context, bloc, child) =>
                                CategoryButtonsView(
                              onTapCreate: () {
                                bloc.onTapCreate().then((value) {
                                  Functions.replacementTransition(
                                    context,
                                    SupplierListScreen(
                                      newScreen: true,
                                    ),
                                  );
                                }).catchError((e) {
                                  log('error: $e');
                                  Functions.replacementTransition(
                                    context,
                                    SupplierListScreen(
                                      newScreen: true,
                                    ),
                                  );
                                });
                              },
                              onTapCancel: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BrandAdditionView extends StatelessWidget {
  String brandAddition;
  Function onTap;
  BrandAdditionView({
    super.key,
    required this.brandAddition,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          brandAddition,
          style: ConfigStyle.regularStyle(FONT_MEDIUM + 5, Colors.lightGreen),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            onTap();
          },
          icon: const Icon(
            Icons.add_circle_outline,
            size: 30,
          ),
        ),
      ],
    );
  }
}
