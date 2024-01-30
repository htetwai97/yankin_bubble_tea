import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:provider/provider.dart';
import '../../supplier_list/screen/supplier_list_screen.dart';
import '../bloc/supplier_create_bloc.dart';

class SupplierCreateScreen extends StatelessWidget {
  const SupplierCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupplierCreateBloc(),
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
              title: "New Supplier Page",
              automaticImply: false,
            ),
          ),
          body: Selector<SupplierCreateBloc, bool>(
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
                        Consumer<SupplierCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Name",
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
                        Consumer<SupplierCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "address",
                            focusNode: bloc.secondFocusNode,
                            onChanged: (e) {
                              bloc.onChangeSupplierAddress(e);
                            },
                            onEditingComplete: () {
                              bloc.onSecondEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<SupplierCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Phone No",
                            focusNode: bloc.thirdFocusNode,
                            numberOnly: true,
                            onChanged: (e) {
                              bloc.onChangeSupplierPhone(e);
                            },
                            onEditingComplete: () {
                              bloc.onThirdEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<SupplierCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "email",
                            focusNode: bloc.fourthFocusNode,
                            onChanged: (e) {
                              bloc.onChangeSupplierEmail(e);
                            },
                            onEditingComplete: () {
                              bloc.onFourthEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<SupplierCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Credit Limit Amount",
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
                        Consumer<SupplierCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Repayment Period(Week Count)",
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
                          child: Consumer<SupplierCreateBloc>(
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
                          child: Consumer<SupplierCreateBloc>(
                            builder: (context, bloc, child) =>
                                CategoryButtonsView(
                              onTapCreate: () {
                                bloc.onTapCreate().then((value) {
                                  Functions.showSuccessDialog(
                                    context,
                                    scaleHeight(context) / 3,
                                    () {
                                      Functions.replacementTransition(
                                        context,
                                        SupplierListScreen(
                                          newScreen: true,
                                        ),
                                      );
                                    },
                                    "New supplier creation",
                                    "Successful",
                                  );
                                }).catchError((e) {
                                  log('error: $e');
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
