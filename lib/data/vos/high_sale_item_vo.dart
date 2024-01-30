class HighSaleItemVO {
  int? id;
  int? productId;
  int? priceId;
  int? qty;
  int? totalProfits;
  String? voucherDate;
  String? createdAt;
  String? updatedAt;
  String? productName;
  String? sizeName;
  String? productImage;

  HighSaleItemVO(
      {this.id,
      this.productId,
      this.priceId,
      this.qty,
      this.totalProfits,
      this.voucherDate,
      this.createdAt,
      this.updatedAt,
      this.productName,
      this.sizeName,
      this.productImage});

  HighSaleItemVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    priceId = json['price_id'];
    qty = json['qty'];
    totalProfits = json['total_profits'];
    voucherDate = json['voucher_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productName = json['product_name'];
    sizeName = json['size_name'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['price_id'] = this.priceId;
    data['qty'] = this.qty;
    data['total_profits'] = this.totalProfits;
    data['voucher_date'] = this.voucherDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_name'] = this.productName;
    data['size_name'] = this.sizeName;
    data['product_image'] = this.productImage;
    return data;
  }
}
