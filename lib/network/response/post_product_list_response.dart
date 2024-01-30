import 'package:multipurpose_pos_application/data/vos/product_vo.dart';

class PostProductListResponse {
  List<ProductVO>? products;
  bool? success;
  String? message;

  PostProductListResponse({this.products, this.success, this.message});

  PostProductListResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductVO>[];
      json['products'].forEach((v) {
        products!.add(new ProductVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
