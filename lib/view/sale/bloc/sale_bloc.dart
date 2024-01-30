import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/customer_vo.dart';
import 'package:multipurpose_pos_application/data/vos/option_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_id_for_option_list_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/promotion_vo.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';

import '../../../data/vos/option_vo.dart';

class SaleBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Screen states
  List<ProductVO>? productList = [];
  List<ProductVO>? selectedProductList = [];
  List<RawMaterialVO>? rawMaterialList = [];
  FocusNode focusNode = FocusNode();
  int? radioValue = 1;
  int? displayTotalQuantity = 0;
  double? displayTotalAmount = 0;

  ///  double? displayTotalPop = 0;
  int productCheckIdIndex = 0;
  List<RequestToppingVO?>? requestToppingList;
  List<RequestToppingVO>? _addToppingList;
  List<CustomerVO>? customerList = [];
  List<PromotionVO>? promotionList = [];
  String? search;

  String? backDate;
  int? backDateFlag = 0;
  int? customerId;
  PromotionVO? promotionVO;

  String sugar = "normal";
  String ice = "normal";
  String? remark;
  String? special;
  FocusNode? focusNodeRemark = FocusNode();

  SaleBloc() {
    _showLoading();
    _multiPosRepoModel.postRawMaterialResponse().then((value) {
      rawMaterialList = value.rawMaterials
          ?.where((element) => element.toppingFlag == 1)
          .toList();
      _notifySafely();
      _multiPosRepoModel.postCustomerListResponse().then((response) {
        customerList = response.customers;
        _notifySafely();
        _multiPosRepoModel.postPromotionListResponse().then((response) {
          promotionList = response.promotions;
          var formatter = DateFormat('yyyy-MM-dd').format(DateTime.now());
          backDate = formatter;
          _notifySafely();
          _multiPosRepoModel.postProductListResponse().then((value) {
            productList = value.products;
            productList
                ?.sort((a, b) => a.displayIndex!.compareTo(b.displayIndex!));
            productList?.forEach((element) {
              element.optionList = null;
              element.optionName = null;
              element.optionId = null;
              element.optionFlag = 0;
              _notifySafely();
            });
            _notifySafely();
            _hideLoading();
            //_multiPosRepoModel.saveAllProducts(event);
          });
        });
      });
    });

    ///
    // _multiPosRepoModel.getAllProducts().listen((event) {
    //   productList = event;
    //   productList?.sort((a, b) => a.displayIndex!.compareTo(b.displayIndex!));
    //   _notifySafely();
    //
    //   if (event?.length == 0) {
    //     _multiPosRepoModel.postProductListResponse().then((value) {
    //       productList = value.products;
    //       productList
    //           ?.sort((a, b) => a.displayIndex!.compareTo(b.displayIndex!));
    //       _notifySafely();
    //
    //       productList?.forEach((element) {
    //         element.optionList = null;
    //         element.optionName = null;
    //         element.optionId = null;
    //         element.optionFlag = 0;
    //         _notifySafely();
    //       });
    //       _multiPosRepoModel.saveAllProducts(event);
    //     });
    //   }
    //   productList?.forEach((element) {
    //     element.optionList = null;
    //     element.optionName = null;
    //     element.optionId = null;
    //     element.optionFlag = 0;
    //     _notifySafely();
    //   });
    //
    //   _multiPosRepoModel.postRawMaterialResponse().then((value) {
    //     rawMaterialList = value.rawMaterials
    //         ?.where((element) => element.toppingFlag == 1)
    //         .toList();
    //     _notifySafely();
    //     _multiPosRepoModel.postCustomerListResponse().then((response) {
    //       customerList = response.customers;
    //       _notifySafely();
    //       _multiPosRepoModel.postPromotionListResponse().then((response) {
    //         promotionList = response.promotions;
    //         var formatter = DateFormat('yyyy-MM-dd').format(DateTime.now());
    //         backDate = formatter;
    //         _notifySafely();
    //
    //         _multiPosRepoModel.postProductListResponse().then((value) {
    //           productList = value.products;
    //           productList
    //               ?.sort((a, b) => a.displayIndex!.compareTo(b.displayIndex!));
    //           _notifySafely();
    //
    //           productList?.forEach((element) {
    //             element.optionList = null;
    //             element.optionName = null;
    //             element.optionId = null;
    //             element.optionFlag = 0;
    //             _notifySafely();
    //           });
    //           _hideLoading();
    //           //_multiPosRepoModel.saveAllProducts(event);
    //         });
    //       });
    //     });
    //   });
    // });
  }

  void onChangeTextField(String search) {
    this.search = search;
    _notifySafely();
  }

  void onSearchEditComplete() {
    if (search != null && search != "") {
      var pList = productList
          ?.where((element) => element.name?.contains(search!) ?? false)
          .toList();
      productList = pList;
      _notifySafely();
    } else {
      _multiPosRepoModel.postProductListResponse().then((value) {
        productList = value.products;
        _notifySafely();
      });
    }
  }

  void onTapCrossCardSelection() {
    customerId = null;
    promotionVO = null;
    backDateFlag = 0;
    var formatter = DateFormat('yyyy-MM-dd').format(DateTime.now());
    backDate = formatter;
    _notifySafely();
  }

  Future onTapPromotion() {
    if (promotionVO != null) {
      return Future.value();
    } else {
      return Future.error("e");
    }
  }

  void onChooseSugarLevel(int? value) {
    if (value == 1) {
      sugar = "low";
      _notifySafely();
    } else if (value == 2) {
      sugar = "normal";
      _notifySafely();
    } else {
      sugar = "high";
      _notifySafely();
    }
  }

  void onChooseIce(int? value) {
    if (value == 1) {
      ice = "low";
      _notifySafely();
    } else if (value == 2) {
      ice = "normal";
      _notifySafely();
    } else {
      ice = "high";
      _notifySafely();
    }
  }

  void onChangeRemark(String? remark) {
    this.remark = remark;
    _notifySafely();
  }

  void onTapSpecialAdd(int index) {
    special = (remark != null && remark != "")
        ? "sugar-$sugar \n ice-$ice ($remark)"
        : "sugar-$sugar \n ice-$ice";
    selectedProductList?[index].specialRemark = special;
    onTapCrossSpecial();
    _notifySafely();
  }

  void onEditingCompleteRemark() {
    focusNodeRemark?.unfocus();
    _notifySafely();
  }

  void onTapCrossSpecial() {
    sugar = "normal";
    ice = "normal";
    remark = null;
    _notifySafely();
  }

  Future onTapDirect() {
    return Future.value();
  }

  void onChooseBackDate(String backDate) {
    this.backDate = backDate;
    _notifySafely();
  }

  void onChooseCustomerName(String customerName) {
    var list = customerList
            ?.where((element) => element.name == customerName)
            .toList() ??
        [];
    if (list.length != 0) {
      list.take(1);
      var customerVO = list.elementAt(0);
      customerId = customerVO.id;
      _notifySafely();
    }
  }

  void onChooseDateRadio(int? dateValue) {
    if (dateValue == 1) {
      backDateFlag = 0;
      _notifySafely();
    } else {
      backDateFlag = 1;
      _notifySafely();
    }
  }

  void onChoosePromotion(String promotion) {
    var list =
        promotionList?.where((element) => element.name == promotion).toList() ??
            [];
    if (list.length != 0 && list != [] && list.isNotEmpty) {
      list.take(1);
      promotionVO = list.elementAt(0);
      _notifySafely();
    }
  }

  void onEditingComplete() {
    focusNode.unfocus();
  }

  void _assignDeliPrice() {
    selectedProductList?.forEach((selectedProduct) {
      List<RequestSizeObjectVO?>? requestSizeObjectList = selectedProduct
          .sizeOfIngredient
          ?.where((element) => element.size == selectedProduct.selectedSize)
          .toList();
      requestSizeObjectList?.take(1);
      if (requestSizeObjectList?.length != 0) {
        RequestSizeObjectVO? requestSizeObject =
            requestSizeObjectList?.elementAt(0);

        /// only product's price and quantity
        var productDeliPrice = requestSizeObject?.deliPrice ?? 0;
        var productQuantity = selectedProduct.quantity ?? 1;
        selectedProduct.selectedPrice = productDeliPrice;

        /// pop not included
        var deliTotalPriceWithoutPopping =
            (productDeliPrice * productQuantity).toDouble();
        selectedProduct.totalForOnlyItem = deliTotalPriceWithoutPopping;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalForOnlyItem!);
        _notifySafely();

        /// pop included
        if (selectedProduct.toppingList?.length != 0 &&
            selectedProduct.toppingList != [] &&
            selectedProduct.toppingList != null) {
          selectedProduct.toppingList?.forEach((topping) {
            var varDeliPrice = topping.deliPrice ?? 0;
            var varQty = topping.rawMaterialQuantity ?? 1;
            var toppingDeliTotal = varDeliPrice * varQty;
            topping.rawMaterialPrice = varDeliPrice;
            topping.totalAmount = toppingDeliTotal;
            _notifySafely();
          });

          var totalPopPrice = selectedProduct.toppingList?.fold(
                  0,
                  (previousValue, element) =>
                      previousValue + element.totalAmount!) ??
              0;

          /// pop
          var deliTotalPriceWithPopping =
              ((productDeliPrice + totalPopPrice) * productQuantity).toDouble();
          selectedProduct.totalToppingPrice = totalPopPrice.toDouble();
          selectedProduct.totalBothCardAndTopping = deliTotalPriceWithPopping;
          displayTotalAmount = selectedProductList?.fold(
              0,
              (previousValue, element) =>
                  previousValue! + element.totalBothCardAndTopping!);
          _notifySafely();
          // displayTotalPop =
          //     selectedProductList?.fold(0, (previousValue, element) {
          //   var subTopTotal = previousValue! + element.totalToppingPrice!;
          //   var qty = element.quantity ?? 1;
          //   return subTopTotal * qty;
          // });
        } else {
          selectedProduct.totalBothCardAndTopping =
              selectedProduct.totalForOnlyItem;
          displayTotalAmount = selectedProductList?.fold(
              0,
              (previousValue, element) =>
                  previousValue! + element.totalBothCardAndTopping!);
          _notifySafely();
        }
      }
    });
  }

  void _assignSellPrice() {
    selectedProductList?.forEach((selectedProduct) {
      List<RequestSizeObjectVO?>? requestSizeObjectList = selectedProduct
          .sizeOfIngredient
          ?.where((element) => element.size == selectedProduct.selectedSize)
          .toList();
      requestSizeObjectList?.take(1);
      if (requestSizeObjectList?.length != 0) {
        RequestSizeObjectVO? requestSizeObject =
            requestSizeObjectList?.elementAt(0);

        /// only product's price and quantity
        var productSellPrice = requestSizeObject?.sellPrice ?? 0;
        var productQuantity = selectedProduct.quantity ?? 1;
        selectedProduct.selectedPrice = productSellPrice;

        /// pop not included
        var sellTotalPriceWithoutPopping =
            (productSellPrice * productQuantity).toDouble();
        selectedProduct.totalForOnlyItem = sellTotalPriceWithoutPopping;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalForOnlyItem!);
        _notifySafely();

        /// pop included
        if ((selectedProduct.toppingList?.length != 0 &&
            selectedProduct.toppingList != [] &&
            selectedProduct.toppingList != null)) {
          selectedProduct.toppingList?.forEach((topping) {
            var varSalePrice = topping.salePrice ?? 0;
            var varQty = topping.rawMaterialQuantity ?? 1;
            var toppingSaleTotal = varSalePrice * varQty;
            topping.rawMaterialPrice = varSalePrice;
            topping.totalAmount = toppingSaleTotal;
            _notifySafely();
          });
          var totalPopPrice = selectedProduct.toppingList?.fold(
                  0,
                  (previousValue, element) =>
                      previousValue + element.totalAmount!) ??
              0;

          /// pop
          var sellTotalPriceWithPopping =
              ((productSellPrice + totalPopPrice) * productQuantity).toDouble();
          selectedProduct.totalToppingPrice = totalPopPrice.toDouble();
          selectedProduct.totalBothCardAndTopping = sellTotalPriceWithPopping;
          displayTotalAmount = selectedProductList?.fold(
              0,
              (previousValue, element) =>
                  previousValue! + element.totalBothCardAndTopping!);
          // displayTotalPop =
          //     selectedProductList?.fold(0, (previousValue, element) {
          //       var subTopTotal = previousValue! + element.totalToppingPrice!;
          //       var qty = element.quantity ?? 1;
          //       return subTopTotal * qty;
          //     });
          _notifySafely();
        } else {
          selectedProduct.totalBothCardAndTopping =
              selectedProduct.totalForOnlyItem;
          displayTotalAmount = selectedProductList?.fold(
              0,
              (previousValue, element) =>
                  previousValue! + element.totalBothCardAndTopping!);
          _notifySafely();
        }
      }
    });
  }

  void onChooseRadio(int? value) {
    radioValue = value;
    _notifySafely();
    if (radioValue == 1) {
      _assignSellPrice();
    } else {
      _assignDeliPrice();
    }
  }

  Future<ProductVO?> onTapOption(ProductVO? productVO) async {
    isApiCalling = true;
    _notifySafely();

    var productIdForOptionListVO = ProductIdForOptionListVO(
      productVO?.id,
    );
    await _multiPosRepoModel
        .postOptionList(productIdForOptionListVO)
        .then((response) {
      productVO?.optionList = response.options;
      productVO?.rawList = productVO.optionList
              ?.map((e) => e.rawMaterial?.name ?? "")
              .toList() ??
          [];
      isApiCalling = false;
      _notifySafely();
    });
    return productVO;
  }

  void onChooseOption(int? optionId, String? optionName,
      List<OptionVO>? optionList, int productIndex) {
    productList?[productIndex].optionList = optionList;
    productList?[productIndex].optionName = optionName;
    productList?[productIndex].optionId = optionId;
    productList?[productIndex].optionFlag = 1;
    _notifySafely();
  }

  void onTapCrossOption(int productIndex) {
    productList?[productIndex].optionList = null;
    productList?[productIndex].optionName = null;
    productList?[productIndex].optionId = null;
    productList?[productIndex].optionFlag = 0;
    _notifySafely();
  }

  void onTapAddProduct(ProductVO? product) {
    productCheckIdIndex++;

    /// assigned
    ProductVO? productVO = ProductVO(
        id: product?.id,
        name: (product?.optionName != null && product?.optionName != "")
            ? "${product?.name}\n(${product?.optionName})"
            : product?.name,
        index: productCheckIdIndex,
        selectedSize: product?.sizeOfIngredient?[0].size,
        quantity: 1,
        selectedPrice: (radioValue == 1)
            ? (product?.sizeOfIngredient?[0].sellPrice ?? 0)
            : (product?.sizeOfIngredient?[0].deliPrice ?? 0),
        sizeOfIngredient: product?.sizeOfIngredient,
        optionId: product?.optionId,
        optionFlag: product?.optionFlag,
        optionList: product?.optionList,
        optionName: product?.optionName,
        totalToppingPrice: 0.0);

    /// without popping
    var qty = productVO.quantity ?? 1;
    var selectedPrice = productVO.selectedPrice ?? 0;
    var total = (selectedPrice * qty).toDouble();
    productVO.totalForOnlyItem = total;
    productVO.totalBothCardAndTopping = total;

    /// add
    selectedProductList?.add(productVO);
    displayTotalQuantity = selectedProductList?.fold(
        0, (previousValue, element) => previousValue! + element.quantity!);
    displayTotalAmount = selectedProductList?.fold(
        0,
        (previousValue, element) =>
            previousValue! + element.totalBothCardAndTopping!);
    productList?.forEach((element) {
      element.optionList = null;
      element.optionName = null;
      element.optionId = null;
      element.optionFlag = 0;
      _notifySafely();
    });
    _notifySafely();
  }

  void onChooseTopping(String raw, int index) {
    var rawVOList =
        rawMaterialList?.where((element) => element.name == raw).toList();
    if (rawVOList?.length != 0 && rawVOList != [] && rawVOList != null) {
      rawVOList.take(1);
      var rawVO = rawVOList.elementAt(0);
      var toppingSale = rawVO.toppingSalesPrice ?? 0;
      var toppingDeli = rawVO.toppingDeliPrice ?? 0;
      var requestTopping = RequestToppingVO(
        rawMaterialId: rawVO.id,
        rawMaterialName: rawVO.name,
        rawMaterialPrice: (radioValue == 1) ? toppingSale : toppingDeli,
        salePrice: toppingSale,
        deliPrice: toppingDeli,
        rawMaterialQuantity: 1,
        totalAmount: (radioValue == 1) ? toppingSale : toppingDeli,
        itemId: selectedProductList?[index].id,
        itemCheckId: selectedProductList?[index].index,
        itemSize: selectedProductList?[index].selectedSize,
        optionId: selectedProductList?[index].optionId,
      );
      var list = selectedProductList?[index].toppingList ?? [];
      bool isContain = list.contains(requestTopping);
      if (isContain) {
        return;
      } else {
        list.add(requestTopping);
        _addToppingList = list;
        _notifySafely();
      }
    }
  }

  void _assignToppingList(int index) {
    if (_addToppingList?.length != 0 &&
        _addToppingList != [] &&
        _addToppingList != null) {
      selectedProductList?[index].toppingList = _addToppingList;

      var totalPopPrice = selectedProductList?[index].toppingList?.fold(
              0,
              (previousValue, element) =>
                  previousValue + element.totalAmount!) ??
          0;
      selectedProductList?[index].totalToppingPrice = totalPopPrice.toDouble();

      /// pop
      int productQuantity = selectedProductList?[index].quantity ?? 1;
      var selectedPrice = selectedProductList?[index].selectedPrice ?? 0;
      var sellTotalPriceWithPopping =
          ((selectedPrice + totalPopPrice) * productQuantity).toDouble();
      selectedProductList?[index].totalBothCardAndTopping =
          sellTotalPriceWithPopping;
      displayTotalAmount = selectedProductList?.fold(
          0,
          (previousValue, element) =>
              previousValue! + element.totalBothCardAndTopping!);
      // displayTotalPop =
      //     selectedProductList?.fold(0, (previousValue, element) {
      //       var subTopTotal = previousValue! + element.totalToppingPrice!;
      //       var qty = element.quantity ?? 1;
      //       return subTopTotal * qty;
      //     });
      _notifySafely();
    }
  }

  void onTapCross() {
    _addToppingList = null;
    _notifySafely();
  }

  void onTapAddTopping(int index) {
    _assignToppingList(index);
  }

  void onAddToppingQuantity(int productIndex, int toppingIndex) {
    var rawQty = selectedProductList?[productIndex]
            .toppingList?[toppingIndex]
            .rawMaterialQuantity ??
        1;
    rawQty++;
    selectedProductList?[productIndex]
        .toppingList?[toppingIndex]
        .rawMaterialQuantity = rawQty;
    var varSalePrice = selectedProductList?[productIndex]
            .toppingList?[toppingIndex]
            .salePrice ??
        0;
    var varDeliPrice = selectedProductList?[productIndex]
            .toppingList?[toppingIndex]
            .deliPrice ??
        0;
    var toppingSaleTotal = varSalePrice * rawQty;
    var toppingDeliTotal = varDeliPrice * rawQty;
    selectedProductList?[productIndex]
        .toppingList?[toppingIndex]
        .rawMaterialPrice = (radioValue == 1) ? varSalePrice : varDeliPrice;
    selectedProductList?[productIndex].toppingList?[toppingIndex].totalAmount =
        (radioValue == 1) ? toppingSaleTotal : toppingDeliTotal;
    var totalPopPrice = selectedProductList?[productIndex].toppingList?.fold(0,
            (previousValue, element) => previousValue + element.totalAmount!) ??
        0;
    selectedProductList?[productIndex].totalToppingPrice =
        totalPopPrice.toDouble();

    /// pop
    int productQuantity = selectedProductList?[productIndex].quantity ?? 1;
    var selectedPrice = selectedProductList?[productIndex].selectedPrice ?? 0;
    var sellTotalPriceWithPopping =
        ((selectedPrice + totalPopPrice) * productQuantity).toDouble();
    selectedProductList?[productIndex].totalBothCardAndTopping =
        sellTotalPriceWithPopping;
    displayTotalAmount = selectedProductList?.fold(
        0,
        (previousValue, element) =>
            previousValue! + element.totalBothCardAndTopping!);
    // displayTotalPop =
    //     selectedProductList?.fold(0, (previousValue, element) {
    //       var subTopTotal = previousValue! + element.totalToppingPrice!;
    //       var qty = element.quantity ?? 1;
    //       return subTopTotal * qty;
    //     });
    _notifySafely();
  }

  void onReduceToppingQuantity(int productIndex, int toppingIndex) {
    var rawQty = selectedProductList?[productIndex]
            .toppingList?[toppingIndex]
            .rawMaterialQuantity ??
        1;
    if (rawQty > 1) {
      rawQty--;
      selectedProductList?[productIndex]
          .toppingList?[toppingIndex]
          .rawMaterialQuantity = rawQty;
      _notifySafely();
      var varSalePrice = selectedProductList?[productIndex]
              .toppingList?[toppingIndex]
              .salePrice ??
          0;
      var varDeliPrice = selectedProductList?[productIndex]
              .toppingList?[toppingIndex]
              .deliPrice ??
          0;
      var toppingSaleTotal = varSalePrice * rawQty;
      var toppingDeliTotal = varDeliPrice * rawQty;
      selectedProductList?[productIndex]
          .toppingList?[toppingIndex]
          .rawMaterialPrice = (radioValue == 1) ? varSalePrice : varDeliPrice;
      selectedProductList?[productIndex]
              .toppingList?[toppingIndex]
              .totalAmount =
          (radioValue == 1) ? toppingSaleTotal : toppingDeliTotal;
      var totalPopPrice = selectedProductList?[productIndex].toppingList?.fold(
              0,
              (previousValue, element) =>
                  previousValue + element.totalAmount!) ??
          0;
      selectedProductList?[productIndex].totalToppingPrice =
          totalPopPrice.toDouble();

      /// pop
      int productQuantity = selectedProductList?[productIndex].quantity ?? 1;
      var selectedPrice = selectedProductList?[productIndex].selectedPrice ?? 0;
      var sellTotalPriceWithPopping =
          ((selectedPrice + totalPopPrice) * productQuantity).toDouble();
      selectedProductList?[productIndex].totalBothCardAndTopping =
          sellTotalPriceWithPopping;
      displayTotalAmount = selectedProductList?.fold(
          0,
          (previousValue, element) =>
              previousValue! + element.totalBothCardAndTopping!);
      // displayTotalPop =
      //     selectedProductList?.fold(0, (previousValue, element) {
      //       var subTopTotal = previousValue! + element.totalToppingPrice!;
      //       var qty = element.quantity ?? 1;
      //       return subTopTotal * qty;
      //     });
      _notifySafely();
    } else {
      selectedProductList?[productIndex].toppingList?.removeAt(toppingIndex);
      if (selectedProductList?[productIndex].toppingList != null &&
          selectedProductList?[productIndex].toppingList != [] &&
          selectedProductList?[productIndex].toppingList?.length != 0) {
        var totalPopPrice = selectedProductList?[productIndex]
                .toppingList
                ?.fold(
                    0,
                    (previousValue, element) =>
                        previousValue + element.totalAmount!) ??
            0;
        selectedProductList?[productIndex].totalToppingPrice =
            totalPopPrice.toDouble();

        /// pop
        int productQuantity = selectedProductList?[productIndex].quantity ?? 1;
        var selectedPrice =
            selectedProductList?[productIndex].selectedPrice ?? 0;
        var sellTotalPriceWithPopping =
            ((selectedPrice + totalPopPrice) * productQuantity).toDouble();
        selectedProductList?[productIndex].totalBothCardAndTopping =
            sellTotalPriceWithPopping;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalBothCardAndTopping!);
        // displayTotalPop =
        //     selectedProductList?.fold(0, (previousValue, element) {
        //       var subTopTotal = previousValue! + element.totalToppingPrice!;
        //       var qty = element.quantity ?? 1;
        //       return subTopTotal * qty;
        //     });
        _notifySafely();
      } else {
        // displayTotalPop = 0;
        selectedProductList?[productIndex].totalBothCardAndTopping =
            selectedProductList?[productIndex].totalForOnlyItem;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalBothCardAndTopping!);
        _notifySafely();
      }
    }
  }

  void onChooseProductSize(String size, int productIndex) {
    List<RequestSizeObjectVO?>? requestSizeObjectList =
        selectedProductList?[productIndex]
            .sizeOfIngredient
            ?.where((element) => element.size == size)
            .toList();
    requestSizeObjectList?.take(1);
    if (requestSizeObjectList != []) {
      RequestSizeObjectVO? requestSizeObject =
          requestSizeObjectList?.elementAt(0);

      var sellPrice = requestSizeObject?.sellPrice ?? 0;
      var deliPrice = requestSizeObject?.deliPrice ?? 0;
      var productQuantity = selectedProductList?[productIndex].quantity ?? 1;
      selectedProductList?[productIndex].selectedPrice =
          (radioValue == 1) ? sellPrice : deliPrice;
      selectedProductList?[productIndex].selectedSize = size;

      /// pop not included
      var sellTotalPriceWithoutPopping =
          (sellPrice * productQuantity).toDouble();
      var deliTotalPriceWithoutPopping =
          (deliPrice * productQuantity).toDouble();
      selectedProductList?[productIndex].totalForOnlyItem = (radioValue == 1)
          ? sellTotalPriceWithoutPopping
          : deliTotalPriceWithoutPopping;
      displayTotalAmount = selectedProductList?.fold(
          0,
          (previousValue, element) =>
              previousValue! + element.totalForOnlyItem!);
      _notifySafely();

      /// pop included
      if ((selectedProductList?[productIndex].toppingList?.length != 0 &&
          selectedProductList?[productIndex].toppingList != [] &&
          selectedProductList?[productIndex].toppingList != null)) {
        selectedProductList?[productIndex].toppingList?.forEach((topping) {
          var varSalePrice = topping.salePrice ?? 0;
          var varQty = topping.rawMaterialQuantity ?? 1;
          var toppingSaleTotal = varSalePrice * varQty;
          topping.rawMaterialPrice = varSalePrice;
          topping.totalAmount = toppingSaleTotal;
          _notifySafely();
        });
        var totalPopPrice = selectedProductList?[productIndex]
                .toppingList
                ?.fold(
                    0,
                    (previousValue, element) =>
                        previousValue + element.totalAmount!) ??
            0;

        /// pop
        var selectedProductPrice =
            selectedProductList?[productIndex].selectedPrice ?? 0;
        var selectedTotalPriceWithPopping =
            ((selectedProductPrice + totalPopPrice) * productQuantity)
                .toDouble();
        selectedProductList?[productIndex].totalToppingPrice =
            totalPopPrice.toDouble();
        selectedProductList?[productIndex].totalBothCardAndTopping =
            selectedTotalPriceWithPopping;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalBothCardAndTopping!);
        // displayTotalPop =
        //     selectedProductList?.fold(0, (previousValue, element) {
        //       var subTopTotal = previousValue! + element.totalToppingPrice!;
        //       var qty = element.quantity ?? 1;
        //       return subTopTotal * qty;
        //     });
        _notifySafely();
      } else {
        selectedProductList?[productIndex].totalBothCardAndTopping =
            selectedProductList?[productIndex].totalForOnlyItem;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalBothCardAndTopping!);
        _notifySafely();
      }
    }
  }

  void onTapQuantityAdd(int index) {
    int productQuantity = selectedProductList?[index].quantity ?? 1;
    productQuantity++;
    var selectedPrice = selectedProductList?[index].selectedPrice ?? 0;

    /// pop not included
    var total = (productQuantity * selectedPrice).toDouble();
    selectedProductList?[index].quantity = productQuantity;
    selectedProductList?[index].totalForOnlyItem = total;
    selectedProductList?[index].totalBothCardAndTopping = total;
    displayTotalQuantity = selectedProductList?.fold(
        0, (previousValue, element) => previousValue! + element.quantity!);
    displayTotalAmount = selectedProductList?.fold(
        0,
        (previousValue, element) =>
            previousValue! + element.totalBothCardAndTopping!);
    _notifySafely();

    /// pop included
    if ((selectedProductList?[index].toppingList?.length != 0 &&
        selectedProductList?[index].toppingList != [] &&
        selectedProductList?[index].toppingList != null)) {
      selectedProductList?[index].toppingList?.forEach((topping) {
        var varSalePrice = topping.salePrice ?? 0;
        var varQty = topping.rawMaterialQuantity ?? 1;
        var toppingSaleTotal = varSalePrice * varQty;
        topping.rawMaterialPrice = varSalePrice;
        topping.totalAmount = toppingSaleTotal;
        _notifySafely();
      });
      var totalPopPrice = selectedProductList?[index].toppingList?.fold(
              0,
              (previousValue, element) =>
                  previousValue + element.totalAmount!) ??
          0;

      /// pop
      var sellTotalPriceWithPopping =
          ((selectedPrice + totalPopPrice) * productQuantity).toDouble();
      selectedProductList?[index].totalToppingPrice = totalPopPrice.toDouble();
      selectedProductList?[index].totalBothCardAndTopping =
          sellTotalPriceWithPopping;
      displayTotalAmount = selectedProductList?.fold(
          0,
          (previousValue, element) =>
              previousValue! + element.totalBothCardAndTopping!);
      // displayTotalPop =
      //     selectedProductList?.fold(0, (previousValue, element) {
      //       var subTopTotal = previousValue! + element.totalToppingPrice!;
      //       var qty = element.quantity ?? 1;
      //       return subTopTotal * qty;
      //     });
      _notifySafely();
    } else {
      selectedProductList?[index].totalBothCardAndTopping =
          selectedProductList?[index].totalForOnlyItem;
      displayTotalAmount = selectedProductList?.fold(
          0,
          (previousValue, element) =>
              previousValue! + element.totalBothCardAndTopping!);
      _notifySafely();
    }
  }

  void onTapQuantityReduce(int index) {
    int productQuantity = selectedProductList?[index].quantity ?? 1;
    if (productQuantity > 1) {
      productQuantity--;
      var selectedPrice = selectedProductList?[index].selectedPrice ?? 0;

      /// pop not included
      var totalPriceWithoutPop = (productQuantity * selectedPrice).toDouble();
      selectedProductList?[index].quantity = productQuantity;
      selectedProductList?[index].totalForOnlyItem = totalPriceWithoutPop;
      selectedProductList?[index].totalBothCardAndTopping =
          totalPriceWithoutPop;
      displayTotalQuantity = selectedProductList?.fold(
          0, (previousValue, element) => previousValue! + element.quantity!);
      displayTotalAmount = selectedProductList?.fold(
          0,
          (previousValue, element) =>
              previousValue! + element.totalBothCardAndTopping!);
      _notifySafely();

      /// pop included
      if ((selectedProductList?[index].toppingList?.length != 0 &&
          selectedProductList?[index].toppingList != [] &&
          selectedProductList?[index].toppingList != null)) {
        selectedProductList?[index].toppingList?.forEach((topping) {
          var varSalePrice = topping.salePrice ?? 0;
          var varQty = topping.rawMaterialQuantity ?? 1;
          var toppingSaleTotal = varSalePrice * varQty;
          topping.rawMaterialPrice = varSalePrice;
          topping.totalAmount = toppingSaleTotal;
          _notifySafely();
        });
        var totalPopPrice = selectedProductList?[index].toppingList?.fold(
                0,
                (previousValue, element) =>
                    previousValue + element.totalAmount!) ??
            0;

        /// pop
        var totalPriceWithPopping =
            ((selectedPrice + totalPopPrice) * productQuantity).toDouble();
        selectedProductList?[index].totalToppingPrice =
            totalPopPrice.toDouble();
        selectedProductList?[index].totalBothCardAndTopping =
            totalPriceWithPopping;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalBothCardAndTopping!);
        _notifySafely();
        // displayTotalPop =
        //     selectedProductList?.fold(0, (previousValue, element) {
        //       var subTopTotal = previousValue! + element.totalToppingPrice!;
        //       var qty = element.quantity ?? 1;
        //       return subTopTotal * qty;
        //     });
      } else {
        displayTotalQuantity = selectedProductList?.fold(
            0, (previousValue, element) => previousValue! + element.quantity!);
        selectedProductList?[index].totalBothCardAndTopping =
            selectedProductList?[index].totalForOnlyItem;
        displayTotalAmount = selectedProductList?.fold(
            0,
            (previousValue, element) =>
                previousValue! + element.totalBothCardAndTopping!);
        _notifySafely();
      }
    } else {
      selectedProductList?.removeAt(index);
      displayTotalQuantity = selectedProductList?.fold(
          0, (previousValue, element) => previousValue! + element.quantity!);
      // selectedProductList?[index].totalBothCardAndTopping =
      //     selectedProductList?[index].totalForOnlyItem;
      displayTotalAmount = selectedProductList?.fold(
          0,
          (previousValue, element) =>
              previousValue! + element.totalBothCardAndTopping!);
      _notifySafely();
    }
  }

  /// loading situations
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
