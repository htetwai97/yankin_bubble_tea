class VoucherStartAndEndDateVO {
  String? startDate;
  String? endDate;

  VoucherStartAndEndDateVO({this.startDate, this.endDate});

  VoucherStartAndEndDateVO.fromJson(Map<String, dynamic> json) {
    startDate = json['start_timetick'];
    endDate = json['end_timetick'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_timetick'] = this.startDate;
    data['end_timetick'] = this.startDate;
    return data;
  }
}
