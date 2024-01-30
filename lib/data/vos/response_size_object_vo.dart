import 'package:multipurpose_pos_application/data/vos/pivot_vo.dart';

class ResponseSizeObjectVO {
  int? id;
  int? productId;
  int? rawMaterialId;
  String? unitName;
  int? amount;
  String? createdAt;
  String? updatedAt;
  PivotVO? pivot;

  ResponseSizeObjectVO(
      {this.id,
      this.productId,
      this.rawMaterialId,
      this.unitName,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  ResponseSizeObjectVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    rawMaterialId = json['raw_material_id'];
    unitName = json['unit_name'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new PivotVO.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['raw_material_id'] = this.rawMaterialId;
    data['unit_name'] = this.unitName;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}
