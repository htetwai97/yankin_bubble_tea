import '../../data/vos/request_brand_create_vo.dart';

class PostBrandCreateResponse {
  List<RequestBrandCreateVO>? brands;
  bool? success;
  String? message;

  PostBrandCreateResponse({this.brands, this.success, this.message});

  PostBrandCreateResponse.fromJson(Map<String, dynamic> json) {
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
