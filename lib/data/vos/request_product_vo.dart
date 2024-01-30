import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';

class RequestProductVO {
  int? productId;
  List<RequestSizeObjectVO>? sizeOfIngredient;

  RequestProductVO({
    this.productId,
    this.sizeOfIngredient,
  });

  RequestProductVO.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];

    if (json['size_of_ingredient'] != null) {
      sizeOfIngredient = <RequestSizeObjectVO>[];
      json['size_of_ingredient'].forEach((v) {
        sizeOfIngredient!.add(new RequestSizeObjectVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;

    if (this.sizeOfIngredient != null) {
      data['size_of_ingredient'] =
          this.sizeOfIngredient!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
