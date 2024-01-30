import 'package:multipurpose_pos_application/data/vos/response_size_object_vo.dart';

class PostStoreIngredientV2Response {
  List<ResponseSizeObjectVO>? sizeOfIngredients;
  bool? success;
  String? message;

  PostStoreIngredientV2Response(
      {this.sizeOfIngredients, this.success, this.message});

  PostStoreIngredientV2Response.fromJson(Map<String, dynamic> json) {
    if (json['size_of_ingredients'] != null) {
      sizeOfIngredients = <ResponseSizeObjectVO>[];
      json['size_of_ingredients'].forEach((v) {
        sizeOfIngredients!.add(new ResponseSizeObjectVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sizeOfIngredients != null) {
      data['size_of_ingredients'] =
          this.sizeOfIngredients!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
