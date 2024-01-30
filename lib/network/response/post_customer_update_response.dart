import '../../data/vos/request_update_customer_vo.dart';

class PostCustomerUpdateResponse {
  RequestUpdateCustomerVO? customer;
  bool? success;
  String? message;

  PostCustomerUpdateResponse({this.customer, this.success, this.message});

  PostCustomerUpdateResponse.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new RequestUpdateCustomerVO.fromJson(json['customer'])
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
