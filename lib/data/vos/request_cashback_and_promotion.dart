class RequestCashbackAndPromotion {
  String? startDate;
  String? endDate;
  int? cbOrPromoFlag;

  RequestCashbackAndPromotion(
      {this.startDate, this.endDate, this.cbOrPromoFlag});

  RequestCashbackAndPromotion.fromJson(Map<String, dynamic> json) {
    startDate = json['start_timetick'];
    endDate = json['end_timetick'];
    cbOrPromoFlag = json['cb_or_promo_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_timetick'] = this.startDate;
    data['end_timetick'] = this.startDate;
    data['cb_or_promo_flag'] = this.cbOrPromoFlag;
    return data;
  }
}
