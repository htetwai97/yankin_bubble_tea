import 'package:multipurpose_pos_application/data/vos/supplier_vo.dart';

import '../../data/vos/request_supplier_vo.dart';

class PostSupplierUpdateResponse {
  List<RequestSupplierVO>? suppliers;
  bool? success;
  String? message;

  PostSupplierUpdateResponse({this.suppliers, this.success, this.message});

  PostSupplierUpdateResponse.fromJson(Map<String, dynamic> json) {
    if (json['supplier'] != null) {
      suppliers = <RequestSupplierVO>[];
      json['supplier'].forEach((v) {
        suppliers!.add(new RequestSupplierVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.suppliers != null) {
      data['supplier'] = this.suppliers!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
