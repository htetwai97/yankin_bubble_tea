import '../../data/vos/brand_vo.dart';

class PostBrandListResponse {
  List<BrandVO>? brands;
  bool? success;
  String? message;

  PostBrandListResponse({this.brands, this.success, this.message});

  PostBrandListResponse.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = <BrandVO>[];
      json['brands'].forEach((v) {
        brands!.add(new BrandVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
