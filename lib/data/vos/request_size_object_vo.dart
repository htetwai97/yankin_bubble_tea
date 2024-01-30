import 'package:hive/hive.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';
part 'request_size_object_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_SIZE_WITH_INGREDIENT_VO,
    adapterName: "RequestSizeObjectVOAdapter")
class RequestSizeObjectVO {
  @HiveField(0)
  String? timeStamp;

  @HiveField(1)
  String? size;

  @HiveField(2)
  int? sellPrice;

  @HiveField(3)
  int? deliPrice;

  @HiveField(4)
  List<RequestIngredientVO>? ingredients;

  RequestSizeObjectVO({
    this.timeStamp,
    this.size,
    this.sellPrice,
    this.deliPrice,
    this.ingredients,
  });

  @override
  String toString() {
    return 'RequestSizeObjectVO{timeStamp: $timeStamp, size: $size, sellPrice: $sellPrice, deliPrice: $deliPrice, ingredients: $ingredients}';
  }

  RequestSizeObjectVO.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    sellPrice = json['sell_price'];
    deliPrice = json['deli_price'];
    if (json['ingredients'] != null) {
      ingredients = <RequestIngredientVO>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new RequestIngredientVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['sell_price'] = this.sellPrice;
    data['deli_price'] = this.deliPrice;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
