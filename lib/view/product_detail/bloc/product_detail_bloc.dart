import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/product_vo.dart';
import '../../../data/vos/request_size_object_vo.dart';

class ProductDetailBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Loading State
  bool isLoading = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  // screen states
  ProductVO? productVO;
  int? displayIndex;
  String? productName;
  String? description;
  int? categoryId;
  String? categoryDropDownValue;
  File? file;

  String? selectedSize;
  String? productUrl;
  int? productId;

  List<RequestSizeObjectVO>? sizeList;

  ProductDetailBloc(productVO) {
    if (productVO != null) {
      this.productVO = productVO;
      productId = this.productVO?.id;
      productName = this.productVO?.name;
      description = this.productVO?.description;
      categoryId = this.productVO?.categoryId;
      productUrl = this.productVO?.photo;
      displayIndex = this.productVO?.displayIndex;
      selectedSize = this.productVO?.selectedSize;
      sizeList = this.productVO?.sizeOfIngredient;
      _notifySafely();
    }

    Functions.toast(
        msg:
            "${sizeList![0].ingredients?[0].rawMaterialName} ${sizeList!.length}");
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
