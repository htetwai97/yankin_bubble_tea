class PivotVO {
  int? priceId;
  int? ingredientId;

  PivotVO({this.priceId, this.ingredientId});

  PivotVO.fromJson(Map<String, dynamic> json) {
    priceId = json['price_id'];
    ingredientId = json['ingredient_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_id'] = this.priceId;
    data['ingredient_id'] = this.ingredientId;
    return data;
  }
}