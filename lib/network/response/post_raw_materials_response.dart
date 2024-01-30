import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';

class PostRawMaterialResponse {
  List<RawMaterialVO>? rawMaterials;
  bool? success;
  String? message;

  PostRawMaterialResponse({this.rawMaterials, this.success, this.message});

  PostRawMaterialResponse.fromJson(Map<String, dynamic> json) {
    if (json['raw_materials'] != null) {
      rawMaterials = <RawMaterialVO>[];
      json['raw_materials'].forEach((v) {
        rawMaterials!.add(new RawMaterialVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rawMaterials != null) {
      data['raw_materials'] =
          this.rawMaterials!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
