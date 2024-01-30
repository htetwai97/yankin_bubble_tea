import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_text.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';

class ProductCreateBloc extends ChangeNotifier {
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

  /// Screen states
  List<CategoryVO>? categoryList = [];
  List<String> categoryNameList = [];
  bool visibleRegister = false;
  bool isCreateSuccess = false;

  /// Product section state
  String? productName;
  String? description;
  int? categoryId;
  String? categoryDropDownValue;
  int? displayIndex;
  File? file;
  int? productId;

  /// request
  List<RequestSizeObjectVO>? sizeOfIngredientList;

  ProductCreateBloc() {
    _showLoading();
    _multiPosRepoModel.postCategoryListResponse().then((response) {
      categoryList = response.categories;
      categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
      categoryNameList = categoryList?.map((e) => e.name ?? "").toList() ?? [];
      _notifySafely();

      _multiPosRepoModel.getString(PRODUCT_NAME).then((value) {
        productName = value;
        _notifySafely();

        _multiPosRepoModel.getString(DESCRIPTION).then((value) {
          description = value;
          _notifySafely();

          _multiPosRepoModel.getString(CATEGORY_NAME).then((value) {
            categoryDropDownValue = value;
            _notifySafely();

            _multiPosRepoModel.getString(FILE_PATH).then((value) {
              file = File(value);
              _notifySafely();

              _multiPosRepoModel.getInt(CATEGORY_ID).then((value) {
                categoryId = value;
                _notifySafely();

                _multiPosRepoModel.getInt(PRODUCT_ID).then((value) {
                  productId = value;
                  _notifySafely();

                  _multiPosRepoModel
                      .getAllSizeWithIngredients()
                      .listen((sizeWithIngredientList) {
                    sizeOfIngredientList = sizeWithIngredientList;
                    _notifySafely();

                    _multiPosRepoModel.getInt(DISPLAY_INDEX).then((value) {
                      displayIndex = value;
                      _notifySafely();
                      _hideLoading();
                    });
                  });
                });
              });
            });
          });
        });
      });
    });
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

  Future onTapAddOtherNeed() async {
    _showLoading();
    await _multiPosRepoModel.saveString(PRODUCT_NAME, productName ?? "");
    await _multiPosRepoModel.saveString(DESCRIPTION, description ?? "");
    await _multiPosRepoModel.saveString(
        CATEGORY_NAME, categoryDropDownValue ?? "");
    await _multiPosRepoModel.saveString(FILE_PATH, file?.path ?? "");
    await _multiPosRepoModel.saveInt(CATEGORY_ID, categoryId ?? 0);
    // await _multiPosRepoModel.saveInt(PRODUCT_ID, productId ?? 0);
    await _multiPosRepoModel.saveInt(DISPLAY_INDEX, displayIndex ?? 0);

    bool passWithoutProductId = (productName != null &&
        productName != "" &&
        description != null &&
        description != "" &&
        categoryId != null &&
        categoryId != 0 &&
        file?.path != null &&
        file?.path != "" &&
        displayIndex != null &&
        displayIndex != 0 &&
        productId == 0);
    bool passWithProductId = (productName != null &&
        productName != "" &&
        description != null &&
        description != "" &&
        categoryId != null &&
        categoryId != 0 &&
        file?.path != null &&
        file?.path != "" &&
        displayIndex != null &&
        displayIndex != 0 &&
        productId != 0);

    if (passWithoutProductId) {
      _multiPosRepoModel
          .postNewProduct(file!, productName!, description!,
              categoryId!.toString(), displayIndex.toString())
          .then((response) {
        productId = response.product?.id;
        _notifySafely();
        _multiPosRepoModel.saveInt(PRODUCT_ID, productId ?? 0);
        _hideLoading();
      });
    } else if (passWithProductId) {
      _hideLoading();
      return Future.value();
    } else {
      _hideLoading();
      Functions.toast(msg: "Fields required", status: false);
      return Future.error("error=======> ");
    }
  }

  Future onTapCreate() async {
    _showLoading();
    await _multiPosRepoModel.clearSharePrefItems();
    // await _multiPosRepoModel.removeSharePrefItem(PRODUCT_NAME);
    // await _multiPosRepoModel.removeSharePrefItem(DESCRIPTION);
    // await _multiPosRepoModel.removeSharePrefItem(CATEGORY_NAME);
    // await _multiPosRepoModel.removeSharePrefItem(FILE_PATH);
    // await _multiPosRepoModel.removeSharePrefItem(CATEGORY_ID);
    // await _multiPosRepoModel.removeSharePrefItem(PRODUCT_ID);
    // await _multiPosRepoModel.removeSharePrefItem(DISPLAY_INDEX);
    if (productId != null &&
        productId != 0 &&
        sizeOfIngredientList != null &&
        sizeOfIngredientList != []) {
      // await _multiPosRepoModel.removeSharePrefItem(PRODUCT_NAME);
      // await _multiPosRepoModel.removeSharePrefItem(DESCRIPTION);
      // await _multiPosRepoModel.removeSharePrefItem(CATEGORY_NAME);
      // await _multiPosRepoModel.removeSharePrefItem(FILE_PATH);
      // await _multiPosRepoModel.removeSharePrefItem(CATEGORY_ID);
      // await _multiPosRepoModel.removeSharePrefItem(PRODUCT_ID);
      // await _multiPosRepoModel.removeSharePrefItem(DISPLAY_INDEX);

      RequestProductVO requestProductVO = RequestProductVO(
          productId: productId, sizeOfIngredient: sizeOfIngredientList);

      return _multiPosRepoModel
          .postStoreIngredientResponse(requestProductVO)
          .then((value) {
        _hideLoading();
        _multiPosRepoModel.clearSizeWithIngredients();
      });
    } else {
      // _hideLoading();
      return Future.error("error");
    }
  }

  Future onTapCancel() async {
    await _multiPosRepoModel.clearSharePrefItems();
    // await _multiPosRepoModel.removeSharePrefItem(PRODUCT_NAME);
    // await _multiPosRepoModel.removeSharePrefItem(DESCRIPTION);
    // await _multiPosRepoModel.removeSharePrefItem(CATEGORY_NAME);
    // await _multiPosRepoModel.removeSharePrefItem(FILE_PATH);
    // await _multiPosRepoModel.removeSharePrefItem(CATEGORY_ID);
    // await _multiPosRepoModel.removeSharePrefItem(PRODUCT_ID);
    // await _multiPosRepoModel.removeSharePrefItem(DISPLAY_INDEX);
    _multiPosRepoModel.clearSizeWithIngredients();

    if (productId != null && productId != 0) {
      RequestProductVO requestProductVO = RequestProductVO(
        productId: productId,
      );

      ///  _multiPosRepoModel.deleteProduct(productId);
      return _multiPosRepoModel.postProductDeleteResponse(requestProductVO);
    } else {
      return Future.value();
    }
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
