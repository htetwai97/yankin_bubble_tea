import 'package:hive/hive.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_for_option_vo.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';

part 'option_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_OPTION_VO, adapterName: "OptionVOAdapter")
class OptionVO {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? productId;
  @HiveField(3)
  String? size;
  @HiveField(4)
  int? rawMaterialId;
  @HiveField(5)
  int? amount;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;
  @HiveField(8)
  RawMaterialForOptionVO? rawMaterial;

  OptionVO(
      {this.id,
      this.name,
      this.productId,
      this.size,
      this.rawMaterialId,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.rawMaterial});

  OptionVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    size = json['size'];
    rawMaterialId = json['raw_material_id'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rawMaterial = json['raw_material'] != null
        ? new RawMaterialForOptionVO.fromJson(json['raw_material'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['size'] = this.size;
    data['raw_material_id'] = this.rawMaterialId;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.rawMaterial != null) {
      data['raw_material'] = this.rawMaterial!.toJson();
    }
    return data;
  }
}
