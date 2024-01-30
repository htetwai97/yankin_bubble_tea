class PostRawMaterialUpdateResponse {
  bool? success;
  String? message;

  PostRawMaterialUpdateResponse({this.success, this.message});

  PostRawMaterialUpdateResponse.fromJson(Map<String, dynamic> json) {
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
