import '../../data/vos/request_brand_update_vo.dart';

class PostBrandUpdateResponse {
  List<RequestBrandUpdateVO>? brands;
  bool? success;
  String? message;

  PostBrandUpdateResponse({this.brands, this.success, this.message});

  PostBrandUpdateResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
