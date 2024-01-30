import 'package:hive/hive.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';
part 'request_ingredient_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_INGREDIENT_VO,
    adapterName: "RequestIngredientVOAdapter")
class RequestIngredientVO {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? productId;

  @HiveField(2)
  int? rawMaterialId;

  @HiveField(3)
  String? unitName;

  @HiveField(4)
  int? amount;

  @HiveField(5)
  String? createdAt;

  @HiveField(6)
  String? updatedAt;

  @HiveField(7)
  String? rawMaterialName;

  @HiveField(8)
  String? sizeName;

  @HiveField(9)
  int? sellprice;

  @HiveField(10)
  int? deliprice;

  @HiveField(11)
  String? optionName;

  @HiveField(12)
  String? size;

  RequestIngredientVO({
    this.id,
    this.productId,
    this.rawMaterialId,
    this.unitName,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.rawMaterialName,
    this.sizeName,
    this.sellprice,
    this.deliprice,
    this.optionName,
    this.size,
  });

  RequestIngredientVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    rawMaterialId = json['raw_material_id'];
    unitName = json['unit_name'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rawMaterialName = json['raw_material_name'];
    sizeName = json['size_name'];
    sellprice = json['sellprice'];
    deliprice = json['deliprice'];
    optionName = json['name'];
    size = json['size'];
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
    data['raw_material_name'] = this.rawMaterialName;
    data['size_name'] = this.sizeName;
    data['sellprice'] = this.sellprice;
    data['deliprice'] = this.deliprice;
    data['name'] = this.optionName;
    data['size'] = this.size;
    return data;
  }
}
