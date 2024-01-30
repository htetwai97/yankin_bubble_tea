class CashbackAndPromo {
  int? cbPromoFlag;
  int? voucherId;
  String? voucherNumber;
  String? voucherDate;
  int? voucherTotal;
  int? cashbackAmount;
  int? taxAmount;
  int? promotionId;
  String? promotionName;
  int? discountPercent;
  int? discountAmount;
  String? rewardProductName;
  String? customerName;

  CashbackAndPromo(
      {this.cbPromoFlag,
      this.voucherId,
      this.voucherNumber,
      this.voucherDate,
      this.voucherTotal,
      this.cashbackAmount,
      this.taxAmount,
      this.promotionId,
      this.promotionName,
      this.discountPercent,
      this.discountAmount,
      this.rewardProductName,
      this.customerName});

  CashbackAndPromo.fromJson(Map<String, dynamic> json) {
    cbPromoFlag = json['cb_promo_flag'];
    voucherId = json['voucher_id'];
    voucherNumber = json['voucher_number'];
    voucherDate = json['voucher_date'];
    voucherTotal = json['voucher_total'];
    cashbackAmount = json['cashback_amount'];
    taxAmount = json['tax_amount'];
    promotionId = json['promotion_id'];
    promotionName = json['promotion_name'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    rewardProductName = json['reward_product_name'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cb_promo_flag'] = this.cbPromoFlag;
    data['voucher_id'] = this.voucherId;
    data['voucher_number'] = this.voucherNumber;
    data['voucher_date'] = this.voucherDate;
    data['voucher_total'] = this.voucherTotal;
    data['cashback_amount'] = this.cashbackAmount;
    data['tax_amount'] = this.taxAmount;
    data['promotion_id'] = this.promotionId;
    data['promotion_name'] = this.promotionName;
    data['discount_percent'] = this.discountPercent;
    data['discount_amount'] = this.discountAmount;
    data['reward_product_name'] = this.rewardProductName;
    data['customer_name'] = this.customerName;
    return data;
  }
}
