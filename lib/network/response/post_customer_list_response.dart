import '../../data/vos/customer_vo.dart';

class PostCustomerListResponse {
  List<CustomerVO>? customers;
  bool? success;
  String? message;

  PostCustomerListResponse({this.customers, this.success, this.message});

  PostCustomerListResponse.fromJson(Map<String, dynamic> json) {
    if (json['customers'] != null) {
      customers = <CustomerVO>[];
      json['customers'].forEach((v) {
        customers!.add(new CustomerVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
