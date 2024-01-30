import 'package:multipurpose_pos_application/data/vos/user_data_vo.dart';

class PostUserDataResponse {
  UserDataVO? userData;
  PostUserDataResponse({this.userData});

  PostUserDataResponse.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserDataVO.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}
