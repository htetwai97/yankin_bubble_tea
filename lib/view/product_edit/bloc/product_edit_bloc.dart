import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';

class ProductEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// text form situation
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();

  /// Screen states
  List<CategoryVO>? categoryList = [];
  List<String> categoryNameList = [];
  bool visibleRegister = false;
  bool isCreateSuccess = false;

  /// Product section state
  ProductVO? productVO;
  int? displayIndex;
  String? productName;
  String? description;
  int? categoryId;
  String? categoryDropDownValue;
  File? file;

  String? productUrl;
  int? productId;

  ProductEditBloc(ProductVO? productVO) {
    _showLoading();
    if (productVO != null) {
      _prePopulateBeforeEdit(productVO).then((value) => _hideLoading());
    }
  }

  Future _prePopulateBeforeEdit(ProductVO? productVO) async {
    await _multiPosRepoModel.postCategoryListResponse().then((response) {
      categoryList = response.categories;
      categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
      categoryNameList = categoryList?.map((e) => e.name ?? "").toList() ?? [];
      this.productVO = productVO;
      productId = this.productVO?.id;
      productName = this.productVO?.name;
      description = this.productVO?.description;
      categoryId = this.productVO?.categoryId;
      productUrl = this.productVO?.photo;
      displayIndex = this.productVO?.displayIndex;
      _notifySafely();
      List<CategoryVO> list =
          categoryList?.where((element) => element.id == categoryId).toList() ??
              [];
      if (list.isNotEmpty) {
        list.take(1);
        CategoryVO categoryVO = list.elementAt(0);
        categoryDropDownValue = categoryVO.name;
        _notifySafely();
      }
    });
  }

  Future onTapCreate() {
    _multiPosRepoModel.clearSharePrefItems();
    isApiCalling = true;
    _notifySafely();
    if (productId != null &&
        productName != null &&
        productName != "" &&
        description != null &&
        description != "" &&
        categoryId != null &&
        displayIndex != 0 &&
        displayIndex != null &&
        file == null) {
      return _multiPosRepoModel
          .postEditProductV2(productId.toString(), productName!, description!,
              categoryId.toString(), displayIndex.toString())
          .then((value) {
        /// _multiPosRepoModel.clearProducts();
        isApiCalling = false;
        _notifySafely();
      });
    } else if (productId != null &&
        productName != null &&
        productName != "" &&
        description != null &&
        description != "" &&
        categoryId != null &&
        displayIndex != 0 &&
        displayIndex != null &&
        file != null) {
      return _multiPosRepoModel
          .postEditProduct(file!, productId.toString(), productName!,
              description!, categoryId.toString(), displayIndex.toString())
          .then((value) {
        /// _multiPosRepoModel.clearProducts();
        isApiCalling = false;
        _notifySafely();
      });
    } else {
      return Future.error("error");
    }
  }

  Future onTapCancel() {
    _multiPosRepoModel.clearSharePrefItems();
    return Future.value();
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
    firstFocusNode.unfocus();
    secondFocusNode.unfocus();
    thirdFocusNode.unfocus();
    _notifySafely();
  }

  void onChangeDisplayIndex(String displayIndex) {
    this.displayIndex = int.parse(displayIndex);
    _notifySafely();
  }

  void onChangeProductName(String productName) {
    this.productName = productName;
    _notifySafely();
  }

  void onChangeDescription(String description) {
    this.description = description;
    _notifySafely();
  }

  void onChangedCategory(String category) {
    categoryDropDownValue = category;
    _notifySafely();
    List<CategoryVO> list =
        categoryList?.where((element) => element.name == category).toList() ??
            [];
    if (list.isNotEmpty) {
      list.take(1);
      CategoryVO categoryVO = list.elementAt(0);
      categoryId = categoryVO.id;
      _notifySafely();
    }
  }

  void onChangeFile(File file) {
    this.file = file;
    productUrl = null;
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
  }
}
