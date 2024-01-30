import 'package:multipurpose_pos_application/data/vos/category_vo.dart';

class PostCategoryStoreResponse {
  CategoryVO? category;
  bool? success;
  String? message;

  PostCategoryStoreResponse({this.category, this.success, this.message});
  PostCategoryStoreResponse.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new CategoryVO.fromJson(json['category'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
