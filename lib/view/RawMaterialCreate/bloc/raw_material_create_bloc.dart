// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
// import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
// import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
// import 'package:multipurpose_pos_application/core/core_function/functions.dart';
// import '../../../data/vos/request_raw_material_vo.dart';
// import '../../../data/vos/request_update_category_vo.dart';
// import '../../../data/vos/supplier_vo.dart';

// class RawMaterialCreateBloc extends ChangeNotifier {
//   /// Bloc state
//   bool isDisposed = false;

//   /// Dependencies
//   final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

//   /// Loading State
//   bool isLoading = false;

//   /// Screen States
//   String? extraToppingName;
//   String? supplierName;

//   List<SupplierVO>? supplierList = [];
//   List<CategoryVO>? categoryList = [];
//   List<String> categoryNameList = [];
//   List<String> supplierNameList = [];

//   int? rawMaterialId;
//   String? name;
//   int? categoryId;
//   int? brandId;
//   int? supplierId;
//   int? inStockQty;
//   String? unit;
//   int? reorderQty;
//   int? purchasePrice;
//   String? currency;
//   int? toppingFlag;
//   int? toppingSalesAmount;
//   int? toppingSalesPrice;
//   int? toppingDeliPrice;
//   File? toppingPhotoPath;
//   String? url;
//   int? specialFlag;
//   String? createdAt;
//   String? updatedAt;
//   int? specialGroupValue;
//   int? toppingGroupValue;
//   var brandNameList;

//   // bool? added;
//   // bool? create;

//   FocusNode firstFocusNode = FocusNode();
//   FocusNode secondFocusNode = FocusNode();
//   FocusNode thirdFocusNode = FocusNode();
//   FocusNode fourthFocusNode = FocusNode();
//   FocusNode fifthFocusNode = FocusNode();
//   FocusNode sixthFocusNode = FocusNode();
//   FocusNode seventhFocusNode = FocusNode();

//   RawMaterialCreateBloc() {
//     _showLoading();
//     _multiPosRepoModel.postSupplierListResponse().then((response) {
//       supplierList = response.suppliers;
//       supplierList?.sort((a, b) => b.id!.compareTo(a.id!));
//       supplierNameList = supplierList?.map((e) => e.name ?? "").toList() ?? [];

//       _multiPosRepoModel.postCategoryListResponse().then((response) {
//         categoryList = response.categories;
//         categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
//         categoryNameList =
//             categoryList?.map((e) => e.name ?? "").toList() ?? [];
//         _notifySafely();
//         _multiPosRepoModel.postBrandListResponse().then((value) {
//           this.brandNameList = value.brands?.map((e) => e.name).toList();
//           _notifySafely();
//           _hideLoading();
//         });
//       });
//     });
//   }

//   Future onTapCreate() {
//     _showLoading();
//     if (name != null &&
//         name != "" &&
//         categoryId != null &&
//         supplierId != null &&
//         inStockQty != null &&
//         reorderQty != null &&
//         purchasePrice != null) {
//       RequestRawMaterialVO requestRawMaterialVO = RequestRawMaterialVO(
//           name: name,
//           categoryId: categoryId,
//           brandId: 0,
//           supplierId: supplierId,
//           inStockQty: inStockQty,
//           reorderQty: reorderQty,
//           unit: unit ?? "liter",
//           purchasePrice: purchasePrice,
//           currency: "mmk",
//           specialFlag: specialFlag,
//           toppingFlag: toppingFlag,
//           toppingSalesAmount: toppingSalesAmount ?? 1,
//           toppingSalesPrice: toppingSalesPrice ?? 0,
//           toppingDeliPrice: toppingDeliPrice ?? 0,
//           toppingPhotoPath: toppingPhotoPath ?? File(""));
//       return _multiPosRepoModel
//           .postMaterialCreateResponse(requestRawMaterialVO)
//           .then((value) => _hideLoading());
//     } else {
//       _hideLoading();
//       return Future.error("Fail to add category");
//     }
//   }

