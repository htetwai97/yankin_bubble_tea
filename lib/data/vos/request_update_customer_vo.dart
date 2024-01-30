class RequestUpdateCustomerVO {
  int? customerId;
  String? customerCode;
  int? vipcardNumber;
  String? name;
  String? phone;
  Null? frequentItem;
  int? discountPercent;
  int? taxFlag;
  int? taxPercent;
  String? createdAt;
  String? updatedAt;

  RequestUpdateCustomerVO(
      {this.customerId,
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

  RequestUpdateCustomerVO.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
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
    data['customer_id'] = this.customerId;
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
