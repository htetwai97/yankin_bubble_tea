import 'package:multipurpose_pos_application/data/vos/category_vo.dart';

import '../../data/vos/supplier_vo.dart';

class PostSupplierStoreResponse {
  SupplierVO? supplier;
  bool? success;
  String? message;

  PostSupplierStoreResponse({this.supplier, this.success, this.message});

  PostSupplierStoreResponse.fromJson(Map<String, dynamic> json) {
    supplier = json['supplier'] != null
        ? new SupplierVO.fromJson(json['supplier'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.supplier != null) {
      data['supplier'] = this.supplier!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
