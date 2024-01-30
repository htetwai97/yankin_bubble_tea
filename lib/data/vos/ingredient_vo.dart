class IngredientVO {
  int? amount;
  int? id;
  int? rawMaterialId;
  String? rawMaterialName;
  String? size;
  String? unitName;

  IngredientVO(
      {this.amount,
      this.id,
      this.rawMaterialId,
      this.rawMaterialName,
      this.size,
      this.unitName});

  IngredientVO.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    id = json['id'];
    rawMaterialId = json['raw_material_id'];
    rawMaterialName = json['raw_material_name'];
    size = json['size'];
    unitName = json['unit_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['id'] = this.id;
    data['raw_material_id'] = this.rawMaterialId;
    data['raw_material_name'] = this.rawMaterialName;
    data['size'] = this.size;
    data['unit_name'] = this.unitName;
    return data;
  }
}
