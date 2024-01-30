class RequestSupplierVO {
  int? supplierId;
  String? supplierCode;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? brandId;
  int? creditAmount;
  int? repaymentPeriod;
  String? repaymentDate;
  String? createdAt;
  String? updatedAt;

  RequestSupplierVO(
      {this.supplierId,
      this.supplierCode,
      this.name,
      this.phone,
      this.address,
      this.email,
      this.brandId,
      this.creditAmount,
      this.repaymentPeriod,
      this.repaymentDate,
      this.createdAt,
      this.updatedAt});

  RequestSupplierVO.fromJson(Map<String, dynamic> json) {
    supplierId = json['id'];
    supplierCode = json['supplier_code'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    brandId = json['brand_id'];
    creditAmount = json['credit_amount'];
    repaymentPeriod = json['repayment_period'];
    repaymentDate = json['repayment_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplier_id'] = this.supplierId;
    data['supplier_code'] = this.supplierCode;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['brand_id'] = this.brandId;
    data['credit_amount'] = this.creditAmount;
    data['repayment_period'] = this.repaymentPeriod;
    data['repayment_date'] = this.repaymentDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}
