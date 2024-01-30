import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';
part 'request_topping_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_REQUEST_TOPPING_VO,
    adapterName: "RequestToppingVOAdapter")
@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_REQUEST_TOPPING_VO,
    adapterName: "RequestToppingVOAdapter")
class RequestToppingVO {
  @HiveField(0)
  @JsonKey(name: "raw_material_id")
  int? rawMaterialId;

  @HiveField(1)
  @JsonKey(name: "raw_material_qty")
  int? rawMaterialQuantity;

  @HiveField(2)
  @JsonKey(name: "raw_material_name")
  String? rawMaterialName;

  @HiveField(3)
  @JsonKey(name: "raw_material_price")
  int? rawMaterialPrice;

  @HiveField(4)
  @JsonKey(name: "item_id")
  int? itemId;

  @HiveField(5)
  @JsonKey(name: "item_size")
  String? itemSize;

  @HiveField(6)
  @JsonKey(name: "item_check_id")
  int? itemCheckId;

  @HiveField(7)
  @JsonKey(name: "option_id")
  int? optionId;

  @HiveField(8)
  @JsonKey(name: "totalAmount")
  int? totalAmount;

  @HiveField(9)
  @JsonKey(name: "salePrice")
  int? salePrice;

  @HiveField(10)
  @JsonKey(name: "deliPrice")
  int? deliPrice;

  RequestToppingVO({
    this.rawMaterialId,
    this.rawMaterialQuantity,
    this.rawMaterialName,
    this.rawMaterialPrice,
    this.itemId,
    this.itemSize,
    this.itemCheckId,
    this.optionId,
    this.totalAmount,
    this.salePrice,
    this.deliPrice,
  });

  factory RequestToppingVO.fromJson(Map<String, dynamic> json) =>
      _$RequestToppingVOFromJson(json);
  Map<String, dynamic> toJson() => _$RequestToppingVOToJson(this);
}
