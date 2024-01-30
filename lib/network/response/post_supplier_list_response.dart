import 'package:multipurpose_pos_application/data/vos/supplier_vo.dart';

class PostSupplierListResponse {
  List<SupplierVO>? suppliers;
  bool? success;
  String? message;

  PostSupplierListResponse({this.suppliers, this.success, this.message});

  PostSupplierListResponse.fromJson(Map<String, dynamic> json) {
    if (json['suppliers'] != null) {
      suppliers = <SupplierVO>[];
      json['suppliers'].forEach((v) {
        suppliers!.add(new SupplierVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.suppliers != null) {
      data['suppliers'] = this.suppliers!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
