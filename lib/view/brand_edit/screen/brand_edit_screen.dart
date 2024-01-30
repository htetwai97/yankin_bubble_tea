import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/widgets/category_buttons_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../data/vos/brand_vo.dart';
import '../../RawMaterialCreate/widgets/drop_down.dart';
import '../bloc/brand_edit_bloc.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import '../../brand_list/screen/brand_list_screen.dart';

class BrandEditScreen extends StatelessWidget {
  BrandVO? brandVO;
  BrandEditScreen({Key? key, required this.brandVO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrandEditBloc(brandVO),
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
              title: "Brand Edit Page",
              automaticImply: false,
            ),
          ),
          body: Selector<BrandEditBloc, bool>(
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
                        Consumer<BrandEditBloc>(
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
                        Consumer<BrandEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Brand Name",
                            predefinedText: bloc.brandName,
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
                        Consumer<BrandEditBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            labelText: "Country of origin",
                            predefinedText: bloc.countryOfRegion,
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
                          child: Consumer<BrandEditBloc>(
                            builder: (context, bloc, child) =>
                                CategoryButtonsView(
                              text: "edit",
                              onTapCreate: () {
                                bloc.onTapEdit().then((value) {
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
                                    "update",
                                    "Successful",
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
