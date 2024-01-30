import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer';
import 'package:multipurpose_pos_application/core/core_config/config_text.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/high_sale_item_vo.dart';
import '../../../data/vos/date_vo.dart';

class BestSellingItemsBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  String? queryDate;
  DateTime? _date;
  int value = 0;
  List<HighSaleItemVO>? itemList = [];

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  BestSellingItemsBloc() {
    _multiPosRepoModel.getInt(KEY).then((value) {
      this.value = value;
      _notifySafely();
    });

    DateTime now = DateTime.now();
    this._date = now;
    final formatter = DateFormat('yyyy-MM-dd');
    queryDate = formatter.format(_date!);

    _multiPosRepoModel
        .postBestSellingItemsResponse(new DateVO(date: queryDate))
        .then((response) {
      _showLoading();

      log('$response');
      itemList = response.items;
      itemList?.sort((a, b) => b.id!.compareTo(a.id!));
      _notifySafely();
      _hideLoading();
      //Functions.toast(msg: "$itemList.length", status: false);
      // Functions.toast(msg: "${scaleWidth(context)} ${scaleHeight}", status: false); //780 360
    });
  }

  // void onTapRadio(int value) async {
  //   await _multiPosRepoModel.saveInt(KEY, value);
  //   _multiPosRepoModel.getInt(KEY).then((value) {
  //     this.value = value;
  //     _notifySafely();
  //   });
  // }

  Future onTapLogOut() {
    return _multiPosRepoModel.clearSharePrefItems();
  }

  void onDatePick(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2023, 3),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      this._date = picked;
      final formatter = DateFormat('yyyy-MM-dd');
      queryDate = formatter.format(_date!);
      _notifySafely();
    }
    Functions.toast(msg: "$queryDate", status: true);
  }

  void onQueryByDate() {
    DateVO dateVO = new DateVO(date: queryDate);
    Functions.toast(msg: "$queryDate", status: true);

    _multiPosRepoModel.postBestSellingItemsResponse(dateVO).then((response) {
      _showLoading();
      itemList = response.items;
      itemList?.sort((a, b) => b.id!.compareTo(a.id!));
      _notifySafely();
      _hideLoading();
      String? m = response.message;
      log('response: $m');
    });
  }

  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
