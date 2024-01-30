import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';
import '../../../core/core_function/functions.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../../main_login/widgets/common_text_field_view.dart';
import '../../sale_and_history/screen/sale_and_history_screen.dart';
import '../../voucher_detail/screen/voucher_detail_screen.dart';
import '../../voucher_detail/screen/voucher_print_screen.dart';
import '../bloc/voucher_history_bloc.dart';
import '../widgets/customer_name_text_field.dart';
import '../widgets/date_pick_view.dart';
import '../widgets/drop_down_view.dart';
import '../widgets/voucher_summary_view.dart';

class VoucherHistoryScreen extends StatelessWidget {
  bool newScreen;
  VoucherHistoryScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VoucherHistoryBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              isEnableBack: true,
              onTapBack: () {
                if (newScreen) {
                  Functions.replacementTransition(
                      context, const SaleAndHistoryScreen());
                } else {
                  Navigator.pop(context);
                }
              },
              title: "Voucher History Page",
            ),
          ),
          body: Selector<VoucherHistoryBloc, bool>(
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
                      padding: EdgeInsets.only(top: scaleHeight(context) / 15),
                      child: Consumer<VoucherHistoryBloc>(
                        builder: (context, bloc, child) => Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: scaleWidth(context) / 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DatePickView(
                                    dateName: bloc.startDate ?? "Start Date",
                                    onTapDateIcon: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null) {
                                        bloc.onStartDatePick(picked);
                                        // bloc.setDate = picked;
                                        // final formatter =
                                        //     DateFormat('yyyy-MM-dd');
                                        // bloc.startDate =
                                        //     formatter.format(bloc.getDate);
                                        // bloc.notifyListeners();
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: scaleHeight(context) / 30,
                                        top: scaleHeight(context) / 30,
                                        bottom: scaleHeight(context) / 30),
                                    child: Icon(Icons.arrow_forward_sharp),
                                  ),
                                  DatePickView(
                                      dateName: bloc.endDate ?? "End Date",
                                      onTapDateIcon: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2023),
                                          lastDate: DateTime(2101),
                                        );
                                        if (picked != null) {
                                          bloc.onEndDatePick(picked);
                                          // bloc.setDate = picked;
                                          // final formatter =
                                          //     DateFormat('yyyy-MM-dd');
                                          // bloc.endDate =
                                          //     formatter.format(bloc.getDate);
                                          // bloc.notifyListeners();
                                        }
                                      }),
                                  IconButton(
                                      onPressed: () => bloc.onQueryByDate(),
                                      icon: Icon(Icons.search)),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: scaleWidth(context) / 3,
                                  height: scaleHeight(context) / 9,
                                  child: DropDownView(
                                    selectedValue: bloc.customerName,
                                    menuTitle: "Customer Name",
                                    list: bloc.customerNameList,
                                    onChange: (value) {
                                      bloc.onChangedCustomerName(value ?? "");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: scaleWidth(context) / 10),
                                  child: Text(
                                    bloc.displayTotalPrice(),
                                    style: ConfigStyle.boldStyle(
                                        FONT_LARGE - 4, BLACK_LIGHT),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: scaleHeight(context) * 0.55,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: scaleWidth(context) / 12,
                                    vertical: scaleHeight(context) / 15),
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      VoucherSummaryView(
                                    voucherNo: bloc.voucherList?[index].id ?? 0,
                                    totalPrice: bloc.voucherList?[index]
                                            .voucherGrandTotal ??
                                        0,
                                    date: bloc.voucherList?[index].date ?? "",
                                    onTapDetail: () {
                                      Functions.rightToLeftTransition(
                                          context,
                                          VoucherDetailScreen(
                                              voucherId:
                                                  bloc.voucherList![index].id));
                                    },
                                    onTapDeleteIcon: () {
                                      bloc.deleteVoucher(
                                          index, bloc.voucherList![index].id!);
                                    },
                                  ),
                                  itemCount: bloc.voucherList?.length,
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
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
