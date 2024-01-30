import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/supplier_vo.dart';

import 'dart:developer';
import '../../../data/vos/request_supplier_vo.dart';
import '../../supplier_create/widgets/brand_menu.dart';

class SupplierEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// text form situation
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();

  /// Screen states
  List<SupplierVO>? supplierList = [];
  List<String> supplierNameList = [];
  bool visibleRegister = false;
  bool isCreateSuccess = false;

  SupplierVO? supplierVO;

  String? name;
  String? address;
  String? phone;
  String? email;
  String? brandId;
  int? repaymentPeriod;
  int? creditAmount;
  int? supplierId;

  List<String> _selectedItems = [];

  final List<String> items = [
    'Brand A',
    'Brand B',
    'Brand C',
    'Brand D',
    'Brand E',
    'Brand F'
  ];

  SupplierEditBloc(SupplierVO? supplierVO) {
    _showLoading();
    if (supplierVO != null) {
      _prePopulateBeforeEdit(supplierVO).then((value) => _hideLoading());
    }
  }

  Future _prePopulateBeforeEdit(SupplierVO? supplierVO) async {
    this.supplierVO = supplierVO;
    supplierId = this.supplierVO?.id;
    name = this.supplierVO?.name;
    address = this.supplierVO?.address;
    phone = this.supplierVO?.phone;
    email = this.supplierVO?.email;
    brandId = this.supplierVO?.brandId;
    repaymentPeriod = this.supplierVO?.repaymentPeriod;
    creditAmount = this.supplierVO?.creditAmount;
    _notifySafely();
  }

  Future onTapCreate() {
    _showLoading();
    log('$supplierId $name $phone $address $repaymentPeriod $creditAmount');
    RequestSupplierVO requestSupplierVO = RequestSupplierVO(
        supplierId: supplierId,
        name: name,
        phone: phone,
        address: address,
        brandId: "1,8,9,10",
        repaymentPeriod: repaymentPeriod,
        repaymentDate: "2020-09-26",
        creditAmount: creditAmount);

    return _multiPosRepoModel
        .postSupplierUpdateResponse(requestSupplierVO)
        .then((value) => _hideLoading());
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

  void onChangeSupplierName(String name) {
    this.name = name;
    _notifySafely();
  }

  void onChangeAddress(String address) {
    this.address = address;
    _notifySafely();
  }

  void onChangePhone(String phone) {
    this.phone = phone;
    _notifySafely();
  }

  void onChangeEmail(String email) {
    this.email = email;
    _notifySafely();
  }

  void onChangeCreditAmount(int creditAmount) {
    this.creditAmount = creditAmount;
    _notifySafely();
  }

  void onChangeRepaymentPeriod(int repaymentPeriod) {
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

    // To Update UI
    if (results != null) {
      _selectedItems = results;
      brandId = _selectedItems.join(" ");
    }
    _notifySafely();
  }

  ///  screen situations
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
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
  }
}
