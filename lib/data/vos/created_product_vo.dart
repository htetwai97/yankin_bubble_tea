class CreatedProductVO {
  String? name;
  String? categoryId;
  String? description;
  String? photo;
  int? optionFlag;
  String? updatedAt;
  String? createdAt;
  int? id;

  CreatedProductVO(
      {this.name,
      this.categoryId,
      this.description,
      this.photo,
      this.optionFlag,
      this.updatedAt,
      this.createdAt,
      this.id});

  CreatedProductVO.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryId = json['category_id'];
    description = json['description'];
    photo = json['photo'];
    optionFlag = json['option_flag'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['option_flag'] = this.optionFlag;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'CreatedProductVO{name: $name, categoryId: $categoryId, description: $description, photo: $photo, optionFlag: $optionFlag, updatedAt: $updatedAt, createdAt: $createdAt, id: $id}';
  }
}
