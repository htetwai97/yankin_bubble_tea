import 'package:multipurpose_pos_application/data/vos/ykbbt_user_vo.dart';

class PostYkbbtUserResponse {
  YkbbtUserVO? user;
  String? message;
  bool? success;

  PostYkbbtUserResponse({this.user, this.message, this.success});

  PostYkbbtUserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new YkbbtUserVO.fromJson(json['user']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

