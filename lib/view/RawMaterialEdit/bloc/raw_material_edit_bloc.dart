import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/vos/brand_vo.dart';
import '../../../data/vos/supplier_vo.dart';
import '../../../data/vos/request_update_raw_material_vo.dart';

class RawMaterialEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  String? extraToppingName;
  String? supplierName;
  String? brandName;

  List<SupplierVO>? supplierList = [];
  List<CategoryVO>? categoryList = [];
  List<BrandVO>? brandList = [];
  List<String> categoryNameList = [];
  List<String> supplierNameList = [];
  List<String> brandNameList = [];

  int? rawMaterialId;
  String? name;
  int? categoryId;
  int? brandId;
  int? supplierId;
  int? inStockQty;
  String? unit;
  int? reorderQty;
  int? purchasePrice;
  String? currency;
  int? toppingFlag;
  int? toppingSalesAmount;
  int? toppingSalesPrice;
  int? toppingDeliPrice;
  File? toppingPhotoPath;
  String? url;
  int? specialFlag;
  String? createdAt;
  String? updatedAt;
  int? specialGroupValue;
  int? toppingGroupValue;

  String? brandDropDownValue;
  bool? added;
  bool? create;
  RawMaterialVO? rawMaterialVO;
  bool isSuccessEdit = false;

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();
  FocusNode seventhFocusNode = FocusNode();

  RawMaterialEditBloc(RawMaterialVO? rawMaterialVO) {
    _showLoading();
    if (rawMaterialVO != null) {
      _prePopulateBeforeEdit(rawMaterialVO).then((value) {
        _hideLoading();
      });
    }

    // _multiPosRepoModel.postCategoryListResponse().then((response) {
    //   categoryList = response.categories;
    //   categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
    //   categoryNameList = categoryList?.map((e) => e.name ?? "").toList() ?? [];

    //   _multiPosRepoModel.postSupplierListResponse().then((response) {
    //     supplierList = response.suppliers;
    //     supplierList?.sort((a, b) => b.id!.compareTo(a.id!));
    //     supplierNameList =
    //         supplierList?.map((e) => e.name ?? "").toList() ?? [];
    //     _notifySafely();

    //     _multiPosRepoModel.postBrandListResponse().then((response) async {
    //       brandList = response.brands;
    //       brandList?.sort((a, b) => b.id!.compareTo(a.id!));
    //       brandNameList = brandList?.map((e) => e.name ?? "").toList() ?? [];
    //       _notifySafely();
    //     });
    //   });
    // });
    _notifySafely();
  }

  Future _prePopulateBeforeEdit(RawMaterialVO? rawMaterialVO) async {
    this.rawMaterialVO = rawMaterialVO;
    rawMaterialId = this.rawMaterialVO?.id;
    name = this.rawMaterialVO?.name;
    categoryId = this.rawMaterialVO?.categoryId;
    brandId = this.rawMaterialVO?.brandId;
    supplierId = this.rawMaterialVO?.supplierId;
    inStockQty = this.rawMaterialVO?.inStockQty;
    reorderQty = this.rawMaterialVO?.reorderQty;
    unit = this.rawMaterialVO?.unit;
    purchasePrice = this.rawMaterialVO?.purchasePrice;
    currency = this.rawMaterialVO?.currency;
    specialFlag = this.rawMaterialVO?.specialFlag;
    toppingFlag = this.rawMaterialVO?.toppingFlag;
    toppingSalesAmount = this.rawMaterialVO?.toppingSalesAmount;
    toppingSalesPrice = this.rawMaterialVO?.toppingSalesPrice;
    toppingDeliPrice = this.rawMaterialVO?.toppingDeliPrice;
    toppingFlag == 1 ? toppingGroupValue = 0 : toppingGroupValue = 1;
    specialFlag == 1 ? specialGroupValue = 0 : specialGroupValue = 1;
    await _prePopulateBrandList(brandId);
    await prePopulateCategoryList(categoryId);
    await prePopulateSupplierList(supplierId);
    _notifySafely();
  }

  Future onTapEdit() async {
    _showLoading();
    if (name != null &&
        name != "" &&
        categoryId != null &&
        supplierId != null &&
        inStockQty != null &&
        reorderQty != null &&
        purchasePrice != null) {
      RequestUpdateRawMaterialVO requestUpdateRawMaterialVO =
          RequestUpdateRawMaterialVO(
              rawMaterialId: rawMaterialId,
              name: name,
              categoryId: categoryId,
              brandId: brandId,
              supplierId: supplierId,
              instockQty: inStockQty,
              reorderQty: reorderQty,
              unit: unit ?? "",
              purchasePrice: purchasePrice,
              currency: currency,
              specialFlag: specialFlag,
              toppingFlag: 0,
              toppingSalesPrice: 67,
              toppingDeliPrice: toppingDeliPrice);
      await _multiPosRepoModel
          .postRawMaterialUpdateResponse(requestUpdateRawMaterialVO)
          .then((value) {
        isSuccessEdit = true;
        _notifySafely();
      }).onError((error, stackTrace) {
        debugPrint("$error/$stackTrace");
      });
      if (isSuccessEdit) {
        return Future.value();
      }
      return Future.error("error");
    } else {
      _hideLoading();
      return Future.error("Fail to edit");
    }
  }

  void onTapAdd() {
    this.added = true;
    _notifySafely();
    if (toppingSalesAmount != null &&
        toppingSalesPrice != null &&
        toppingDeliPrice != null) {
      toppingFlag = 1;
      _notifySafely();
    }
  }

  void onChangedName(String name) {
    Functions.toast(
        msg: "$name $extraToppingName $brandName $supplierName $inStockQty");
    this.name = name;
    _notifySafely();
  }

  void onChangedInStockQty(String inStockQty) {
    this.inStockQty = int.parse(inStockQty);
    _notifySafely();
  }

  void onChangedPurchasePrice(String purchasePrice) {
    this.purchasePrice = int.parse(purchasePrice);
    _notifySafely();
  }

  void onChangedReorderLevel(String reorderLevel) {
    this.reorderQty = int.parse(reorderLevel);
    _notifySafely();
  }

  void onChangedToppingDeliPrice(int price) {
    this.toppingDeliPrice = price;
    _notifySafely();
  }

  void onChangedNormalPrice(int price) {
    this.toppingSalesPrice = price;
    _notifySafely();
  }

  void onChangedAmount(int amount) {
    this.toppingSalesAmount = amount;
    _notifySafely();
  }

  void onChangeUnit(String? unit) {
    this.unit = unit;
    _notifySafely();
  }

  void onTapCancelToppingAddition() {
    toppingDeliPrice = null;
    toppingSalesPrice = null;
    toppingSalesAmount = null;
    toppingFlag = 0;
    _notifySafely();
  }

  void onChangedCategoryName(String name) {
    for (var i = 0; i < categoryList!.length; i++) {
      if (categoryList![i].name == name) {
        categoryId = categoryList![i].id;
        extraToppingName = categoryList![i].name;
        _notifySafely();
        break;
      }
    }
  }

  void onChangedSupplierName(String name) {
    for (var i = 0; i < supplierList!.length; i++) {
      if (supplierList![i].name == name) {
        supplierId = supplierList![i].id;
        supplierName = supplierList![i].name;
        _notifySafely();
        break;
      }
    }
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
    firstFocusNode.unfocus();
    secondFocusNode.unfocus();
    thirdFocusNode.unfocus();
    fourthFocusNode.unfocus();
    _notifySafely();
  }

  void onFifthEditingComplete() {
    fifthFocusNode.unfocus();
    sixthFocusNode.requestFocus();
    _notifySafely();
  }

  void onSixthEditingComplete() {
    sixthFocusNode.unfocus();
    seventhFocusNode.requestFocus();
    _notifySafely();
  }

  void onSeventhEditingComplete() {
    firstFocusNode.unfocus();
    secondFocusNode.unfocus();
    thirdFocusNode.unfocus();
    fourthFocusNode.unfocus();
    fifthFocusNode.unfocus();
    sixthFocusNode.unfocus();
    seventhFocusNode.unfocus();
    _notifySafely();
  }

  // void onChangedBrandName(String? name) {
  //   for (var i = 0; i < brandList!.length; i++) {
  //     if (brandList![i].name == name) {
  //       brandId = brandList![i].id;
  //       brandName = brandList![i].name;
  //       _notifySafely();
  //       break;
  //     }
  //   }
  //   _notifySafely();
  // }

  // void _brandIdToName(int? id) {
  //   for (var i = 0; i < brandList!.length; i++) {
  //     if (brandList![i].id == id) {
  //       brandName = brandList![i].name;
  //       _notifySafely();
  //       break;
  //     }
  //   }
  //   _notifySafely();
  // }

  Future prePopulateCategoryList(int? id) async {
    await _multiPosRepoModel.postCategoryListResponse().then((response) {
      categoryList = response.categories;
      categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
      categoryNameList = categoryList?.map((e) => e.name ?? "").toList() ?? [];

      for (var i = 0; i < categoryList!.length; i++) {
        if (categoryList![i].id == id) {
          extraToppingName = categoryList![i].name;
          _notifySafely();
          break;
        }
      }
      _notifySafely();
    });
  }

  Future prePopulateSupplierList(int? id) async {
    await _multiPosRepoModel.postSupplierListResponse().then((response) {
      supplierList = response.suppliers;
      supplierList?.sort((a, b) => b.id!.compareTo(a.id!));
      supplierNameList = supplierList?.map((e) => e.name ?? "").toList() ?? [];

      for (var i = 0; i < supplierList!.length; i++) {
        if (supplierList![i].id == id) {
          supplierName = supplierList![i].name;
          _notifySafely();
          break;
        }
      }
      _notifySafely();
    });
  }

  Future _prePopulateBrandList(int? id) async {
    await _multiPosRepoModel.postBrandListResponse().then((response) {
      brandList = response.brands;
      brandList?.sort((a, b) => b.id!.compareTo(a.id!));
      brandNameList = brandList?.map((e) => e.name ?? "").toList() ?? [];
      _notifySafely();

      for (var i = 0; i < brandList!.length; i++) {
        if (brandList![i].id == id) {
          brandName = brandList![i].name;
          _notifySafely();
          break;
        }
      }
    });
  }

  void onChooseFlag(int? gpValue) {
    this.toppingGroupValue = gpValue;
    _notifySafely();
    if (gpValue == 0) {
      return;
    } else {
      toppingDeliPrice = null;
      toppingSalesPrice = null;
      toppingSalesAmount = null;
      toppingFlag = 0;
      _notifySafely();
    }
  }

  void onChooseSpecialFlag(int? gpValue) {
    this.specialGroupValue = gpValue;
    _notifySafely();
    if (gpValue == 0) {
      this.specialFlag = 1;
      _notifySafely();
    } else {
      this.specialFlag = 0;
      _notifySafely();
    }
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
