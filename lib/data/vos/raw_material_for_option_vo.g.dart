// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_material_for_option_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RawMaterialForOptionVOAdapter
    extends TypeAdapter<RawMaterialForOptionVO> {
  @override
  final int typeId = 5;

  @override
  RawMaterialForOptionVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RawMaterialForOptionVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      categoryId: fields[2] as int?,
      brandId: fields[3] as int?,
      supplierId: fields[4] as int?,
      inStockQty: fields[5] as int?,
      unit: fields[6] as String?,
      reorderQty: fields[7] as int?,
      purchasePrice: fields[8] as int?,
      currency: fields[9] as String?,
      toppingFlag: fields[10] as int?,
      toppingSalesAmount: fields[11] as int?,
      toppingSalesPrice: fields[12] as int?,
      toppingDeliPrice: fields[13] as int?,
      toppingPhotoPath: fields[14] as String?,
      specialFlag: fields[15] as int?,
      createdAt: fields[16] as String?,
      updatedAt: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RawMaterialForOptionVO obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.categoryId)
      ..writeByte(3)
      ..write(obj.brandId)
      ..writeByte(4)
      ..write(obj.supplierId)
      ..writeByte(5)
      ..write(obj.inStockQty)
      ..writeByte(6)
      ..write(obj.unit)
      ..writeByte(7)
      ..write(obj.reorderQty)
      ..writeByte(8)
      ..write(obj.purchasePrice)
      ..writeByte(9)
      ..write(obj.currency)
      ..writeByte(10)
      ..write(obj.toppingFlag)
      ..writeByte(11)
      ..write(obj.toppingSalesAmount)
      ..writeByte(12)
      ..write(obj.toppingSalesPrice)
      ..writeByte(13)
      ..write(obj.toppingDeliPrice)
      ..writeByte(14)
      ..write(obj.toppingPhotoPath)
      ..writeByte(15)
      ..write(obj.specialFlag)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RawMaterialForOptionVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
