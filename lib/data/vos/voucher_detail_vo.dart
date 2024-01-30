import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';

class VoucherDetailVO {
  int? id;
  String? voucherNumber;
  List<VoucherData>? voucherData;
  int? voucherGrandTotal;
  double? displayGrandTotal;
  int? total;
  int? customerId;
  int? soldBy;
  String? employeeName;
  String? date;
  int? promotionId;
  int? cashbackFlag;
  int? cashback;
  int? taxFlag;
  int? taxAmount;
  String? createdAt;
  String? updatedAt;
  String? customerName;
  int? customerTax;
  Promotion? promotion;

  VoucherDetailVO(
      {this.id,
      this.voucherNumber,
      this.voucherData,
      this.voucherGrandTotal ,
      this.displayGrandTotal,
      this.total,
      this.customerId,
      this.soldBy,
      this.employeeName,
      this.date,
      this.promotionId,
      this.cashbackFlag,
      this.cashback,
      this.taxFlag,
      this.taxAmount,
      this.createdAt,
      this.updatedAt,
      this.customerName,
      this.customerTax,
      this.promotion});

  VoucherDetailVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voucherNumber = json['voucher_number'];
    if (json['voucher_data'] != null) {
      voucherData = <VoucherData>[];
      json['voucher_data'].forEach((v) {
        voucherData!.add(new VoucherData.fromJson(v));
      });
    }
    voucherGrandTotal = json['voucher_grand_total'];
    total = json['total'];
    customerId = json['customer_id'];
    soldBy = json['sold_by'];
    employeeName = json['employee_name'];
    date = json['date'];
    promotionId = json['promotion_id'];
    cashbackFlag = json['cashback_flag'];
    cashback = json['cashback'];
    taxFlag = json['tax_flag'];
    taxAmount = json['tax_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerName = json['customer_name'];
    customerTax = json['customer_tax'];
    promotion = json['promotion'] != null
        ? new Promotion.fromJson(json['promotion'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voucher_number'] = this.voucherNumber;
    if (this.voucherData != null) {
      data['voucher_data'] = this.voucherData!.map((v) => v.toJson()).toList();
    }
    data['voucher_grand_total'] = this.voucherGrandTotal;
    data['total'] = this.total;
    data['customer_id'] = this.customerId;
    data['sold_by'] = this.soldBy;
    data['employee_name'] = this.employeeName;
    data['date'] = this.date;
    data['promotion_id'] = this.promotionId;
    data['cashback_flag'] = this.cashbackFlag;
    data['cashback'] = this.cashback;
    data['tax_flag'] = this.taxFlag;
    data['tax_amount'] = this.taxAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['customer_name'] = this.customerName;
    data['customer_tax'] = this.customerTax;
    if (this.promotion != null) {
      data['promotion'] = this.promotion?.toJson();
    }
    return data;
  }
}

class VoucherData {
  int? checkoutId;
  int? id;
  String? name;
  int? optionFlag;
  int? optionId;
  String? optionName;
  int? orderQty;
  List<RequestToppingVO>? popingList;
  int? sellingPrice;
  String? size;
  String? specialRemark; // String or int ?
  int? totalPrice;

  VoucherData(
      {this.checkoutId,
      this.id,
      this.name,
      this.optionFlag,
      this.optionId,
      this.optionName,
      this.orderQty,
      this.popingList,
      this.sellingPrice,
      this.size,
      this.specialRemark,
      this.totalPrice});

  VoucherData.fromJson(Map<String, dynamic> json) {
    checkoutId = json['checkout_id'];
    id = json['id'];
    name = json['name'];
    optionFlag = json['option_flag'];
    optionId = json['option_id'];
    optionName = json['option_name'];
    orderQty = json['order_qty'];
    if (json['poping_list'] != null) {
      popingList = <RequestToppingVO>[];
      json['poping_list'].forEach((v) {
        popingList!.add(new RequestToppingVO.fromJson(v));
      });
    }
    sellingPrice = json['selling_price'];
    size = json['size'];
    specialRemark = json['special_remark'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkout_id'] = this.checkoutId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['option_flag'] = this.optionFlag;
    data['option_id'] = this.optionId;
    data['option_name'] = this.optionName;
    data['order_qty'] = this.orderQty;
    if (this.popingList != null) {
      data['poping_list'] = this.popingList!.map((v) => v.toJson()).toList();
    }
    data['selling_price'] = this.sellingPrice;
    data['size'] = this.size;
    data['special_remark'] = this.specialRemark;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class PopingList {
  int? itemCheckId;
  int? rawMaterialTip;
  String? itemSize;
  int? optionId;
  int? rawMaterialId;
  String? rawMaterialName;
  int? rawMaterialPrice;
  int? rawMaterialQty;

  PopingList(
      {this.itemCheckId,
      this.rawMaterialTip,
      this.itemSize,
      this.optionId,
      this.rawMaterialId,
      this.rawMaterialName,
      this.rawMaterialPrice,
      this.rawMaterialQty});

  PopingList.fromJson(Map<String, dynamic> json) {
    itemCheckId = json['item_check_id'];
    rawMaterialTip = json['raw_material_tip'];
    itemSize = json['item_size'];
    optionId = json['option_id'];
    rawMaterialId = json['raw_material_id'];
    rawMaterialName = json['raw_material_name'];
    rawMaterialPrice = json['raw_material_price'];
    rawMaterialQty = json['raw_material_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_check_id'] = this.itemCheckId;
    data['raw_material_tip'] = this.rawMaterialTip;
    data['item_size'] = this.itemSize;
    data['option_id'] = this.optionId;
    data['raw_material_id'] = this.rawMaterialId;
    data['raw_material_name'] = this.rawMaterialName;
    data['raw_material_price'] = this.rawMaterialPrice;
    data['raw_material_qty'] = this.rawMaterialQty;
    return data;
  }
}

class Promotion {
  int? id;
  String? name;
  int? rewardFlag;
  int? cashbackAmount;
  int? discountPercent;
  int? rewardProductId;
  String? rewardProductName;

  Promotion(
      {this.id,
      this.name,
      this.rewardFlag,
      this.cashbackAmount,
      this.discountPercent,
      this.rewardProductId,
      this.rewardProductName});

  Promotion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rewardFlag = json['reward_flag'];
    cashbackAmount = json['cashback_amount'];
    discountPercent = json['discount_percent'];
    rewardProductId = json['reward_product_id'];
    rewardProductName = json['reward_product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['reward_flag'] = this.rewardFlag;
    data['cashback_amount'] = this.cashbackAmount;
    data['discount_percent'] = this.discountPercent;
    data['reward_product_id'] = this.rewardProductId;
    data['reward_product_name'] = this.rewardProductName;
    return data;
  }
}
