import '../../data/vos/voucher_vo.dart';

class PostVoucherHistoryResponse {
  List<VoucherVO>? vouchers;
  bool? success;
  String? message;

  PostVoucherHistoryResponse({this.vouchers, this.success, this.message});

  PostVoucherHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['vouchers'] != null) {
      vouchers = <VoucherVO>[];
      json['vouchers'].forEach((v) {
        vouchers!.add(new VoucherVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vouchers != null) {
      data['vouchers'] = this.vouchers!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
