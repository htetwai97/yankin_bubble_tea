import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/bloc/category_create_or_edit_bloc.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/radio_for_category_create_view.dart';
import 'package:multipurpose_pos_application/view/category_list/screen/category_list_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:provider/provider.dart';

class CategoryCreateOrEditScreen extends StatelessWidget {
  bool create;
  CategoryVO? categoryVO;

  CategoryCreateOrEditScreen(
      {Key? key, required this.categoryVO, required this.create})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryCreateOrEditBloc(categoryVO),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
          child: CommonAppBarView(
            onTapBack: () {},
            title: create ? "Category Create Page" : "Category Edit Page",
            automaticImply: false,
            isEnableBack: true,
          ),
        ),
        body: Selector<CategoryCreateOrEditBloc, bool>(
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
                      Consumer<CategoryCreateOrEditBloc>(
                        builder: (context, bloc, child) => CommonTextFieldView(
                          labelText: "Category Name",
                          predefinedText: bloc.name ?? "",
                          focusNode: bloc.firstFocusNode,
                          onChanged: (e) {
                            bloc.onChangeCategoryName(e);
                          },
                          onEditingComplete: () {
                            bloc.onFirstEditingComplete();
                          },
                          isBorderIncluded: true,
                          isFilled: true,
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 30),
                      Consumer<CategoryCreateOrEditBloc>(
                        builder: (context, bloc, child) => CommonTextFieldView(
                          labelText: "Unit Name",
                          predefinedText: bloc.unit ?? "",
                          focusNode: bloc.secondFocusNode,
                          onChanged: (e) {
                            bloc.onChangeCategoryUnit(e);
                          },
                          onEditingComplete: () {
                            bloc.onSecondEditingComplete();
                          },
                          isBorderIncluded: true,
                          isFilled: true,
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 40),
                      Consumer<CategoryCreateOrEditBloc>(
                        builder: (context, bloc, child) =>
                            RadioForCategoryCreateView(
                          onChooseType: (value) {
                            bloc.onChooseType(value);
                          },
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 40),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: scaleHeight(context) / 8),
                        child: Consumer<CategoryCreateOrEditBloc>(
                          builder: (context, bloc, child) =>
                              CategoryButtonsView(
                            onTapCreate: () {
                              bloc.onTapCreate(create).then((value) {
                                Functions.showSuccessDialog(
                                  context,
                                  scaleHeight(context) / 3,
                                  () {
                                    Functions.replacementTransition(
                                      context,
                                      CategoryListScreen(
                                        newScreen: true,
                                      ),
                                    );
                                  },
                                  "New category creation",
                                  "Successful",
                                );
                              }).catchError((e) {
                                Functions.toast(
                                    msg: "Fail to add category $e", status: false);
                              });
                            },
                            onTapCancel: () {},
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
    );
  }
}
