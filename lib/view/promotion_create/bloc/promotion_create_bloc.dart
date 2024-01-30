import 'package:flutter/cupertino.dart';
import 'package:multipurpose_pos_application/data/vos/promotion_vo.dart';

import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/product_vo.dart';
import '../../../data/vos/request_create_promotion_vo.dart';

class PromotionCreateBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  int? promotionId;
  String? name;
  int? condition;
  int? conditionAmount;
  Null conditionProductId;
  Null conditionProductQty;
  int? rewardFlag;
  int? cashbackAmount;
  int? discountFlag;
  Null customDiscountId;
  int? discountPercent;
  Null rewardProductId;
  String? promotionPeriodFrom;
  String? promotionPeriodTo;
  int? linkCustomerFlag;
  int? announceCustomerFlag;
  String? description;
  Null photo;

  String? queryDate;
  DateTime? _date;
  String? focItem;
  int? taxFlag;
  List<ProductVO>? productList = [];
  List<String> productNameList = [];

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();

  PromotionCreateBloc() {
    _showLoading();
    _multiPosRepoModel.postProductListResponse().then((value) {
      productList = value.products;
      productList?.sort((a, b) => b.id!.compareTo(a.id!));
      productNameList = productList?.map((e) => e.name ?? "").toList() ?? [];
      notifySafely();
      _hideLoading();
    });
  }

  Future onTapCreate() {
    _showLoading();
    if (name != null &&
        name != "" &&
        promotionPeriodFrom != null &&
        promotionPeriodFrom != "" &&
        promotionPeriodTo != null &&
        promotionPeriodTo != "") {
      RequestCreatePromotionVO requestCreatePromotionVO =
          RequestCreatePromotionVO(
              name: name ?? "",
              condition: 0,
              conditionAmount: 10,
              cashbackAmount: cashbackAmount,
              rewardFlag: 1,
              discountFlag: 2,
              discountPercent: discountPercent ?? 0,
              promotionPeriodFrom: promotionPeriodFrom,
              promotionPeriodTo: promotionPeriodTo,
              linkCustomerFlag: 0,
              announceCustomerFlag: 0,
              description: "Good");
      return _multiPosRepoModel
          .postPromotionStoreResponse(requestCreatePromotionVO)
          .then((value) => _hideLoading());
    } else {
      _hideLoading();
      return Future.error("Fail to add promotion");
    }
  }

  void onFirstEditingComplete() {
    firstFocusNode.unfocus();
    secondFocusNode.requestFocus();
    notifySafely();
  }

  void onSecondEditingComplete() {
    secondFocusNode.unfocus();
    thirdFocusNode.requestFocus();
    notifySafely();
  }

  void onThirdEditingComplete() {
    thirdFocusNode.unfocus();
    fourthFocusNode.requestFocus();
    notifySafely();
  }

  void onFourthEditingComplete() {
    fourthFocusNode.unfocus();
    notifySafely();
  }

  set setDate(DateTime dateTime) => _date = dateTime;
  DateTime get getDate => _date!;

  void onChangeName(String? name) {
    this.name = name;
    notifySafely();
  }

  void onChangeAmount(int? amount) {
    this.cashbackAmount = amount;
    notifySafely();
  }

  void onChangeDiscountPercent(int? discountPercent) {
    this.discountPercent = discountPercent;
    notifySafely();
  }

  void onChooseTaxFlag(int? taxFlag) {
    this.taxFlag = taxFlag;
    notifySafely();
  }

  void onChooseFocItem(String? focItem) {
    this.focItem = focItem;
    notifySafely();
  }

  void _showLoading() {
    isLoading = true;
    notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    notifySafely();
  }

  void notifySafely() {
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
