import 'package:multipurpose_pos_application/data/vos/created_product_vo.dart';

class PostNewProductResponse {
  CreatedProductVO? product;
  bool? success;
  String? message;

  PostNewProductResponse({this.product, this.success, this.message});

  PostNewProductResponse.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null
        ? new CreatedProductVO.fromJson(json['product'])
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

  @override
  String toString() {
    return 'PostNewProductResponse{product: $product, success: $success, message: $message}';
  }
}
