// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/sale/bloc/sale_bloc.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/sale_first_half_screen_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/sale_second_half_screen_view.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/screen/sale_and_history_screen.dart';
import 'package:provider/provider.dart';

class SaleScreen extends StatelessWidget {
  bool newScreen;
  SaleScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SaleBloc(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
          child: CommonAppBarView(
            onTapBack: () {
              if (newScreen) {
                Functions.replacementTransition(
                    context, const SaleAndHistoryScreen());
              } else {
                Navigator.pop(context);
              }
            },
            title: "Sale Page",
            automaticImply: false,
            isEnableBack: true,
          ),
        ),
        body: Selector<SaleBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Selector<SaleBloc, bool>(
                  selector: (context, bloc) => bloc.isApiCalling,
                  builder: (context, isApiCalling, child) => Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SaleFirstHalfScreenView(),
                            SaleSecondHalfScreenView(),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isApiCalling,
                        child: Center(
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
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
