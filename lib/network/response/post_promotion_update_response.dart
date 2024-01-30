import 'package:multipurpose_pos_application/data/vos/request_create_promotion_vo.dart';

import '../../data/vos/request_update_promotion_vo.dart';

class PostPromotionUpdateResponse {
  RequestUpdatePromotionVO? promotion;
  bool? success;
  String? message;

  PostPromotionUpdateResponse({this.promotion, this.success, this.message});

  PostPromotionUpdateResponse.fromJson(Map<String, dynamic> json) {
    promotion = json['promotion'] != null
        ? new RequestUpdatePromotionVO.fromJson(json['promotion'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promotion != null) {
      data['promotion'] = this.promotion!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
