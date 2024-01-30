import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../RawMaterialCreate/widgets/drop_down.dart';
import '../../brand_list/screen/brand_list_screen.dart';
import '../bloc/brand_create_bloc.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';

class BrandCreateScreen extends StatelessWidget {
  const BrandCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrandCreateBloc(),
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
              title: "Brand Create Page",
              automaticImply: false,
            ),
          ),
          body: Selector<BrandCreateBloc, bool>(
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
                        Consumer<BrandCreateBloc>(
                          builder: (context, bloc, child) => DropDown(
                            selectedValue: bloc.categoryName,
                            menuTitle: "Choose Category",
                            list: bloc.categoryNameList!,
                            onChange: (value) {
                              bloc.onChooseCategoryName(value ?? "");
                            },
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<BrandCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Brand Name",
                            focusNode: bloc.firstFocusNode,
                            onChanged: (e) {
                              bloc.onChangeBrandName(e);
                            },
                            onEditingComplete: () {
                              bloc.onFirstEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<BrandCreateBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Country of origin",
                            focusNode: bloc.secondFocusNode,
                            onChanged: (e) {
                              bloc.onChangeCountryOfRegion(e);
                            },
                            onEditingComplete: () {
                              bloc.onSecondEditingComplete();
                            },
                            isBorderIncluded: true,
                            isFilled: true,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: scaleHeight(context) / 8),
                          child: Consumer<BrandCreateBloc>(
                            builder: (context, bloc, child) =>
                                CategoryButtonsView(
                              onTapCreate: () {
                                bloc.onTapCreate().then((value) {
                                  Functions.showSuccessDialog(
                                    context,
                                    scaleHeight(context) / 3,
                                    () {
                                      Navigator.of(context).pop();
                                      Functions.replacementTransition(
                                        context,
                                        BrandListScreen(),
                                      );
                                    },
                                    "New creation",
                                    "Successful",
                                  );
                                }).catchError((e) {
                                  Functions.toast(
                                      msg: "Fail to create", status: false);
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
