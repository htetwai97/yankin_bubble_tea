import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:multipurpose_pos_application/view/sale/bloc/sale_bloc.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/item_detail_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/option_selection_dialog_view.dart';
import 'package:multipurpose_pos_application/view/sale/widgets/radio_for_receive_view.dart';
import 'package:provider/provider.dart';

class SaleFirstHalfScreenView extends StatelessWidget {
  const SaleFirstHalfScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: scaleWidth(context) / 2,
      child: Column(
        children: [
          Consumer<SaleBloc>(
            builder: (context, bloc, child) => CommonTextFieldView(
              focusNode: bloc.focusNode,
              onEditingComplete: () {
                bloc.onEditingComplete();
              },
              labelText: "Search",
              onChanged: (search) {
                bloc.onChangeTextField(search);
              },
              visibleSearch: true,
            ),
          ),
          Consumer<SaleBloc>(
            builder: (context, bloc, child) => RadioForReceiveView(
              groupValue: bloc.radioValue,
              onChooseType: (value) {
                bloc.onChooseRadio(value);
              },
            ),
          ),
          Consumer<SaleBloc>(
            builder: (context, bloc, child) => SizedBox(
              height: scaleHeight(context) / 1.5,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,

                  ///mainAxisExtent: scaleHeight(context) / 1.6,
                  ///mainAxisExtent: scaleHeight(context) / 2,
                ),
                itemBuilder: (context, index) {
                  var product = bloc.productList?[index];
                  String size = product?.sizeOfIngredient?[0].size ?? "";
                  String sellPrice =
                      product?.sizeOfIngredient?[0].sellPrice.toString() ?? "";
                  String deliPrice =
                      product?.sizeOfIngredient?[0].deliPrice.toString() ?? "";
                  return ItemDetailView(
                    optionName: product?.optionName ?? "Option",
                    size: size,
                    price: (bloc.radioValue == 1) ? sellPrice : deliPrice,
                    itemName: product?.name ?? "",
                    onTapAdd: () {
                      bloc.onTapAddProduct(product);
                    },
                    onTapOption: () {
                      bloc.onTapOption(product).then((value) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return OptionSelectionDialogView(
                                optionList: value?.optionList ?? [],
                                onTapCross: () {
                                  bloc.onTapCrossOption(index);
                                  Navigator.pop(context);
                                },
                                onTapOK: () {
                                  Navigator.pop(context);
                                },
                                onChooseType: (optionId, optionName) {
                                  bloc.onChooseOption(optionId, optionName,
                                      value?.optionList, index);
                                },
                              );
                            });
                      });
                    },
                    //url: product?.photo ?? "",
                    url: "assets/images/bubbletealogo.jpg",
                  );
                },
                itemCount: bloc.productList?.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
