import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_function/functions.dart';
import '../../Admin/screen/admin_screen.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../promotion_create/screen/promotion_create_screen.dart';
import '../../promotion_edit/screen/promotion_edit_screen.dart';
import '../bloc/promotion_list_bloc.dart';
import '../widgets/promotion_detail_view.dart';
import '../widgets/promotion_title_view.dart';

class PromotionListScreen extends StatelessWidget {
  bool newScreen;
  PromotionListScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PromotionListBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: BUTTON_COLOR,
            onPressed: () {
              Functions.rightToLeftTransition(context, PromotionCreateScreen());
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: WHITE_COLOR,
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                if (newScreen) {
                  Functions.replacementTransition(context, const AdminScreen());
                } else {
                  Navigator.pop(context);
                }
              },
              title: "Promotion List Page",
            ),
          ),
          body: Selector<PromotionListBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => Stack(
              children: [
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: scaleWidth(context) / 5,
                        right: scaleWidth(context) / 5,
                        top: 6,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: APP_THEME_COLOR_TWO_REDUCE,
                            ),
                            child: PromotionTitleView(),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            height: scaleHeight(context) / 1.6,
                            child: Consumer<PromotionListBloc>(
                              builder: (context, bloc, child) =>
                                  ListView.builder(
                                itemBuilder: (context, index) =>
                                    PromotionDetailView(
                                  name: bloc.promotionList?[index].name ?? "",
                                  discountPercent: bloc.promotionList?[index]
                                          .discountPercent ??
                                      0,
                                  promotionPeriodFrom: bloc
                                          .promotionList?[index]
                                          .promotionPeriodFrom ??
                                      "",
                                  promotionPeriodTo: bloc.promotionList?[index]
                                          .promotionPeriodTo ??
                                      "",
                                  onTap: () {
                                    Functions.editDialog(
                                        context, scaleHeight(context) / 3.4,
                                        () {
                                      Navigator.pop(context);
                                      Functions.rightToLeftTransition(
                                          context,
                                          PromotionEditScreen(
                                            promotionVO:
                                                bloc.promotionList?[index],
                                          ));
                                    }, () {
                                      Navigator.pop(context);
                                      Functions.toast(msg: "Cancel Editing");
                                    }, "Edit Data", "Do you want to edit data?",
                                        "EDIT", "CANCEL");
                                  },
                                ),
                                itemCount: bloc.promotionList?.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                              ),
                            ),
                          ),
                        ],
                      ),
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
