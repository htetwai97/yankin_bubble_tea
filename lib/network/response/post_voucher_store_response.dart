import 'package:multipurpose_pos_application/data/vos/request_card_product_vo.dart';

class PostVoucherStoreResponse {
  String? voucherNumber;
  Promotion? promotion;
  List<RequestCardProductVO>? voucherItemList;
  CustomerFromVoucherStoreResponseVO? customer;
  bool? success;
  String? message;

  PostVoucherStoreResponse(
      {this.voucherNumber,
      this.promotion,
      this.voucherItemList,
      this.customer,
      this.success,
      this.message});

  PostVoucherStoreResponse.fromJson(Map<String, dynamic> json) {
    voucherNumber = json['voucher_number'];
    promotion = json['promotion'] != null
        ? new Promotion.fromJson(json['promotion'])
        : null;
    if (json['voucher'] != null) {
      voucherItemList = <RequestCardProductVO>[];
      json['voucher'].forEach((v) {
        voucherItemList!.add(new RequestCardProductVO.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new CustomerFromVoucherStoreResponseVO.fromJson(json['customer'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucher_number'] = this.voucherNumber;
    if (this.promotion != null) {
      data['promotion'] = this.promotion!.toJson();
    }
    if (this.voucherItemList != null) {
      data['voucher'] = this.voucherItemList!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Promotion {
  int? id;
  int? rewardFlag;
  Null? cashbackAmount;
  int? discountPercent;
  Null? rewardProductId;

  Promotion(
      {this.id,
      this.rewardFlag,
      this.cashbackAmount,
      this.discountPercent,
      this.rewardProductId});

  Promotion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rewardFlag = json['reward_flag'];
    cashbackAmount = json['cashback_amount'];
    discountPercent = json['discount_percent'];
    rewardProductId = json['reward_product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reward_flag'] = this.rewardFlag;
    data['cashback_amount'] = this.cashbackAmount;
    data['discount_percent'] = this.discountPercent;
    data['reward_product_id'] = this.rewardProductId;
    return data;
  }
}

class CustomerFromVoucherStoreResponseVO {
  int? id;
  String? customerCode;
  int? vipcardNumber;
  String? name;
  String? phone;
  String? frequentItem;
  int? discountPercent;
  int? taxFlag;
  int? taxPercent;
  String? createdAt;
  String? updatedAt;

  CustomerFromVoucherStoreResponseVO(
      {this.id,
      this.customerCode,
      this.vipcardNumber,
      this.name,
      this.phone,
      this.frequentItem,
      this.discountPercent,
      this.taxFlag,
      this.taxPercent,
      this.createdAt,
      this.updatedAt});

  CustomerFromVoucherStoreResponseVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerCode = json['customer_code'];
    vipcardNumber = json['vipcard_number'];
    name = json['name'];
    phone = json['phone'];
    frequentItem = json['frequent_item'];
    discountPercent = json['discount_percent'];
    taxFlag = json['tax_flag'];
    taxPercent = json['tax_percent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_code'] = this.customerCode;
    data['vipcard_number'] = this.vipcardNumber;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['frequent_item'] = this.frequentItem;
    data['discount_percent'] = this.discountPercent;
    data['tax_flag'] = this.taxFlag;
    data['tax_percent'] = this.taxPercent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
