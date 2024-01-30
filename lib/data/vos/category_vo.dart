class CategoryVO {
  int? id;
  String? categoryCode;
  String? name;
  int? type;
  String? unit;
  String? createdAt;
  String? updatedAt;

  CategoryVO(
      {this.id,
      this.categoryCode,
      this.name,
      this.type,
      this.unit,
      this.createdAt,
      this.updatedAt});

  CategoryVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryCode = json['category_code'];
    name = json['name'];
    type = json['type'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_code'] = this.categoryCode;
    data['name'] = this.name;
    data['type'] = this.type;
    data['unit'] = this.unit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
