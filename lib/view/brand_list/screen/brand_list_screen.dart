import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/brand_create/screen/brand_create_screen.dart';
import 'package:multipurpose_pos_application/view/category_list/widgets/category_item_detail_view.dart';
import 'package:multipurpose_pos_application/view/category_list/widgets/category_title_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:provider/provider.dart';

import '../../../core/core_function/functions.dart';
import '../../brand_edit/screen/brand_edit_screen.dart';
import '../bloc/brand_list_bloc.dart';
import '../widgets/brand_detail_view.dart';

class BrandListScreen extends StatelessWidget {
  const BrandListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrandListBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: BUTTON_COLOR,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BrandCreateScreen()));
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
                Navigator.of(context).pop();
              },
              title: "Brand List Page",
              automaticImply: false,
            ),
          ),
          body: Selector<BrandListBloc, bool>(
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
                        top: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            color: APP_THEME_COLOR_TWO_REDUCE,
                            child: CategoryTitleView(
                              textOne: "Name",
                              textTwo: "Country of Origin",
                              textThree: "Brand Code",
                            ),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            height: scaleHeight(context) / 1.6,
                            child: Consumer<BrandListBloc>(
                              builder: (context, bloc, child) =>
                                  ListView.builder(
                                itemBuilder: (context, index) =>
                                    BrandDetailView(
                                  name: bloc.brandList?[index].name,
                                  countryOfOrigin:
                                      bloc.brandList?[index].countryOfOrigin,
                                  brandCode: bloc.brandList?[index].brandCode,
                                  onTap: () {
                                    Functions.editDialog(
                                      context,
                                      scaleHeight(context) / 3.4,
                                      () {
                                        Navigator.pop(context);
                                        Functions.rightToLeftTransition(
                                            context,
                                            BrandEditScreen(
                                              brandVO: bloc.brandList?[index],
                                            ));
                                      },
                                      () {
                                        Navigator.pop(context);
                                        Functions.toast(msg: "Cancel Editing");
                                      },
                                      "Edit Data",
                                      "Do you want to edit data?",
                                      "EDIT",
                                      "CANCEL",
                                    );
                                  },
                                ),
                                itemCount: bloc.brandList?.length,
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
