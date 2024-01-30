import 'package:multipurpose_pos_application/data/vos/option_vo.dart';

class PostOptionListResponse {
  List<OptionVO>? options;
  bool? success;
  String? message;

  PostOptionListResponse({this.options, this.success, this.message});

  PostOptionListResponse.fromJson(Map<String, dynamic> json) {
    if (json['options'] != null) {
      options = <OptionVO>[];
      json['options'].forEach((v) {
        options!.add(new OptionVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
