import 'dart:io';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/promotion_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_card_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_voucher_vo.dart';
import 'package:screenshot/screenshot.dart';

class VoucherStoreBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// screen States
  String? backDate;
  int? backDateFlag;

  int customerId = 0;
  PromotionVO? promotionVO;
  List<ProductVO>? selectedProductList;
  int? quantity;
  int? cashBackFlag;
  double? cashBack = 0;
  bool? isCheckedCashBack;
  bool? isCheckedTax;
  int taxFlag = 0;
  double? taxAmount = 0;
  double? discount;
  double? totalAll;
  double? grandTotal;
  int? soldBy = 1;
  String? employeeName = "";

  /// printer states
  ScreenshotController screenshotController = ScreenshotController();
  String dir = Directory.current.path;

  VoucherStoreBloc(
      String? backDate,
      int? backDateFlag,
      int? customerId,
      PromotionVO? promotionVO,
      List<ProductVO>? selectedProductList,
      int? quantity) {
    this.quantity = quantity;
    this.backDate = backDate;
    this.backDateFlag = backDateFlag;
    this.customerId = customerId ?? 0;
    this.promotionVO = promotionVO;
    this.selectedProductList = selectedProductList;
    // this.selectedProductList?.forEach((element) {
    //   var totalItemPrice = element.totalForOnlyItem ?? 0;
    //   var totalPopPrice = element.totalToppingPrice ?? 0;
    //   var totalBoth = totalItemPrice + totalPopPrice;
    //   element.totalBothCardAndTopping = totalBoth;
    //   _notifySafely();
    // });
    totalAll = selectedProductList?.fold(
        0,
        (previousValue, element) =>
            previousValue! + element.totalBothCardAndTopping!);
    _notifySafely();
    if (promotionVO != null && promotionVO.discountPercent != null) {
      var percentValue = promotionVO.discountPercent ?? 0;
      var total = totalAll ?? 0;
      discount = (total * percentValue) / 100;
      _notifySafely();
    }
    var total = totalAll ?? 0;
    var tax = taxAmount ?? 0;
    var cashbak = cashBack ?? 0;
    var disc = discount ?? 0;
    grandTotal = (total + tax) - (cashbak + disc);
    _notifySafely();
  }

  /// events

  void onCheckTax(double taxpara, bool? isCheckedTax) {
    if (taxpara == 0) {
      taxAmount = taxpara;
      taxFlag = 0;
      this.isCheckedTax = isCheckedTax;
      var total = totalAll ?? 0;
      var tax = taxAmount ?? 0;
      var cashbak = cashBack ?? 0;
      var disc = discount ?? 0;
      grandTotal = (total + tax) - (cashbak + disc);
      _notifySafely();
    } else {
      taxAmount = taxpara;
      taxFlag = 1;
      this.isCheckedTax = isCheckedTax;
      var total = totalAll ?? 0;
      var tax = taxAmount ?? 0;
      var cashbak = cashBack ?? 0;
      var disc = discount ?? 0;
      grandTotal = (total + tax) - (cashbak + disc);
      _notifySafely();
    }
  }

  void onCheckCashBack(bool? cashBack) {
    isCheckedCashBack = cashBack;
    _notifySafely();
    if (isCheckedCashBack == false) {
      this.cashBack = 0;
      _notifySafely();
    }
  }

  void onOpenDialog() {
    if (cashBack == 0 || cashBack == null) {
      isCheckedCashBack = false;
      //cashBackFlag = 0;
      _notifySafely();
    }
    // else{
    //   cashBackFlag = 1;
    //   _notifySafely();
    // }
  }

  void testPrint(Uint8List? imageComesFromSs) async {
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    final PosPrintResult res =
        await printer.connect("192.168.100.87", port: 9100);
    if (res == PosPrintResult.success) {
      await testReceipt(printer, imageComesFromSs);
      await Future.delayed(const Duration(seconds: 3), () {
        printer.disconnect();
      });
    }
  }

  Future<void> testReceipt(
      NetworkPrinter printer, Uint8List? imageComesFromSs) async {
    if (imageComesFromSs != null) {
      var newImage = decodeImage(imageComesFromSs);
      printer.image(newImage!, align: PosAlign.center);
      printer.cut();
    }
  }

  void onChangeCashBack(double? cash) {
    cashBack = cash;
    var total = totalAll ?? 0;
    var tax = taxAmount ?? 0;
    var cashbak = cashBack ?? 0;
    var disc = discount ?? 0;
    grandTotal = (total + tax) - (cashbak + disc);
    _notifySafely();
  }

  void onTapCross() {
    cashBack = 0;
    isCheckedCashBack = false;
    var total = totalAll ?? 0;
    var tax = taxAmount ?? 0;
    var cashbak = cashBack ?? 0;
    var disc = discount ?? 0;
    grandTotal = (total + tax) - (cashbak + disc);
    _notifySafely();
  }

  void onTapOk() {
    if (cashBack != 0) {
      cashBackFlag = 1;
      _notifySafely();
    } else {
      isCheckedCashBack = false;
      cashBackFlag = 0;
      _notifySafely();
    }
  }

  Future onTapVoucherStore() {
    _showLoading();
    List<RequestCardProductVO?>? voucherItemList = selectedProductList
        ?.map((e) => e.changeToRequestCardProduct(e))
        .toList();
    double? totalAmount = selectedProductList?.fold(
        0,
        (previousValue, element) =>
            previousValue! + element.totalBothCardAndTopping!);
    var requestVoucherVO = RequestVoucherVO(
      backDateFlag: backDateFlag,
      backDate: backDate,
      cashBackFlag: cashBackFlag,
      cashBack: cashBack,
      taxFlag: taxFlag,
      taxAmount: taxAmount,
      grandTotal: grandTotal ?? 0,
      total: totalAmount ?? 0,
      promotionId: promotionVO?.id,
      customerId: customerId,
      soldBy: 1,
      employeeName: "",
      voucherItemList: voucherItemList,
    );

    ///return _multiPosRepoModel.postVoucherStore(requestVoucherVO);
    return Future.value();
  }

  /// loading situations
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
