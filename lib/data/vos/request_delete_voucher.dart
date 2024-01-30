class RequestDeleteVoucher {
  int? voucherId;

  RequestDeleteVoucher({this.voucherId});

  RequestDeleteVoucher.fromJson(Map<String, dynamic> json) {
    voucherId = json['voucher_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucher_id'] = this.voucherId;
    return data;
  }
}
