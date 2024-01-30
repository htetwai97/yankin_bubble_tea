import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';
import '../../../core/core_function/functions.dart';
import '../../../data/vos/promotion_vo.dart';
import '../../category_create_or_edit/widgets/category_buttons_view.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../main_login/widgets/common_text_field_view.dart';
import '../../promotion_create/widgets/promotion_date_pick_view.dart';
import '../../promotion_create/widgets/radio_for_promotion_create_view.dart';
import '../../promotion_list/screen/promotion_list_screen.dart';
import '../../voucher_history/widgets/drop_down_view.dart';
import '../bloc/promotion_edit_bloc.dart';

class PromotionEditScreen extends StatelessWidget {
  PromotionVO? promotionVO;
  PromotionEditScreen({Key? key, this.promotionVO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PromotionEditBloc(promotionVO),
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
              title: "Promotion Edit Page",
              automaticImply: false,
            ),
          ),
          body: Selector<PromotionEditBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleHeight(context) / 3),
                    child: Consumer<PromotionEditBloc>(
                      builder: (context, bloc, child) => Column(
                        children: [
                          SizedBox(height: scaleHeight(context) / 20),
                          Consumer<PromotionEditBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                              labelText: "Name",
                              predefinedText: bloc.name,
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
                          SizedBox(height: scaleHeight(context) / 16),
                          Consumer<PromotionEditBloc>(
                            builder: (context, bloc, child) =>
                                RadioForPromotionCreateView(
                              onChooseType: (value) {
                                bloc.onChooseTaxFlag(value);
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          Consumer<PromotionEditBloc>(
                            builder: (context, bloc, child) => Stack(
                              children: [
                                Visibility(
                                  visible: bloc.taxFlag == 1,
                                  child: CommonTextFieldView(
                                    labelText: "Amount",
                                    predefinedText: "${bloc.cashbackAmount}",
                                    numberOnly: true,
                                    focusNode: bloc.secondFocusNode,
                                    onChanged: (e) {
                                      int amount = int.parse(e);
                                      bloc.onChangeAmount(amount);
                                    },
                                    onEditingComplete: () {
                                      bloc.onSecondEditingComplete();
                                    },
                                    isBorderIncluded: true,
                                    isFilled: true,
                                  ),
                                ),
                                Visibility(
                                  visible: bloc.taxFlag == 2,
                                  child: DropDownView(
                                    selectedValue: bloc.focItem,
                                    menuTitle: "Choose Product",
                                    list: bloc.productNameList,
                                    onChange: (value) {
                                      bloc.onChooseFocItem(value ?? "");
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: bloc.taxFlag == 3,
                                  child: CommonTextFieldView(
                                    labelText: "Percentage",
                                    predefinedText: "${bloc.discountPercent}",
                                    numberOnly: true,
                                    focusNode: bloc.secondFocusNode,
                                    onChanged: (e) {
                                      int percentage = int.parse(e);
                                      bloc.onChangeDiscountPercent(percentage);
                                    },
                                    onEditingComplete: () {
                                      bloc.onSecondEditingComplete();
                                    },
                                    isBorderIncluded: true,
                                    isFilled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Promotion Period",
                                style: ConfigStyle.regularStyle(
                                    FONT_MEDIUM + 3, BLACK_HEAVY),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              PromotionDatePickView(
                                dateName:
                                    bloc.promotionPeriodFrom ?? "Start Date",
                                onTapDateIcon: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2023, 3),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    bloc.setDate = picked;
                                    final formatter = DateFormat('yyyy-MM-dd');
                                    bloc.promotionPeriodFrom =
                                        formatter.format(bloc.getDate);
                                    bloc.notifySafely();
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: scaleHeight(context) / 10),
                                child: const Icon(Icons.arrow_forward_sharp),
                              ),
                              PromotionDatePickView(
                                  dateName:
                                      bloc.promotionPeriodTo ?? "End Date",
                                  onTapDateIcon: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023, 3),
                                      lastDate: DateTime(2101),
                                    );
                                    if (picked != null) {
                                      bloc.setDate = picked;
                                      final formatter =
                                          DateFormat('yyyy-MM-dd');
                                      bloc.promotionPeriodTo =
                                          formatter.format(bloc.getDate);
                                      bloc.notifySafely();
                                    }
                                  }),
                            ],
                          ),
                          SizedBox(height: scaleHeight(context) / 50),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: scaleHeight(context) / 8),
                            child: Consumer<PromotionEditBloc>(
                              builder: (context, bloc, child) =>
                                  CategoryButtonsView(
                                onTapCreate: () {
                                  bloc.onTapEdit().then((value) {
                                    Functions.showSuccessDialog(
                                      context,
                                      scaleHeight(context) / 3,
                                      () {
                                        Functions.replacementTransition(
                                          context,
                                          PromotionListScreen(
                                            newScreen: true,
                                          ),
                                        );
                                      },
                                      "promotion editing",
                                      "Successful",
                                    );
                                  }).catchError((e) {
                                    Functions.toast(
                                        msg: "Fail to edit promotion",
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
