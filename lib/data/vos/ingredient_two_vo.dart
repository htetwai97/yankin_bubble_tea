class IngredientTwoVO {
  int? id;
  int? productId;
  int? rawMaterialId;
  String? unitName;
  int? amount;
  String? createdAt;
  String? updatedAt;

  IngredientTwoVO(
      {this.id,
        this.productId,
        this.rawMaterialId,
        this.unitName,
        this.amount,
        this.createdAt,
        this.updatedAt});

  IngredientTwoVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    rawMaterialId = json['raw_material_id'];
    unitName = json['unit_name'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['raw_material_id'] = this.rawMaterialId;
    data['unit_name'] = this.unitName;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}