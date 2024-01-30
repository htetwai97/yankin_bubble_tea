import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';

class IngredientAddOtherNeedForProductEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<RequestSizeObjectVO>? sizeOfIngredientList;
  List<String?>? sizeList;
  List<RawMaterialVO>? rawMaterialList = [];
  List<String> rawMaterialNameList = [];
  bool visibleRegister = false;

  /// Size And Price section states
  String? size;
  int? sellPrice;
  int? deliPrice;

  /// Ingredient section states
  String? rawMaterialName;
  int? rawMaterialId;
  int? amount;
  String? unitName;

  /// TextFields states
  FocusNode? focusNodeAmount = FocusNode();
  FocusNode? focusNodeSellPrice = FocusNode();
  FocusNode? focusNodeDeliPrice = FocusNode();

  /// request
  RequestSizeObjectVO? sizeOfIngredientVO;
  List<RequestIngredientVO> requestIngredientList = [];

  IngredientAddOtherNeedForProductEditBloc() {
    _showLoading();
    _multiPosRepoModel.postRawMaterialResponse().then((response) {
      rawMaterialList = response.rawMaterials;
      rawMaterialList?.sort((a, b) => b.id!.compareTo(a.id!));
      rawMaterialNameList =
          rawMaterialList?.map((e) => e.name ?? "").toList() ?? [];
      _notifySafely();

      _multiPosRepoModel.getAllSizeWithIngredients().listen((event) {
        sizeOfIngredientList = event;
        sizeList = sizeOfIngredientList?.map((e) => e.size).toList();
        _notifySafely();
        _hideLoading();
      });
    });
  }

  void _visibleRegisterButton() {
    if (requestIngredientList.isNotEmpty) {
      visibleRegister = true;
      _notifySafely();
    } else {
      visibleRegister = false;
      _notifySafely();
    }
  }

  void onTapCross() {
    _removeAllData();
  }

  void onTapCancel() {
    _removeAllData();
  }

  void _removeAllData() {
    size = null;
    sellPrice = null;
    deliPrice = null;
    rawMaterialName = null;
    rawMaterialId = null;
    amount = null;
    unitName = null;
    requestIngredientList = [];
    _notifySafely();
  }

  void _removeIngredientData() {
    rawMaterialName = null;
    rawMaterialId = null;
    amount = null;
    unitName = null;
    _notifySafely();
  }

  void onEditCompleteAmount() {
    focusNodeAmount?.unfocus();
  }

  void onEditCompleteSell() {
    focusNodeDeliPrice?.requestFocus();
  }

  void onEditCompleteDeli() {
    focusNodeSellPrice?.unfocus();
    focusNodeDeliPrice?.unfocus();
  }

  void onTapAdd() {
    if (rawMaterialName != null &&
        rawMaterialName != "" &&
        rawMaterialId != null &&
        amount != null &&
        unitName != "" &&
        unitName != null) {
      RequestIngredientVO ingredientVO = RequestIngredientVO(
        rawMaterialName: rawMaterialName,
        rawMaterialId: rawMaterialId,
        amount: amount,
        unitName: unitName,
      );
      requestIngredientList.add(ingredientVO);
      _notifySafely();
      _visibleRegisterButton();
      _removeIngredientData();
    }
  }

  Future onTapRegister() {
    if (size != null &&
        sellPrice != null &&
        deliPrice != null &&
        requestIngredientList != []) {
      if (sizeList?.contains(size) ?? false) {
        var list = sizeOfIngredientList
            ?.where((element) => element.size == size)
            .toList();
        list?.take(1);
        sizeOfIngredientVO = list?.elementAt(0);
        sizeOfIngredientVO?.size = size;
        sizeOfIngredientVO?.sellPrice = sellPrice;
        sizeOfIngredientVO?.deliPrice = deliPrice;
        sizeOfIngredientVO?.ingredients = requestIngredientList;
        _notifySafely();
        _multiPosRepoModel.saveSizeWithIngredientItem(sizeOfIngredientVO);
      } else {
        var timeString =
            DateTime.now().microsecondsSinceEpoch.toString().substring(4);

        sizeOfIngredientVO = RequestSizeObjectVO(
          timeStamp: timeString,
          sellPrice: sellPrice,
          deliPrice: deliPrice,
          size: size,
          ingredients: requestIngredientList,
        );
        _notifySafely();
        _multiPosRepoModel.saveSizeWithIngredientItem(sizeOfIngredientVO);
      }
      return Future.value();
    } else {
      Functions.toast(msg: "Size and price fields required", status: false);
      return Future.error("error");
    }
  }

  void onChangeSize(String size) {
    this.size = size;
    _notifySafely();
  }

  void onChangeSellPrice(String sellPrice) {
    this.sellPrice = int.parse(sellPrice);
    _notifySafely();
  }

  void onChangeDeliPrice(String deliPrice) {
    this.deliPrice = int.parse(deliPrice);
    _notifySafely();
  }

  void onChangeRawMaterial(String rawMaterial) {
    rawMaterialName = rawMaterial;
    _notifySafely();
    List<RawMaterialVO> list = rawMaterialList
            ?.where((element) => element.name == rawMaterial)
            .toList() ??
        [];
    if (list.isNotEmpty) {
      list.take(1);
      RawMaterialVO rawMaterialVO = list.elementAt(0);
      rawMaterialId = rawMaterialVO.id;
      _notifySafely();
    }
  }

  void onChangeAmount(String amount) {
    this.amount = int.parse(amount);
    _notifySafely();
  }

  void onChangeUnitName(String unitName) {
    this.unitName = unitName;
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
    focusNodeAmount?.dispose();
    focusNodeSellPrice?.dispose();
    focusNodeDeliPrice?.dispose();
  }
}
