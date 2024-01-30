import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/common_app_bar_view.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_style.dart';
import '../../../data/vos/product_vo.dart';
import '../../product_list/widgets/avatar_and_name_for_product_view.dart';
import '../bloc/product_detail_bloc.dart';
import '../widgets/product_image_view.dart';
import '../widgets/ingredient_view.dart';
import '../widgets/size_item_view.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductVO? productVO;
  ProductDetailScreen({Key? key, required this.productVO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailBloc(productVO),
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                Navigator.pop(context);
              },
              title: "Product Detail Page",
            ),
          ),
          body: Selector<ProductDetailBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => Stack(
              children: [
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  SingleChildScrollView(
                    child: Consumer<ProductDetailBloc>(
                      builder: (context, bloc, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: scaleHeight(context) / 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: scaleWidth(context) / 16,
                                top: scaleHeight(context) / 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProductImageView(
                                  name: bloc.productName!,
                                  url: bloc.productUrl!,
                                ),
                                SizedBox(height: scaleHeight(context) / 20),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Option List",
                                  style: ConfigStyle.boldStyle(
                                      FONT_MEDIUM + 6, BLACK_LIGHT),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: scaleWidth(context) / 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: scaleWidth(context) / 10,
                              top: scaleWidth(context) / 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "Size List",
                                  style: ConfigStyle.boldStyle(
                                      FONT_MEDIUM + 6, APP_THEME_COLOR),
                                ),
                                SizedBox(
                                  height: scaleHeight(context) / 20,
                                ),
                                SizedBox(
                                  width: scaleWidth(context) / 2.2,
                                  height: scaleHeight(context) / 1.5,
                                  child: Consumer<ProductDetailBloc>(
                                    builder: (context, bloc, child) =>
                                        ListView.builder(
                                      itemBuilder: (context, index) =>
                                          SizeItemView(
                                        sizeOfIngredient: bloc.sizeList?[index],
                                      ),
                                      itemCount: bloc.sizeList?.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: const BouncingScrollPhysics(),
                                    ),
                                  ),
                                ),
                              ],
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