//   void onTapAdd() {
//     if (toppingSalesAmount != null &&
//         toppingSalesPrice != null &&
//         toppingDeliPrice != null) {
//       toppingFlag = 1;
//       _notifySafely();
//     }
//   }

//   void onChangedName(String name) {
//     this.name = name;
//     _notifySafely();
//   }

//   void onChangedInStockQty(String inStockQty) {
//     this.inStockQty = int.parse(inStockQty);
//     _notifySafely();
//   }

//   void onChangedPurchasePrice(String purchasePrice) {
//     this.purchasePrice = int.parse(purchasePrice);
//     _notifySafely();
//   }

//   void onChangedReorderLevel(String reorderLevel) {
//     this.reorderQty = int.parse(reorderLevel);
//     _notifySafely();
//   }

//   void onChangedToppingDeliPrice(int price) {
//     this.toppingDeliPrice = price;
//     _notifySafely();
//   }

//   void onChangedNormalPrice(int price) {
//     this.toppingSalesPrice = price;
//     _notifySafely();
//   }

//   void onChangedAmount(int amount) {
//     this.toppingSalesAmount = amount;
//     _notifySafely();
//   }

//   void onChangeUnit(String? unit) {
//     this.unit = unit;
//     _notifySafely();
//   }

//   void onTapCancelToppingAddition() {
//     toppingDeliPrice = null;
//     toppingSalesPrice = null;
//     toppingSalesAmount = null;
//     toppingFlag = 0;
//     _notifySafely();
//   }

//   void onChangedCategoryName(String name) {
//     for (var i = 0; i < categoryList!.length; i++) {
//       if (categoryList![i].name == name) {
//         categoryId = categoryList![i].id;
//         extraToppingName = categoryList![i].name;
//         _notifySafely();
//         break;
//       }
//     }
//   }

//   void onChangedSupplierName(String name) {
//     for (var i = 0; i < supplierList!.length; i++) {
//       if (supplierList![i].name == name) {
//         supplierId = supplierList![i].id;
//         supplierName = supplierList![i].name;
//         _notifySafely();
//         break;
//       }
//     }
//   }

//   Future<void> pickImage() async {
//     final imagePicker = ImagePicker();
//     final pickedImage =
//         await imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       this.toppingPhotoPath = File(pickedImage.path);
//     }
//     _notifySafely();
//   }

//   void onFirstEditingComplete() {
//     secondFocusNode.requestFocus();
//     _notifySafely();
//   }

//   void onSecondEditingComplete() {
//     thirdFocusNode.requestFocus();
//     _notifySafely();
//   }

//   void onThirdEditingComplete() {
//     fourthFocusNode.requestFocus();
//     _notifySafely();
//   }

//   void onFourthEditingComplete() {
//     firstFocusNode.unfocus();
//     secondFocusNode.unfocus();
//     thirdFocusNode.unfocus();
//     fourthFocusNode.unfocus();
//     _notifySafely();
//   }

//   void onFifthEditingComplete() {
//     fifthFocusNode.unfocus();
//     sixthFocusNode.requestFocus();
//     _notifySafely();
//   }

//   void onSixthEditingComplete() {
//     sixthFocusNode.unfocus();
//     seventhFocusNode.requestFocus();
//     _notifySafely();
//   }

//   void onSeventhEditingComplete() {
//     firstFocusNode.unfocus();
//     secondFocusNode.unfocus();
//     thirdFocusNode.unfocus();
//     fourthFocusNode.unfocus();
//     fifthFocusNode.unfocus();
//     sixthFocusNode.unfocus();
//     seventhFocusNode.unfocus();
//     _notifySafely();
//   }

//   void onChooseFlag(int? groupValue) {
//     this.toppingGroupValue = groupValue;
//     _notifySafely();

