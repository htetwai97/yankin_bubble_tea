import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/view/voucher_detail/screen/voucher_print_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';
import '../../../core/core_function/functions.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../bloc/voucher_detail_bloc.dart';
import '../widgets/voucher_item_view.dart';
import 'voucher_print_screen.dart';

class VoucherDetailScreen extends StatelessWidget {
  int? voucherId;

  VoucherDetailScreen({Key? key, required this.voucherId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VoucherDetailBloc(voucherId, false),
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
              title: "Voucher Detail Page",
            ),
          ),
          body: Selector<VoucherDetailBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => Stack(
              children: [
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  SingleChildScrollView(
                    child: Consumer<VoucherDetailBloc>(
                      builder: (context, bloc, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: scaleWidth(context) / 40),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Yankinbubbletea",
                                    style: ConfigStyle.boldStyle(
                                        FONT_LARGE, BLACK_HEAVY),
                                  ),
                                  SizedBox(width: scaleHeight(context) / 2.5),
                                  Row(
                                    children: [
                                      Text(
                                        "print",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 2, APP_THEME_COLOR),
                                      ),
                                      SizedBox(
                                          width: scaleHeight(context) / 30),
                                      InkWell(
                                        onTap: () {
                                          Functions.rightToLeftTransition(
                                              context,
                                              VoucherPrintScreen(
                                                  voucherId: voucherId));
                                        },
                                        child: const Icon(Icons.print,
                                            color: BLACK_HEAVY, size: 28),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: scaleHeight(context) / 4),
                                ]),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "Yankin Road, Yankin Township, Yangon Myanmar\n09-441254888",
                                  style: ConfigStyle.boldStyle(
                                      FONT_LARGE - 4, BLACK_LIGHT),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "VoucherNo : ${bloc.voucherNumber}",
                                  style: ConfigStyle.boldStyle(
                                      FONT_LARGE - 6, BLACK_LIGHT),
                                ),
                                SizedBox(width: scaleHeight(context) / 2),
                                Text(
                                  "Date : ${bloc.date}",
                                  style: ConfigStyle.boldStyle(
                                      FONT_LARGE - 6, BLACK_LIGHT),
                                ),
                              ]),
                          ListView.builder(
                            padding: EdgeInsets.only(
                                left: scaleWidth(context) / 22,
                                right: scaleWidth(context) / 22,
                                top: scaleHeight(context) / 12,
                                bottom: scaleHeight(context) / 12),
                            itemBuilder: (context, index) =>
                                VoucherItemView(
                                  toppingList: bloc.voucherData?[index].popingList??[],
                              index: index + 1,
                              name: bloc.voucherData?[index].name ?? " ",
                              orderQuantity:
                                  bloc.voucherData?[index].orderQty ?? 1,
                              totalPrice:
                                  bloc.voucherData?[index].sellingPrice ??
                                      0,
                              size: bloc.voucherData?[index].size ?? " ",
                            ),
                            itemCount: bloc.voucherData?.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: scaleWidth(context) / 6,
                                right: scaleWidth(context) / 6,
                                bottom: scaleHeight(context) / 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Customer Name",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 4, BLACK_LIGHT)),
                                    Text(bloc.customerName ?? "walk in",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 6, BLACK_LIGHT))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Customer Tax",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 4, BLACK_LIGHT)),
                                    Text(
                                        bloc.customerTax != null
                                            ? "${bloc.customerTax}"
                                            : "zero",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 6, BLACK_LIGHT))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tax amount",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 4, BLACK_LIGHT)),
                                    Text(
                                        bloc.taxAmount != null
                                            ? "${bloc.taxAmount}"
                                            : "zero",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 6, BLACK_LIGHT))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Cash Back",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 4, BLACK_LIGHT)),
                                    Text(
                                        bloc.cashback != null
                                            ? "${bloc.cashback}"
                                            : "zero",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 6, BLACK_LIGHT))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Discount",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 4, BLACK_LIGHT)),
                                    Text(
                                        bloc.discount != null
                                            ? "${bloc.discount}"
                                            : "zero",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 6, BLACK_LIGHT))
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Sub Total",
                                          style: ConfigStyle.boldStyle(
                                              FONT_LARGE - 4, BLACK_LIGHT)),
                                      Text(
                                          bloc.total != null
                                              ? "${bloc.total}"
                                              : "0",
                                          style: ConfigStyle.boldStyle(
                                              FONT_LARGE - 6, BLACK_LIGHT))
                                    ]),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Voucher Grand Total",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 4, BLACK_LIGHT)),
                                    Text(
                                        bloc.voucherGrandTotal != null
                                            ? "${bloc.voucherGrandTotal}"
                                            : "0",
                                        style: ConfigStyle.boldStyle(
                                            FONT_LARGE - 6, BLACK_LIGHT))
                                  ],
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
