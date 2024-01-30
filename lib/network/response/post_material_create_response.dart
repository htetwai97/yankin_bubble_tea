import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';

class PostMaterialCreateResponse {
  bool? success;
  String? message;

  PostMaterialCreateResponse({this.success, this.message});

  PostMaterialCreateResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
