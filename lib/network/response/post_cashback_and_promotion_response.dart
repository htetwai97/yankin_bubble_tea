import '../../data/vos/cashback_and_promo_vo.dart';

class PostCashbackAndPromotionResponse {
  List<CashbackAndPromo>? cbPromoCollection;
  bool? success;
  String? message;

  PostCashbackAndPromotionResponse(
      {this.cbPromoCollection, this.success, this.message});

  PostCashbackAndPromotionResponse.fromJson(Map<String, dynamic> json) {
    if (json['cb_promo_collection'] != null) {
      cbPromoCollection = <CashbackAndPromo>[];
      json['cb_promo_collection'].forEach((v) {
        cbPromoCollection!.add(new CashbackAndPromo.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cbPromoCollection != null) {
      data['cb_promo_collection'] =
          this.cbPromoCollection!.map((v) => v.toJson()).toList();
    }

    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
