import 'package:multipurpose_pos_application/data/vos/request_update_category_vo.dart';

class PostCategoryUpdateResponse {
  RequestUpdateCategoryVO? category;
  bool? success;
  String? message;

  PostCategoryUpdateResponse({this.category, this.success, this.message});
  PostCategoryUpdateResponse.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new RequestUpdateCategoryVO.fromJson(json['category'])
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
