class RequestCreatePromotionVO {
  int? promotionId;
  String? name;
  int? condition;
  int? conditionAmount;
  Null? conditionProductId;
  Null? conditionProductQty;
  int? rewardFlag;
  int? cashbackAmount;
  int? discountFlag;
  Null? customDiscountId;
  int? discountPercent;
  Null? rewardProductId;
  String? promotionPeriodFrom;
  String? promotionPeriodTo;
  int? linkCustomerFlag;
  int? announceCustomerFlag;
  String? description;
  Null? photo;

  RequestCreatePromotionVO(
      {this.promotionId,
      this.name,
      this.condition,
      this.conditionAmount,
      this.conditionProductId,
      this.conditionProductQty,
      this.rewardFlag,
      this.cashbackAmount,
      this.discountFlag,
      this.customDiscountId,
      this.discountPercent,
      this.rewardProductId,
      this.promotionPeriodFrom,
      this.promotionPeriodTo,
      this.linkCustomerFlag,
      this.announceCustomerFlag,
      this.description,
      this.photo});

  RequestCreatePromotionVO.fromJson(Map<String, dynamic> json) {
    promotionId = json['promotion_id'];
    name = json['name'];
    condition = json['condition'];
    conditionAmount = json['condition_amount'];
    conditionProductId = json['condition_product_id'];
    conditionProductQty = json['condition_product_qty'];
    rewardFlag = json['reward_flag'];
    cashbackAmount = json['cashback_amount'];
    discountFlag = json['discount_flag'];
    customDiscountId = json['custom_discount_id'];
    discountPercent = json['discount_percent'];
    rewardProductId = json['reward_product_id'];
    promotionPeriodFrom = json['promotion_period_from'];
    promotionPeriodTo = json['promotion_period_to'];
    linkCustomerFlag = json['link_customer_flag'];
    announceCustomerFlag = json['announce_customer_flag'];
    description = json['description'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promotion_id'] = this.promotionId;
    data['name'] = this.name;
    data['condition'] = this.condition;
    data['condition_amount'] = this.conditionAmount;
    data['condition_product_id'] = this.conditionProductId;
    data['condition_product_qty'] = this.conditionProductQty;
    data['reward_flag'] = this.rewardFlag;
    data['cashback_amount'] = this.cashbackAmount;
    data['discount_flag'] = this.discountFlag;
    data['custom_discount_id'] = this.customDiscountId;
    data['discount_percent'] = this.discountPercent;
    data['reward_product_id'] = this.rewardProductId;
    data['promotion_period_from'] = this.promotionPeriodFrom;
    data['promotion_period_to'] = this.promotionPeriodTo;
    data['link_customer_flag'] = this.linkCustomerFlag;
    data['announce_customer_flag'] = this.announceCustomerFlag;
    data['description'] = this.description;
    data['photo'] = this.photo;
    return data;
  }
}
