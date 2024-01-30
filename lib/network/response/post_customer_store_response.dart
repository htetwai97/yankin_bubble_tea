import '../../data/vos/customer_vo.dart';

class PostCustomerStoreResponse {
  CustomerVO? customer;
  bool? success;
  String? message;

  PostCustomerStoreResponse({this.customer, this.success, this.message});

  PostCustomerStoreResponse.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new CustomerVO.fromJson(json['customer'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
