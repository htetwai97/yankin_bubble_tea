import 'package:json_annotation/json_annotation.dart';
import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';
part 'request_card_product_vo.g.dart';

@JsonSerializable()
class RequestCardProductVO {
  @JsonKey(name: "checkout_id")
  int? checkOutId;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "order_qty")
  int? orderQuantity;

  @JsonKey(name: "size")
  String? size;

  @JsonKey(name: "selling_price")
  int? sellingPrice;

  @JsonKey(name: "poping_list")
  List<RequestToppingVO>? toppingList;

  @JsonKey(name: "special_remark")
  String? specialRemark;

  @JsonKey(name: "totalPrice")
  double? totalPrice;

  @JsonKey(name: "option_flag")
  int? optionFlag;

  @JsonKey(name: "option_id")
  int? optionId;

  @JsonKey(name: "option_name")
  String? optionName;

  RequestCardProductVO({
    this.checkOutId,
    this.id,
    this.name,
    this.orderQuantity,
    this.size,
    this.sellingPrice,
    this.toppingList,
    this.specialRemark,
    this.totalPrice,
    this.optionFlag,
    this.optionId,
    this.optionName,
  });

  @override
  String toString() {
    return 'RequestCardProductVO{checkOutId: $checkOutId, id: $id, name: $name, orderQuantity: $orderQuantity, size: $size, sellingPrice: $sellingPrice, toppingList: $toppingList, specialRemark: $specialRemark, totalPrice: $totalPrice, optionFlag: $optionFlag, optionId: $optionId, optionName: $optionName}';
  }

  factory RequestCardProductVO.fromJson(Map<String, dynamic> json) =>
      _$RequestCardProductVOFromJson(json);
  Map<String, dynamic> toJson() => _$RequestCardProductVOToJson(this);
}
