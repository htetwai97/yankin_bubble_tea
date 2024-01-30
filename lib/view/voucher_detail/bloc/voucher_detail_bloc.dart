import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../../core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/request_voucher_detail_vo.dart';
import '../../../data/vos/voucher_detail_vo.dart';

// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:esc_pos_printer/esc_pos_printer.dart';

class VoucherDetailBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Loading State
  bool isLoading = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Screen States
  int? id;
  String? voucherNumber;
  List<VoucherData>? voucherData;
  int? voucherGrandTotal;
  int? total;
  int? customerId;
  int? soldBy;
  String? employeeName;
  String? date;
  int? promotionId;
  int? cashbackFlag;
  double? cashback;
  double? discount = 0.0;
  int? taxFlag;
  double? taxAmount;
  String? createdAt;
  String? updatedAt;
  String? customerName;
  int? customerTax;
  String? promotion;

  VoucherDetailBloc(int? voucherId, bool? print) {
    RequestVoucherDetailVO requestVoucherDetailVO =
        RequestVoucherDetailVO(voucherId: voucherId);
    _showLoading();
    _multiPosRepoModel
        .postVoucherDetailResponse(requestVoucherDetailVO)
        .then((response) {
      Functions.toast(msg: "${response.message} $voucherId", status: true);
      VoucherDetailVO detailVO = response.voucher!;
      voucherData = detailVO.voucherData;
      total = detailVO.total ?? 0;
      date = detailVO.date;
      taxAmount = detailVO.taxAmount?.toDouble() ?? 0.0;
      cashback = detailVO.cashback?.toDouble() ?? 0.0;
      if (detailVO.promotion != null &&
          detailVO.promotion?.discountPercent != null) {
        var percentValue = detailVO.promotion?.discountPercent ?? 0;
        var total = this.total ?? 0;
        discount = (total * percentValue) / 100;
        _notifySafely();
      }

      ///
      // voucherData?.forEach((element) {
      //   if (element.popingList != null &&
      //       element.popingList?.length != 0 &&
      //       element.popingList != []) {
      //     int sellPrice = element.sellingPrice ?? 0;
      //     int toppingTotalForElement = element.popingList?.fold(
      //             0,
      //             (previousValue, element) =>
      //                 previousValue! + element.totalAmount!) ??
      //         0;
      //     element.totalPrice = sellPrice + toppingTotalForElement;
      //     _notifySafely();
      //   }
      // });
      // _notifySafely();
      //
      // ///
      // if (voucherData != null &&
      //     voucherData?.length != 0 &&
      //     voucherData != []) {
      //   detailVO.displayGrandTotal = voucherData?.fold(0,
      //       (previousValue, element) => previousValue! + element.totalPrice!);
      //   _notifySafely();
      // }

      voucherGrandTotal = detailVO.voucherGrandTotal?.toInt();
      voucherNumber = detailVO.voucherNumber;
      customerName = detailVO.customerName;
      customerTax = detailVO.customerTax ?? 0;
      _notifySafely();
      _hideLoading();

      if (print!) {
        //printVoucher();
      }
    }).onError((error, stackTrace) =>
            Functions.toast(msg: "error : $error $voucherId", status: false));
  }

  // void printVoucher() async {
  //   final printer =
  //       NetworkPrinter(PaperSize.mm80, await CapabilityProfile.load());
  //
  //   final PosPrintResult connectResult = await printer.connect('192.168.0.100');
  //
  //   if (connectResult != PosPrintResult.success) {
  //     print('Could not connect to the printer. Error: $connectResult');
  //     return;
  //   }
  //
  //   // final printer = PosPrinter(PaperSize.mm80);
  //
  //   // final PosPrintResult connectResult = await printer.connect('usb:/dev/usb/lp0');
  //
  //   // if (connectResult != PosPrintResult.success) {
  //   //   print('Could not connect to the printer. Error: $connectResult');
  //   //   return;
  //   // }
  //
  //   printer.setStyles(const PosStyles(
  //       align: PosAlign.center, bold: true, height: PosTextSize.size2));
  //   printer.text('Yankinbubbletea');
  //   printer.text('123 Main St, City, Country');
  //   printer.text('Phone: +123456789');
  //   printer.feed(2);
  //
  //   printer.text('Voucher No: ${voucherNumber}          Date: ${date}');
  //   printer.feed(1);
  //
  //   printer.setStyles(PosStyles(align: PosAlign.left, bold: true));
  //   printer.text('----------------------------------------');
  //   printer.text('    Item          Count    Price    Size');
  //   printer.text('----------------------------------------');
  //   printer.setStyles(PosStyles(align: PosAlign.left, bold: false));
  //   for (var i = 0; i < voucherData!.length; i++) {
  //     printer.text('    Item          Count    Price    Size');
  //     printer.text(
  //         '$i. ${voucherData![i].name}          ${voucherData![i].orderQty}    ${voucherData![i].sellingPrice}   ${voucherData![i].size}');
  //   }
  //   // printer.text('Item 1         1        \$10.00   Regular');
  //   // printer.text('Item 2         2        \$20.00   Large');
  //   // printer.text('Item 3         1        \$15.00   Regular');
  //   printer.text('----------------------------------------');
  //   printer.feed(1);
  //
  //   printer.text('Customer Name: $customerName');
  //   printer.text('Customer Tax: $customerTax');
  //   printer.text('Total: $total');
  //   printer.text('Subtotal: \$45.00');
  //   printer.feed(2);
  //
  //   printer.cut();
  //   printer.disconnect();
  // }

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
