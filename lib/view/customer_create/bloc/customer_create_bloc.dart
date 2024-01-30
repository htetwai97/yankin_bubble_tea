import 'package:flutter/cupertino.dart';

import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/customer_vo.dart';

class CustomerCreateBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  String? name;
  String? customerCode;
  String? phone;
  int? vipcardNumber;
  int? taxFlag = 2;
  int? taxPercent;
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();

  CustomerCreateBloc();

  Future onTapCreate() {
    _showLoading();
    if (name != null &&
        name != "" &&
        customerCode != null &&
        customerCode != "" &&
        phone != null &&
        phone != "" &&
        taxFlag != null &&
        taxPercent != null) {
      CustomerVO customerVO = CustomerVO(
          name: name,
          customerCode: customerCode,
          phone: phone,
          vipcardNumber: 13,
          taxFlag: taxFlag,
          taxPercent: taxPercent);
      return _multiPosRepoModel
          .postCustomerStoreResponse(customerVO)
          .then((value) => _hideLoading());
    } else {
      _hideLoading();
      return Future.error("Fail to add customer");
    }
  }

  void onFirstEditingComplete() {
    firstFocusNode.unfocus();
    secondFocusNode.requestFocus();
    _notifySafely();
  }

  void onSecondEditingComplete() {
    secondFocusNode.unfocus();
    thirdFocusNode.requestFocus();
    _notifySafely();
  }

  void onThirdEditingComplete() {
    thirdFocusNode.unfocus();
    fourthFocusNode.requestFocus();
    _notifySafely();
  }

  void onFourthEditingComplete() {
    fourthFocusNode.unfocus();
    _notifySafely();
  }

  void onChangeName(String? name) {
    this.name = name;
    _notifySafely();
  }

  void onChangeCustomerCode(String? customerCode) {
    this.customerCode = customerCode;
    _notifySafely();
  }

  void onChangePhone(String? phone) {
    this.phone = phone;
    _notifySafely();
  }

  void onChooseTaxFlag(int? taxFlag) {
    this.taxFlag = taxFlag;
    if (this.taxFlag == 2) {
      taxPercent = 0;
    }
    _notifySafely();
  }

  void onChooseTaxPercent(int? taxPercent) {
    this.taxPercent = taxPercent;
    _notifySafely();
  }

  // bool isTaxFlagYes() {
  //   if (taxFlag != 1) {
  //     this.thirdFocusNode = new FocusNode();
  //   }
  //   _notifySafely();
  //   return this.taxFlag == 1;
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
