import 'package:multipurpose_pos_application/data/vos/category_vo.dart';

class PostCategoryListResponse {
  List<CategoryVO>? categories;
  bool? success;
  String? message;

  PostCategoryListResponse({this.categories, this.success, this.message});

  PostCategoryListResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoryVO>[];
      json['categories'].forEach((v) {
        categories!.add(new CategoryVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
