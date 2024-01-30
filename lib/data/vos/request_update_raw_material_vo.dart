class RequestUpdateRawMaterialVO {
  int? rawMaterialId;
  String? name;
  int? categoryId;
  int? brandId;
  int? supplierId;
  int? instockQty;
  String? unit;
  int? reorderQty;
  int? purchasePrice;
  String? currency;
  int? toppingFlag;
  int? toppingSalesPrice;
  int? toppingDeliPrice;
  int? specialFlag;

  RequestUpdateRawMaterialVO(
      {this.rawMaterialId,
      this.name,
      this.categoryId,
      this.brandId,
      this.supplierId,
      this.instockQty,
      this.unit,
      this.reorderQty,
      this.purchasePrice,
      this.currency,
      this.toppingFlag,
      this.toppingSalesPrice,
      this.toppingDeliPrice,
      this.specialFlag});

  RequestUpdateRawMaterialVO.fromJson(Map<String, dynamic> json) {
    rawMaterialId = json['raw_material_id'];
    name = json['name'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    supplierId = json['supplier_id'];
    instockQty = json['instock_qty'];
    unit = json['unit'];
    reorderQty = json['reorder_qty'];
    purchasePrice = json['purchase_price'];
    currency = json['currency'];
    toppingFlag = json['topping_flag'];
    toppingSalesPrice = json['topping_sales_price'];
    toppingDeliPrice = json['topping_deli_price'];
    specialFlag = json['special_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw_material_id'] = this.rawMaterialId;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['supplier_id'] = this.supplierId;
    data['instock_qty'] = this.instockQty;
    data['unit'] = this.unit;
    data['reorder_qty'] = this.reorderQty;
    data['purchase_price'] = this.purchasePrice;
    data['currency'] = this.currency;
    data['topping_flag'] = this.toppingFlag;
    data['topping_sales_price'] = this.toppingSalesPrice;
    data['topping_deli_price'] = this.toppingDeliPrice;
    data['special_flag'] = this.specialFlag;
    return data;
  }
}
