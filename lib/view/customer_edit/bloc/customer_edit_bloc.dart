import 'package:flutter/cupertino.dart';

import '../../../core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/customer_vo.dart';
import '../../../data/vos/request_update_customer_vo.dart';

class CustomerEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  int? customerId;
  String? name;
  String? customerCode;
  String? phone;
  int? vipcardNumber;
  int? taxFlag;
  int? taxPercent;
  CustomerVO? customerVO;
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();

  CustomerEditBloc(CustomerVO? customerVO) {
    _showLoading();
    if (customerVO != null) {
      _prePopulateBeforeEdit(customerVO).then((value) => _hideLoading());
    }
  }

  Future _prePopulateBeforeEdit(CustomerVO? customerVO) async {
    this.customerVO = customerVO;
    customerId = this.customerVO?.id;
    name = this.customerVO?.name;
    phone = this.customerVO?.phone;
    taxFlag = this.customerVO?.taxFlag;
    taxPercent = this.customerVO?.taxPercent;
    customerCode = this.customerVO?.customerCode;
    Functions.toast(msg: "$name", status: false);
    //_notifySafely();
  }

  Future onTapEdit() {
    _showLoading();
    if (name != null && name != "") {
      Functions.toast(
          msg: "$customerId $name $customerCode $phone $taxFlag $taxPercent");
      RequestUpdateCustomerVO requestUpdateCustomerVO = RequestUpdateCustomerVO(
          customerId: customerId,
          name: name,
          customerCode: customerCode,
          phone: phone,
          discountPercent: 0,
          vipcardNumber: 13,
          taxFlag: taxFlag,
          taxPercent: taxPercent);
      return _multiPosRepoModel
          .postCustomerUpdateResponse(requestUpdateCustomerVO)
          .then((value) => _hideLoading());
    } else {
      _hideLoading();
      return Future.error("Fail to edit");
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
