import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';

class RequestOptionVO {
  List<RequestIngredientVO>? options;
  RequestOptionVO({this.options});

  RequestOptionVO.fromJson(Map<String, dynamic> json) {
    if (json['options'] != null) {
      options = <RequestIngredientVO>[];
      json['options'].forEach((v) {
        options!.add(new RequestIngredientVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
