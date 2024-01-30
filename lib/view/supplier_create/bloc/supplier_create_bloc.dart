import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/supplier_vo.dart';
import '../widgets/brand_menu.dart';

class SupplierCreateBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  String? name;
  String? address;
  String? phone;
  String? email;
  String? brandId;
  List<String> _selectedItems = [];
  int? repaymentPeriod;
  int? creditAmount;

  final List<String> items = [
    'Brand A',
    'Brand B',
    'Brand C',
    'Brand D',
    'Brand E',
    'Brand F'
  ];

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();

  SupplierCreateBloc();

  Future onTapCreate() {
    _showLoading();
    if (name != null &&
        name != "" &&
        phone != null &&
        phone != "" &&
        address != null &&
        address != "" &&
        email != null &&
        email != "" &&
        repaymentPeriod != null &&
        creditAmount != null &&
        brandId != null &&
        brandId != "") {
      // Functions.toast(
      //     msg:
      //         "$name $phone $email $address $repaymentPeriod $creditAmount $brandId",
      //     status: false);
      SupplierVO supplierVO = SupplierVO(
          name: name,
          phone: phone,
          address: address,
          brandId: "1,8,9,10",
          repaymentPeriod: repaymentPeriod,
          repaymentDate: "2020-09-26",
          creditAmount: creditAmount);
      return _multiPosRepoModel
          .postSupplierStoreResponse(supplierVO)
          .then((value) => _hideLoading());
    } else {
      _hideLoading();
      return Future.error("Fail to add supplier");
    }
  }

  void onFirstEditingComplete() {
    secondFocusNode.requestFocus();
    _notifySafely();
  }

  void onSecondEditingComplete() {
    thirdFocusNode.requestFocus();
    _notifySafely();
  }

  void onThirdEditingComplete() {
    fourthFocusNode.requestFocus();
    _notifySafely();
  }

  void onFourthEditingComplete() {
    fifthFocusNode.requestFocus();
    _notifySafely();
  }

  void onFifthEditingComplete() {
    sixthFocusNode.requestFocus();
    _notifySafely();
  }

  void onSixthEditingComplete() {
    firstFocusNode.unfocus();
    secondFocusNode.unfocus();
    thirdFocusNode.unfocus();
    fourthFocusNode.unfocus();
    fifthFocusNode.unfocus();
    sixthFocusNode.unfocus();
    _notifySafely();
  }

  void onChangeSupplierName(String? name) {
    this.name = name;
    _notifySafely();
  }

  void onChangeSupplierPhone(String? phone) {
    this.phone = phone;
    _notifySafely();
  }

  void onChangeSupplierAddress(String? address) {
    this.address = address;
    _notifySafely();
  }

  void onChangeSupplierEmail(String? email) {
    this.email = email;
    _notifySafely();
  }

  void onChangeCreditAmount(int? creditAmount) {
    this.creditAmount = creditAmount;
    _notifySafely();
  }

  void onChangeRepaymentPeriod(int? repaymentPeriod) {
    this.repaymentPeriod = repaymentPeriod;
    _notifySafely();
  }

  void onChooseBrandId(context) async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      _selectedItems = results;
      brandId = _selectedItems.join(" ");
    }
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
