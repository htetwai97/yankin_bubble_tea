import 'package:hive/hive.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';

part 'raw_material_for_option_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_RAW_MATERIAL_FOR_OPTION_VO,
    adapterName: "RawMaterialForOptionVOAdapter")
class RawMaterialForOptionVO {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? categoryId;
  @HiveField(3)
  int? brandId;
  @HiveField(4)
  int? supplierId;
  @HiveField(5)
  int? inStockQty;
  @HiveField(6)
  String? unit;
  @HiveField(7)
  int? reorderQty;
  @HiveField(8)
  int? purchasePrice;
  @HiveField(9)
  String? currency;
  @HiveField(10)
  int? toppingFlag;
  @HiveField(11)
  int? toppingSalesAmount;
  @HiveField(12)
  int? toppingSalesPrice;
  @HiveField(13)
  int? toppingDeliPrice;
  @HiveField(14)
  String? toppingPhotoPath;
  @HiveField(15)
  int? specialFlag;
  @HiveField(16)
  String? createdAt;
  @HiveField(17)
  String? updatedAt;

  RawMaterialForOptionVO(
      {this.id,
      this.name,
      this.categoryId,
      this.brandId,
      this.supplierId,
      this.inStockQty,
      this.unit,
      this.reorderQty,
      this.purchasePrice,
      this.currency,
      this.toppingFlag,
      this.toppingSalesAmount,
      this.toppingSalesPrice,
      this.toppingDeliPrice,
      this.toppingPhotoPath,
      this.specialFlag,
      this.createdAt,
      this.updatedAt});

  RawMaterialForOptionVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    supplierId = json['supplier_id'];
    inStockQty = json['instock_qty'];
    unit = json['unit'];
    reorderQty = json['reorder_qty'];
    purchasePrice = json['purchase_price'];
    currency = json['currency'];
    toppingFlag = json['topping_flag'];
    toppingSalesAmount = json['topping_sales_amount'];
    toppingSalesPrice = json['topping_sales_price'];
    toppingDeliPrice = json['topping_deli_price'];
    toppingPhotoPath = json['topping_photo_path'];
    specialFlag = json['special_flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['supplier_id'] = this.supplierId;
    data['instock_qty'] = this.inStockQty;
    data['unit'] = this.unit;
    data['reorder_qty'] = this.reorderQty;
    data['purchase_price'] = this.purchasePrice;
    data['currency'] = this.currency;
    data['topping_flag'] = this.toppingFlag;
    data['topping_sales_amount'] = this.toppingSalesAmount;
    data['topping_sales_price'] = this.toppingSalesPrice;
    data['topping_deli_price'] = this.toppingDeliPrice;
    data['topping_photo_path'] = this.toppingPhotoPath;
    data['special_flag'] = this.specialFlag;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