//     // this.toppingFlag = flag;
//     // if (this.toppingFlag == 1) {}
//     // _notifySafely();
//   }

//   void onChooseSpecialFlag(int? groupValue) {
//     this.specialGroupValue = groupValue;
//     _notifySafely();
//   }

//   void _showLoading() {
//     isLoading = true;
//     _notifySafely();
//   }

//   void _hideLoading() {
//     isLoading = false;
//     _notifySafely();
//   }

//   void _notifySafely() {
//     if (!isDisposed) {
//       notifyListeners();
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     isDisposed = true;
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import '../../../data/vos/brand_vo.dart';
import '../../../data/vos/request_raw_material_vo.dart';
import '../../../data/vos/request_update_category_vo.dart';
import '../../../data/vos/supplier_vo.dart';

class RawMaterialCreateBloc extends ChangeNotifier {
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
  List<String>? brandNameList = [];

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

  bool? added;
  bool? create;

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();
  FocusNode seventhFocusNode = FocusNode();

  RawMaterialCreateBloc() {
    _showLoading();
    _multiPosRepoModel.postSupplierListResponse().then((response) {
      supplierList = response.suppliers;
      supplierList?.sort((a, b) => b.id!.compareTo(a.id!));
      supplierNameList = supplierList?.map((e) => e.name ?? "").toList() ?? [];

      _multiPosRepoModel.postCategoryListResponse().then((response) {
        categoryList = response.categories;
        categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
        categoryNameList =
            categoryList?.map((e) => e.name ?? "").toList() ?? [];

        _multiPosRepoModel.postBrandListResponse().then((response) {
          brandList = response.brands;
          brandList?.sort((a, b) => b.id!.compareTo(a.id!));
          brandNameList = brandList?.map((e) => e.name ?? "").toList() ?? [];

          _notifySafely();
          _hideLoading();
        });
      });
    });
  }

  Future onTapCreate() {
    _showLoading();
    if (name != null &&
        name != "" &&
        categoryId != null &&
        supplierId != null &&
        inStockQty != null &&
        reorderQty != null &&
        purchasePrice != null) {
      Functions.toast(msg: "$toppingFlag");
      RequestRawMaterialVO requestRawMaterialVO = RequestRawMaterialVO(
          name: name,
          categoryId: categoryId,
          brandId: brandId ?? 0,
          supplierId: supplierId,
          inStockQty: inStockQty,
          reorderQty: reorderQty,
          unit: unit ?? "liter",
          purchasePrice: purchasePrice,
          currency: "mmk",
          specialFlag: specialFlag ?? 0,
          toppingFlag: toppingFlag ?? 0,
          toppingSalesAmount: toppingSalesAmount ?? 1,
          toppingSalesPrice: toppingSalesPrice ?? 0,
          toppingDeliPrice: toppingDeliPrice ?? 0,
          toppingPhotoPath: toppingPhotoPath ?? File(""));
      return _multiPosRepoModel
          .postMaterialCreateResponse(requestRawMaterialVO)
          .then((value) => _hideLoading());
    } else {
      _hideLoading();
      return Future.error(
          "Fail to add category\nmake sure to fill all the required info");
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
    } else {
      toppingGroupValue = 1;
      _notifySafely();
    }
  }

  void onChangedName(String name) {
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
    toppingGroupValue = 1;
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

  void onChangedBrandName(String? name) {
    for (var i = 0; i < brandList!.length; i++) {
      if (brandList![i].name == name) {
        brandId = brandList![i].id;
        brandName = brandList![i].name;
        _notifySafely();
        break;
      }
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      this.toppingPhotoPath = File(pickedImage.path);
    }
    _notifySafely();
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
    fifthFocusNode.unfocus();
    sixthFocusNode.unfocus();
    seventhFocusNode.unfocus();
    _notifySafely();
  }

  void onChooseFlag(int? gpValue) {
    this.toppingGroupValue = gpValue;
    Functions.toast(msg: "$toppingFlag");
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
