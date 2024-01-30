// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_size_object_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestSizeObjectVOAdapter extends TypeAdapter<RequestSizeObjectVO> {
  @override
  final int typeId = 1;

  @override
  RequestSizeObjectVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequestSizeObjectVO(
      timeStamp: fields[0] as String?,
      size: fields[1] as String?,
      sellPrice: fields[2] as int?,
      deliPrice: fields[3] as int?,
      ingredients: (fields[4] as List?)?.cast<RequestIngredientVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, RequestSizeObjectVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.timeStamp)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.sellPrice)
      ..writeByte(3)
      ..write(obj.deliPrice)
      ..writeByte(4)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestSizeObjectVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
