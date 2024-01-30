import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_function/functions.dart';
import '../../../data/vos/employee_vo.dart';
import '../../category_create_or_edit/widgets/category_buttons_view.dart';
import '../../employee_create/widgets/employee_profile_view.dart';
import '../../employee_list/screen/employee_list_screen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/product_create/widgets/image_picking_box_view.dart';
import '../bloc/employee_edit_bloc.dart';

class EmployeeEditScreen extends StatelessWidget {
  EmployeeVO? employeeVO;
  EmployeeEditScreen({Key? key, required EmployeeVO? this.employeeVO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeEditBloc(employeeVO),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                //Navigator.pop(context);
                Functions.replacementTransition(
                  context,
                  EmployeeListScreen(
                    newScreen: true,
                  ),
                );
              },
              title: "Employee Edit Page",
            ),
          ),
          body: Selector<EmployeeEditBloc, bool>(
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
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              ImagePickingBoxView(
                            file: bloc.getImage(),
                            url:
                                "http://yankinbubbletea.kwintechnologykw11.com/image/product/${bloc.url}",
                            onTapImagePicker: () async {
                              final ImagePicker imagePicker = ImagePicker();
                              final XFile? image = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                bloc.onChangeFile(File(image.path));
                              }
                            },
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Name",
                            predefinedText: bloc.name ?? "",
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
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Phone No",
                            predefinedText: bloc.phone ?? "",
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
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Address",
                            predefinedText: bloc.address ?? "",
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
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Email",
                            predefinedText: bloc.email ?? "",
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
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Password",
                            predefinedText: bloc.password ?? "",
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
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "NRC Number",
                            predefinedText: bloc.nrcNumber ?? "",
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
                        Consumer<EmployeeEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Salary",
                            predefinedText: bloc.salary.toString(),
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
                          child: Consumer<EmployeeEditBloc>(
                            builder: (context, bloc, child) =>
                                CategoryButtonsView(
                              onTapCreate: () {
                                bloc.onTapEdit().then((value) {
                                  Navigator.pop(context);
                                  Functions.replacementTransition(
                                    context,
                                    EmployeeListScreen(
                                      newScreen: true,
                                    ),
                                  );
                                }).catchError((e) {
                                  Functions.toast(
                                      msg: "error: $e", status: false);
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
                              text: "Edit",
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
