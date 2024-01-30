import 'package:flutter/foundation.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/sales_amounts_vo.dart';

class SaleAndHistoryBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  //int value = 0;
  SaleAmountVO? saleAmountTotal;

  SaleAndHistoryBloc() {
    _showLoading();
    _multiPosRepoModel.getSalesTotal().then((value) {
      /// Min Htet Zaw's math skill
      saleAmountTotal = value;
      _notifySafely();
      _hideLoading();
    });
    // _multiPosRepoModel.getInt(KEY).then((value) {
    //   this.value = value;
    //   _notifySafely();
    // });
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
  }
}
