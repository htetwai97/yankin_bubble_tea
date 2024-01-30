import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../customer_list/screen/CustomerListScreen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../main_login/widgets/common_text_field_view.dart';
import '../bloc/customer_create_bloc.dart';
import '../widgets/radio_for_customer_create_view.dart';

class CustomerCreateScreen extends StatelessWidget {
  const CustomerCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerCreateBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                Navigator.of(context).pop();
              },
              title: "Customer Create Page",
              automaticImply: false,
            ),
          ),
          body: Selector<CustomerCreateBloc, bool>(
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
                        Consumer<CustomerCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Name",
                            focusNode: bloc.firstFocusNode,
                            onChanged: (e) {
                              bloc.onChangeName(e);
                            },
                            onEditingComplete: () {
                              bloc.onFirstEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<CustomerCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Code",
                            focusNode: bloc.secondFocusNode,
                            onChanged: (e) {
                              bloc.onChangeCustomerCode(e);
                            },
                            onEditingComplete: () {
                              bloc.onSecondEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<CustomerCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Phone No",
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
                        SizedBox(height: scaleHeight(context) / 40),
                        Consumer<CustomerCreateBloc>(
                          builder: (context, bloc, child) =>
                              RadioForCustomerCreateView(
                            groupValue: bloc.taxFlag,
                            onChooseType: (value) {
                              bloc.onChooseTaxFlag(value);
                            },
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<CustomerCreateBloc>(
                          builder: (context, bloc, child) => Visibility(
                            visible: bloc.taxFlag == 1,
                            child: CommonTextFieldView(
                              labelText: "Tax Percent",
                              focusNode: bloc.fourthFocusNode,
                              onChanged: (e) {
                                bloc.onChooseTaxPercent(int.parse(e));
                              },
                              onEditingComplete: () {
                                bloc.onFourthEditingComplete();
                              },
                              isBorderIncluded: true,
                              isFilled: true,
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 40),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: scaleHeight(context) / 8),
                          child: Consumer<CustomerCreateBloc>(
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
                                        CustomerListScreen(
                                          newScreen: true,
                                        ),
                                      );
                                    },
                                    "New customer creation",
                                    "Successful",
                                  );
                                }).catchError((e) {
                                  Functions.toast(
                                      msg: "Fail to add customer",
                                      status: false);
                                });
                              },
                              onTapCancel: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isLoading,
                  child: SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? APP_THEME_COLOR_REDUCE
                              : CARD_FIRST_COLOR,
                        ),
                      );
                    },
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
