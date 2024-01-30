import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/category_list/widgets/category_item_detail_view.dart';
import 'package:multipurpose_pos_application/view/category_list/widgets/category_title_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:multipurpose_pos_application/view/subcategory_create/screen/subcategory_create_screen.dart';

class SubCategoryListScreen extends StatelessWidget {
  const SubCategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: BUTTON_COLOR,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SubCategoryCreateScreen()));
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: WHITE_COLOR,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
        child: CommonAppBarView(
          onTapBack: () {},
          title: "Subcategory List Page",
          automaticImply: false,
        ),
      ),
      body: SingleChildScrollView(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: APP_THEME_COLOR_TWO_REDUCE,
                child: CategoryTitleView(
                  textOne: "Subcat Code",
                  textTwo: "Name",
                  textThree: "Category",
                ),
              ),
              const SizedBox(height: 3),
              SizedBox(
                height: scaleHeight(context) / 1.6,
                child: ListView.builder(
                  itemBuilder: (context, index) => CommonItemDetailView(
                    onTap: () {},
                    name: "Coco Serie",
                    unitName: "Coconut",
                    categoryCode: "C0018",
                  ),
                  itemCount: 14,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
