// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionVOAdapter extends TypeAdapter<OptionVO> {
  @override
  final int typeId = 4;

  @override
  OptionVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OptionVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      productId: fields[2] as int?,
      size: fields[3] as String?,
      rawMaterialId: fields[4] as int?,
      amount: fields[5] as int?,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
      rawMaterial: fields[8] as RawMaterialForOptionVO?,
    );
  }

  @override
  void write(BinaryWriter writer, OptionVO obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.rawMaterialId)
      ..writeByte(5)
      ..write(obj.amount)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.rawMaterial);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
