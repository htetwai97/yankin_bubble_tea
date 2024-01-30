// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductVOAdapter extends TypeAdapter<ProductVO> {
  @override
  final int typeId = 3;

  @override
  ProductVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      categoryId: fields[2] as int?,
      description: fields[3] as String?,
      photo: fields[4] as String?,
      sizeOfIngredient: (fields[5] as List?)?.cast<RequestSizeObjectVO>(),
      displayIndex: fields[6] as int?,
      discountId: fields[7] as int?,
      customDiscountId: fields[8] as int?,
      customPromotionId: fields[9] as int?,
      optionFlag: fields[10] as int?,
      createdAt: fields[11] as String?,
      updatedAt: fields[12] as String?,
      ingredients: (fields[13] as List?)?.cast<RequestIngredientVO>(),
      quantity: fields[14] as int?,
      selectedSize: fields[15] as String?,
      selectedPrice: fields[16] as int?,
      optionList: (fields[20] as List?)?.cast<OptionVO>(),
      rawList: (fields[21] as List?)?.cast<String>(),
      toppingList: (fields[22] as List?)?.cast<RequestToppingVO>(),
      specialRemark: fields[23] as String?,
      optionName: fields[25] as String?,
      optionId: fields[24] as int?,
      index: fields[26] as int?,
      toppingPrice: fields[27] as int?,
      totalForOnlyItem: fields[17] as double?,
      totalToppingPrice: fields[18] as double?,
      totalBothCardAndTopping: fields[19] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductVO obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.categoryId)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.photo)
      ..writeByte(5)
      ..write(obj.sizeOfIngredient)
      ..writeByte(6)
      ..write(obj.displayIndex)
      ..writeByte(7)
      ..write(obj.discountId)
      ..writeByte(8)
      ..write(obj.customDiscountId)
      ..writeByte(9)
      ..write(obj.customPromotionId)
      ..writeByte(10)
      ..write(obj.optionFlag)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.ingredients)
      ..writeByte(14)
      ..write(obj.quantity)
      ..writeByte(15)
      ..write(obj.selectedSize)
      ..writeByte(16)
      ..write(obj.selectedPrice)
      ..writeByte(17)
      ..write(obj.totalForOnlyItem)
      ..writeByte(18)
      ..write(obj.totalToppingPrice)
      ..writeByte(19)
      ..write(obj.totalBothCardAndTopping)
      ..writeByte(20)
      ..write(obj.optionList)
      ..writeByte(21)
      ..write(obj.rawList)
      ..writeByte(22)
      ..write(obj.toppingList)
      ..writeByte(23)
      ..write(obj.specialRemark)
      ..writeByte(24)
      ..write(obj.optionId)
      ..writeByte(25)
      ..write(obj.optionName)
      ..writeByte(26)
      ..write(obj.index)
      ..writeByte(27)
      ..write(obj.toppingPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
