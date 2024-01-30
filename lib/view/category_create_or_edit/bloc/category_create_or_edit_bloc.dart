import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import '../../../data/vos/request_update_category_vo.dart';

class CategoryCreateOrEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  int? categoryId;
  String? unit;
  String? name;
  int? type;

  bool? create;
  CategoryVO? categoryVO;

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();

  CategoryCreateOrEditBloc(CategoryVO? categoryVO) {
    _showLoading();

    if (categoryVO != null) {
      _prePopulateBeforeEdit(categoryVO).then((value) => _hideLoading());
    } else {
      _hideLoading();
    }

    _notifySafely();
  }

  Future _prePopulateBeforeEdit(CategoryVO? categoryVO) async {
    this.categoryVO = categoryVO;

    categoryId = this.categoryVO?.id;
    unit = this.categoryVO?.unit;
    name = this.categoryVO?.name;
    type = this.categoryVO?.type;
    _notifySafely();
  }

  Future onTapCreate(create) {
    _showLoading();
    if (create) {
      if (name != null &&
          name != "" &&
          unit != null &&
          unit != "" &&
          type != null) {
        CategoryVO category = CategoryVO(
          name: name,
          unit: unit,
          type: type,
        );
        return _multiPosRepoModel
            .postCategoryStoreResponse(category)
            .then((value) => _hideLoading());
      } else {
        _hideLoading();
        return Future.error("Fail to add category");
      }
    } else {
      if (name != null &&
          name != "" &&
          unit != null &&
          unit != "" &&
          type != null) {
        RequestUpdateCategoryVO requestUpdateCategoryVO =
            RequestUpdateCategoryVO(
          categoryId: categoryId,
          name: name,
          unit: unit,
          type: type,
        );
        Functions.toast(msg: "$name $unit $type");
        return _multiPosRepoModel
            .postCategoryUpdateResponse(requestUpdateCategoryVO)
            .then((value) => _hideLoading());
      } else {
        _hideLoading();
        return Future.error("Fail to edit category");
      }
    }
  }

  void onFirstEditingComplete() {
    secondFocusNode.requestFocus();
    _notifySafely();
  }

  void onSecondEditingComplete() {
    firstFocusNode.unfocus();
    secondFocusNode.unfocus();
    _notifySafely();
  }

  void onChangeCategoryName(String? name) {
    this.name = name;
    _notifySafely();
  }

  void onChangeCategoryUnit(String? unit) {
    this.unit = unit;
    _notifySafely();
  }

  void onChooseType(int? type) {
    this.type = type;
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
