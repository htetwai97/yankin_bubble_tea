// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/category_create_or_edit/screen/category_create_or_edit_screen.dart';
import 'package:multipurpose_pos_application/view/category_list/bloc/category_list_bloc.dart';
import 'package:multipurpose_pos_application/view/category_list/widgets/category_item_detail_view.dart';
import 'package:multipurpose_pos_application/view/category_list/widgets/category_title_view.dart';
import 'package:multipurpose_pos_application/view/inventory/screen/inventory_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatelessWidget {
  bool newScreen;
  CategoryListScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryListBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: BUTTON_COLOR,
          onPressed: () {
            Functions.rightToLeftTransition(
                context,
                CategoryCreateOrEditScreen(
                  categoryVO: null,
                  create: true,
                ));
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
                Functions.replacementTransition(
                    context, const InventoryScreen());
              } else {
                Navigator.pop(context);
              }
            },
            title: "Category List Page",
          ),
        ),
        body: Selector<CategoryListBloc, bool>(
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
                          child: CategoryTitleView(),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          height: scaleHeight(context) / 1.6,
                          child: Consumer<CategoryListBloc>(
                            builder: (context, bloc, child) => ListView.builder(
                              itemBuilder: (context, index) =>
                                  CommonItemDetailView(
                                name: bloc.categoryList?[index].name ?? "",
                                unitName: bloc.categoryList?[index].unit ?? "",
                                categoryCode:
                                    bloc.categoryList?[index].categoryCode ??
                                        "",
                                onTap: () {
                                  Functions.editDialog(
                                    context,
                                    scaleHeight(context) / 3.4,
                                    () {
                                      Navigator.pop(context);
                                      Functions.rightToLeftTransition(
                                          context,
                                          CategoryCreateOrEditScreen(
                                            categoryVO:
                                                bloc.categoryList?[index],
                                            create: false,
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
                              itemCount: bloc.categoryList?.length,
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
    );
  }
}
