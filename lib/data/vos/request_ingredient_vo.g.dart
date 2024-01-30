// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_ingredient_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestIngredientVOAdapter extends TypeAdapter<RequestIngredientVO> {
  @override
  final int typeId = 2;

  @override
  RequestIngredientVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequestIngredientVO(
      id: fields[0] as int?,
      productId: fields[1] as int?,
      rawMaterialId: fields[2] as int?,
      unitName: fields[3] as String?,
      amount: fields[4] as int?,
      createdAt: fields[5] as String?,
      updatedAt: fields[6] as String?,
      rawMaterialName: fields[7] as String?,
      sizeName: fields[8] as String?,
      sellprice: fields[9] as int?,
      deliprice: fields[10] as int?,
      optionName: fields[11] as String?,
      size: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RequestIngredientVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.rawMaterialId)
      ..writeByte(3)
      ..write(obj.unitName)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.rawMaterialName)
      ..writeByte(8)
      ..write(obj.sizeName)
      ..writeByte(9)
      ..write(obj.sellprice)
      ..writeByte(10)
      ..write(obj.deliprice)
      ..writeByte(11)
      ..write(obj.optionName)
      ..writeByte(12)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestIngredientVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
