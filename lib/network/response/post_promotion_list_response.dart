import 'package:multipurpose_pos_application/data/vos/promotion_vo.dart';

class PostPromotionListResponse {
  List<PromotionVO>? promotions;
  bool? success;
  String? message;

  PostPromotionListResponse({this.promotions, this.success, this.message});

  PostPromotionListResponse.fromJson(Map<String, dynamic> json) {
    if (json['promotions'] != null) {
      promotions = <PromotionVO>[];
      json['promotions'].forEach((v) {
        promotions!.add(new PromotionVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promotions != null) {
      data['promotions'] = this.promotions!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
