import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../core/core_function/functions.dart';
import '../../../core/core_config/config_text.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/cashback_and_promo_vo.dart';
import '../../../data/vos/request_cashback_and_promotion.dart';

class CashbackAndPromotionBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Screen states
  List<CashbackAndPromo>? cbPromoCollection = [];
  int? cbPromoFlag = 1;
  int? promotionType;

  String? selectedType;
  String? startDate;
  String? endDate;
  String? queryDate;
  DateTime? _date;
  int value = 0;
  int? totalPrice = 0;
  int? discountTotal = 0;

  FocusNode focusNode = FocusNode();

  CashbackAndPromotionBloc() {
    _showLoading();
    DateTime now = DateTime.now();
    this._date = now;
    final formatter = DateFormat('yyyy-MM-dd');
    startDate = formatter.format(_date!);
    endDate = formatter.format(_date!);

    RequestCashbackAndPromotion requestCashbackAndPromotion =
        RequestCashbackAndPromotion(
            startDate: startDate, endDate: endDate, cbOrPromoFlag: 1);
    _multiPosRepoModel
        .postCashbackAndPromotionResponse(requestCashbackAndPromotion)
        .then((response) {
      cbPromoCollection = response.cbPromoCollection;

      for (var i = 0; i < cbPromoCollection!.length; i++) {
        int temp = cbPromoCollection![i].voucherTotal ?? 0;
        totalPrice = totalPrice! + temp;
      }

      for (var i = 0; i < cbPromoCollection!.length; i++) {
        int temp = cbPromoCollection![i].discountAmount ?? 0;
        discountTotal = discountTotal! + temp;
      }
      _notifySafely();
      _hideLoading();
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
    Functions.toast(msg: "$startDate $endDate $cbPromoFlag");
    _showLoading();
    RequestCashbackAndPromotion requestCashbackAndPromotion =
        RequestCashbackAndPromotion(
            startDate: startDate, endDate: endDate, cbOrPromoFlag: cbPromoFlag);
    _multiPosRepoModel
        .postCashbackAndPromotionResponse(requestCashbackAndPromotion)
        .then((response) {
      Functions.toast(msg: "${response.message}");
      cbPromoCollection = response.cbPromoCollection;
      _notifySafely();
      _hideLoading();
    });
  }

  void onChangedPromotionType(String type) {
    selectedType = type;
    switch (type) {
      case "Cashback":
        promotionType = 1;
        break;
      case "Promotion":
        promotionType = 2;
        break;
      case "Reward":
        promotionType = 3;
        break;
      case "CT 5%":
        promotionType = 4;
        break;
      default:
        promotionType = 1;
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
