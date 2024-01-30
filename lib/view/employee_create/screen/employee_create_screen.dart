import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import '../../../core/core_config/config_color.dart';
import '../../employee_list/screen/employee_list_screen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../main_login/widgets/common_text_field_view.dart';
import '../bloc/employee_create_bloc.dart';
import 'package:multipurpose_pos_application/view/employee_create/widgets/employee_profile_view.dart';

class EmployeeCreateScreen extends StatelessWidget {
  const EmployeeCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeCreateBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              onTapBack: () {
                Navigator.of(context).pop();
              },
              isEnableBack: true,
              title: "New Employee Page",
              automaticImply: false,
            ),
          ),
          body: Selector<EmployeeCreateBloc, bool>(
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
                        Consumer<EmployeeCreateBloc>(
                          builder: (context, bloc, child) =>
                              EmployeeProfileView(
                            pickImage: () {
                              bloc.pickImage();
                            },
                            image: bloc.getImage(),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<EmployeeCreateBloc>(
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
                        Consumer<EmployeeCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Phone No",
                            focusNode: bloc.secondFocusNode,
                            numberOnly: true,
                            onChanged: (e) {
                              bloc.onChangePhone(e);
                            },
                            onEditingComplete: () {
                              bloc.onSecondEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<EmployeeCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Address",
                            focusNode: bloc.thirdFocusNode,
                            onChanged: (e) {
                              bloc.onChangeAddress(e);
                            },
                            onEditingComplete: () {
                              bloc.onThirdEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<EmployeeCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Email",
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
                        SizedBox(height: scaleHeight(context) / 40),
                        Consumer<EmployeeCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Password",
                            focusNode: bloc.fifthFocusNode,
                            onChanged: (e) {
                              bloc.onChangePassword(e);
                            },
                            onEditingComplete: () {
                              bloc.onFifthEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 40),
                        Consumer<EmployeeCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "NRC Number",
                            focusNode: bloc.sixthFocusNode,
                            numberOnly: true,
                            onChanged: (e) {
                              bloc.onChangeNrcNumber(e);
                            },
                            onEditingComplete: () {
                              bloc.onSixthEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 40),
                        Consumer<EmployeeCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Salary",
                            focusNode: bloc.seventhFocusNode,
                            numberOnly: true,
                            onChanged: (e) {
                              bloc.onChangeSalary(int.parse(e));
                            },
                            onEditingComplete: () {
                              bloc.onSeventhEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: scaleHeight(context) / 8),
                          child: Consumer<EmployeeCreateBloc>(
                            builder: (context, bloc, child) =>
                                CategoryButtonsView(
                              onTapCreate: () {
                                bloc.onTapCreate().then((value) {
                                  Functions.replacementTransition(
                                    context,
                                    EmployeeListScreen(
                                      newScreen: true,
                                    ),
                                  );
                                }).catchError((e) {
                                  log('error: $e');
                                  Functions.replacementTransition(
                                    context,
                                    EmployeeListScreen(
                                      newScreen: true,
                                    ),
                                  );
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
