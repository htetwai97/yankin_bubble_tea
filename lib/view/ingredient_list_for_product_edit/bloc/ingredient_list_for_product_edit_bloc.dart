import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_text.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/request_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';

class IngredientListForProductEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// request
  List<RequestSizeObjectVO>? sizeOfIngredientList;
  int? productId;

  /// Dialog states
  FocusNode sellFocus = FocusNode();
  FocusNode deliFocus = FocusNode();
  int? sellPrice;
  int? deliPrice;
  RequestSizeObjectVO? requestSizeObjectVO;

  IngredientListForProductEditBloc() {
    _showLoading();
    _multiPosRepoModel.getAllSizeWithIngredients().listen((event) {
      sizeOfIngredientList = event;
      _notifySafely();

      _multiPosRepoModel.getInt(PRODUCT_ID).then((value) {
        productId = value;
        _notifySafely();
        _hideLoading();
      });
    });
  }

  /// main screen data
  Future onTapCancel() async {
    await _multiPosRepoModel.clearSharePrefItems();
    _multiPosRepoModel.clearSizeWithIngredients();
    return Future.value();
  }

  Future onTapEdit() async {
    await _multiPosRepoModel.clearSharePrefItems();
    if (productId != null &&
        productId != 0 &&
        sizeOfIngredientList != null &&
        sizeOfIngredientList != []) {
      RequestProductVO requestProductVO = RequestProductVO(
          productId: productId, sizeOfIngredient: sizeOfIngredientList);
      return _multiPosRepoModel
          .postStoreIngredientResponse(requestProductVO)
          .then((value) {
        /// await _multiPosRepoModel.removeSharePrefItem(PRODUCT_ID);
        _multiPosRepoModel.clearSizeWithIngredients();
        // _multiPosRepoModel.clearProducts();
      });
    } else {
      return Future.error("error");
    }
  }

  /// dialog data
  void onTapCross() {
    sellPrice = null;
    deliPrice = null;
    _notifySafely();
  }

  Future onTapOk(RequestSizeObjectVO requestSizeObjectVO) {
    this.requestSizeObjectVO = requestSizeObjectVO;
    this.requestSizeObjectVO?.sellPrice = sellPrice;
    this.requestSizeObjectVO?.deliPrice = deliPrice;
    _notifySafely();
    _multiPosRepoModel.saveSizeWithIngredientItem(this.requestSizeObjectVO);
    return Future.value();
  }

  void onChangeDeliPrice(String deliPrice) {
    this.deliPrice = int.parse(deliPrice);
    _notifySafely();
  }

  void onChangeSellPrice(String sellPrice) {
    this.sellPrice = int.parse(sellPrice);
    _notifySafely();
  }

  void onSellPriceEditingComplete() {
    sellFocus.unfocus();
    _notifySafely();
  }

  void onDeliPriceEditingComplete() {
    deliFocus.unfocus();
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
  }
}
