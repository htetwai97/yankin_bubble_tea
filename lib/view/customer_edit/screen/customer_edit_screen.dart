import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_function/functions.dart';
import '../../../data/vos/customer_vo.dart';
import '../../category_create_or_edit/widgets/category_buttons_view.dart';
import '../../customer_create/widgets/radio_for_customer_create_view.dart';
import '../../customer_list/screen/CustomerListScreen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../main_login/widgets/common_text_field_view.dart';
import '../bloc/customer_edit_bloc.dart';

class CustomerEditScreen extends StatelessWidget {
  CustomerVO? customerVO;
  CustomerEditScreen({Key? key, required this.customerVO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerEditBloc(customerVO),
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              onTapBack: () {},
              title: "Customer Edit Page",
              automaticImply: false,
            ),
          ),
          body: Selector<CustomerEditBloc, bool>(
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
                        Consumer<CustomerEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Name",
                            predefinedText: "${bloc.name}",
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
                        Consumer<CustomerEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Code",
                            predefinedText: "${bloc.customerCode}",
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
                        Consumer<CustomerEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Phone No",
                            predefinedText: "${bloc.phone}",
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
                        Consumer<CustomerEditBloc>(
                          builder: (context, bloc, child) =>
                              RadioForCustomerCreateView(
                                groupValue: bloc.taxFlag,
                            onChooseType: (value) {
                              bloc.onChooseTaxFlag(value);
                            },
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<CustomerEditBloc>(
                          builder: (context, bloc, child) => Visibility(
                            visible: bloc.taxFlag == 1,
                            child: CommonTextFieldView(
                              labelText: "Tax Percent",
                              predefinedText: "${bloc.taxPercent}",
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
                          child: Consumer<CustomerEditBloc>(
                            builder: (context, bloc, child) =>
                                CategoryButtonsView(
                              onTapCreate: () {
                                bloc.onTapEdit().then((value) {
                                  Functions.replacementTransition(
                                    context,
                                    CustomerListScreen(
                                      newScreen: true,
                                    ),
                                  );
                                }).catchError((e) {
                                  Functions.toast(
                                      msg: "Fail to edit $e", status: false);
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
