import '../../data/vos/voucher_vo.dart';

class PostVoucherDeleteResponse {
  bool? success;
  String? message;

  PostVoucherDeleteResponse({this.success, this.message});

  PostVoucherDeleteResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
