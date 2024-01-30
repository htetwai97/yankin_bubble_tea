import 'package:hive/hive.dart';
import 'package:multipurpose_pos_application/data/vos/option_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_card_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';
part 'product_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_PRODUCT_VO, adapterName: "ProductVOAdapter")
class ProductVO {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? categoryId;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? photo;
  @HiveField(5)
  List<RequestSizeObjectVO>? sizeOfIngredient;
  @HiveField(6)
  int? displayIndex;
  @HiveField(7)
  int? discountId;
  @HiveField(8)
  int? customDiscountId;
  @HiveField(9)
  int? customPromotionId;
  @HiveField(10)
  int? optionFlag;
  @HiveField(11)
  String? createdAt;
  @HiveField(12)
  String? updatedAt;
  @HiveField(13)
  List<RequestIngredientVO>? ingredients;
  @HiveField(14)
  int? quantity;
  @HiveField(15)
  String? selectedSize;
  @HiveField(16)
  int? selectedPrice;
  @HiveField(17)
  double? totalForOnlyItem;
  @HiveField(18)
  double? totalToppingPrice;
  @HiveField(19)
  double? totalBothCardAndTopping;
  @HiveField(20)
  List<OptionVO>? optionList;
  @HiveField(21)
  List<String>? rawList;
  @HiveField(22)
  List<RequestToppingVO>? toppingList;
  @HiveField(23)
  String? specialRemark;
  @HiveField(24)
  int? optionId;
  @HiveField(25)
  String? optionName;
  @HiveField(26)
  int? index;
  @HiveField(27)
  int? toppingPrice;

  ProductVO({
    this.id,
    this.name,
    this.categoryId,
    this.description,
    this.photo,
    this.sizeOfIngredient,
    this.displayIndex,
    this.discountId,
    this.customDiscountId,
    this.customPromotionId,
    this.optionFlag,
    this.createdAt,
    this.updatedAt,
    this.ingredients,
    this.quantity,
    this.selectedSize,
    this.selectedPrice,
    this.optionList,
    this.rawList,
    this.toppingList,
    this.specialRemark,
    this.optionName,
    this.optionId,
    this.index,
    this.toppingPrice,
    this.totalForOnlyItem,
    this.totalToppingPrice,
    this.totalBothCardAndTopping,
  });

  RequestCardProductVO? changeToRequestCardProduct(ProductVO? product) {
    var requestCardProduct = RequestCardProductVO();
    requestCardProduct.checkOutId = product?.index;
    requestCardProduct.id = product?.id;
    requestCardProduct.name = product?.name;
    requestCardProduct.orderQuantity = product?.quantity;
    requestCardProduct.size = product?.selectedSize;
    requestCardProduct.sellingPrice = product?.selectedPrice;

    /// left data
    requestCardProduct.specialRemark = product?.specialRemark;
    requestCardProduct.optionFlag = product?.optionFlag;
    requestCardProduct.optionId = product?.optionId;
    requestCardProduct.optionName = product?.optionName;
    requestCardProduct.toppingList = product?.toppingList;
    return requestCardProduct;
  }

  ProductVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    description = json['description'];
    photo = json['photo'];
    if (json['size_of_ingredient'] != null) {
      sizeOfIngredient = <RequestSizeObjectVO>[];
      json['size_of_ingredient'].forEach((v) {
        sizeOfIngredient!.add(new RequestSizeObjectVO.fromJson(v));
      });
    }
    displayIndex = json['display_index'];
    discountId = json['discount_id'];
    customDiscountId = json['custom_discount_id'];
    customPromotionId = json['custom_promotion_id'];
    optionFlag = json['option_flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ingredients'] != null) {
      ingredients = <RequestIngredientVO>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new RequestIngredientVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['photo'] = this.photo;
    if (this.sizeOfIngredient != null) {
      data['size_of_ingredient'] =
          this.sizeOfIngredient!.map((v) => v.toJson()).toList();
    }
    data['display_index'] = this.displayIndex;
    data['discount_id'] = this.discountId;
    data['custom_discount_id'] = this.customDiscountId;
    data['custom_promotion_id'] = this.customPromotionId;
    data['option_flag'] = this.optionFlag;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
