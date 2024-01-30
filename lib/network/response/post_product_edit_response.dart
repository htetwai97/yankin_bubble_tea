import 'package:multipurpose_pos_application/data/vos/product_vo.dart';

class PostEditProductResponse {
  ProductVO? product;
  bool? success;
  String? message;

  PostEditProductResponse({this.product, this.success, this.message});

  PostEditProductResponse.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null
        ? new ProductVO.fromJson(json['product'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
