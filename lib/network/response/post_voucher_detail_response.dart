import '../../data/vos/voucher_detail_vo.dart';

class PostVoucherDetailResponse {
  VoucherDetailVO? voucher;
  bool? success;
  String? message;

  PostVoucherDetailResponse({this.voucher, this.success, this.message});

  PostVoucherDetailResponse.fromJson(Map<String, dynamic> json) {
    voucher = json['voucher'] != null
        ? new VoucherDetailVO.fromJson(json['voucher'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.voucher != null) {
      data['voucher'] = this.voucher!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
