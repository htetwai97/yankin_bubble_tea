import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multipurpose_pos_application/data/vos/customer_vo.dart';

import '../../../core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/request_delete_voucher.dart';
import '../../../data/vos/voucher_start_and_end_date_vo.dart';
import '../../../data/vos/voucher_vo.dart';

class VoucherHistoryBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Screen states
  List<VoucherVO>? voucherList = [];
  List<VoucherVO>? filterByCustomerNameList = [];
  int? index;
  String? startDate;
  String? endDate;
  String? queryDate;
  DateTime? _date;
  int? totalPrice = 0;
  String? customerName;
  List<CustomerVO>? customerList = [];
  List<String> customerNameList = [];

  FocusNode focusNode = FocusNode();

  VoucherHistoryBloc() {
    _showLoading();
    _multiPosRepoModel.postCustomerListResponse().then((response) {
      customerList = response.customers;
      customerList?.sort((a, b) => b.id!.compareTo(a.id!));
      customerNameList = customerList?.map((e) => e.name ?? "").toList() ?? [];
      _notifySafely();
    });

    DateTime now = DateTime.now();
    this._date = now;
    final formatter = DateFormat('yyyy-MM-dd');
    startDate = formatter.format(_date!);
    endDate = formatter.format(_date!);

    VoucherStartAndEndDateVO voucherStartAndEndDateVO =
        VoucherStartAndEndDateVO(startDate: startDate, endDate: endDate);
    _multiPosRepoModel
        .postVoucherHistoryResponse(voucherStartAndEndDateVO)
        .then((response) {
      voucherList = response.vouchers;
      voucherList?.sort((a, b) => b.id!.compareTo(a.id!));

      for (var i = 0; i < voucherList!.length; i++) {
        int temp = voucherList![i].voucherGrandTotal ?? 0;
        totalPrice = totalPrice! + temp;
      }
      _notifySafely();
      _hideLoading();
    });
  }

  void onStartDatePick(DateTime dateTime) async {
    this._date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    startDate = formatter.format(_date!);
    _notifySafely();
  }

  void onEndDatePick(DateTime dateTime) async {
    this._date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    endDate = formatter.format(_date!);
    _notifySafely();
  }

  void onQueryByDate() {
    //Functions.toast(msg: "$startDate $endDate");
    if ((startDate != null) && (endDate != null)) {
      _showLoading();
      VoucherStartAndEndDateVO voucherStartAndEndDateVO =
          VoucherStartAndEndDateVO(startDate: startDate, endDate: endDate);
      _multiPosRepoModel
          .postVoucherHistoryResponse(voucherStartAndEndDateVO)
          .then((response) {
        voucherList = response.vouchers;
        voucherList?.sort((a, b) => b.id!.compareTo(a.id!));

        if (customerName != null) {
          filterByCustomerName();
        }

        totalPrice = 0;

        for (var i = 0; i < voucherList!.length; i++) {
          int temp = voucherList![i].voucherGrandTotal ?? 0;
          totalPrice = totalPrice! + temp;
        }
        Functions.toast(msg: "${response.message}");

        _notifySafely();
      }).onError((error, stackTrace) => Functions.toast(msg: "${error}"));
      _hideLoading();
    } else {
      Functions.toast(msg: "dates must be picked first", status: false);
    }

    // if ((startDate != null) && (endDate != null)) {
    //   VoucherStartAndEndDateVO voucherStartAndEndDateVO =
    //       VoucherStartAndEndDateVO(startDate: "2023-5-1", endDate: "2023-6-12");
    //   _multiPosRepoModel
    //       .postVoucherHistoryResponse(voucherStartAndEndDateVO)
    //       .then((response) {
    //     voucherList = response.vouchers;
    //     voucherList?.sort((a, b) => b.id!.compareTo(a.id!));

    //     //filterByCustomerName();

    //     for (var i = 0; i < voucherList!.length; i++) {
    //       int temp = voucherList![i].total ?? 0;
    //       totalPrice = totalPrice! + temp;
    //     }
    //     _notifySafely();
    //     _hideLoading();
    //   });
    // } else {
    //   Functions.toast(msg: "dates must be picked first", status: false);
    // }
  }

  void deleteVoucher(int index, int voucherId) {
    RequestDeleteVoucher requestDeleteVoucher =
        RequestDeleteVoucher(voucherId: voucherId);
    _multiPosRepoModel
        .postVoucherDeleteResponse(requestDeleteVoucher)
        .then((response) {
      Functions.toast(msg: "${response.message} $voucherId", status: true);
      voucherList!.removeAt(index);
      for (var i = 0; i < voucherList!.length; i++) {
        int temp = voucherList![i].voucherGrandTotal ?? 0;
        totalPrice = totalPrice! + temp;
      }

      _notifySafely();
      _hideLoading();
    });
  }

  void onChangedCustomerName(String name) {
    this.customerName = name;
    _notifySafely();
  }

  void filterByCustomerName() {
    for (var i = 0; i < voucherList!.length; i++) {
      if (voucherList![i].customerName != null) {
        if (voucherList![i].customerName!.compareTo(customerName!) == 0) {
          filterByCustomerNameList!.add(voucherList![i]);
        }
      }
    }
    if (filterByCustomerNameList!.isNotEmpty) {
      voucherList = filterByCustomerNameList;
      _notifySafely();
    } else {
      Functions.toast(msg: "nothing found with that customer name");
    }
  }

  String displayTotalPrice() {
    String totalPriceDisplay = "Total price:       $totalPrice";
    return totalPriceDisplay;
  }

  set setDate(DateTime dateTime) => _date = dateTime;
  DateTime get getDate => _date!;

  void onEditingComplete() {
    focusNode.unfocus();
    _notifySafely();
  }

  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
