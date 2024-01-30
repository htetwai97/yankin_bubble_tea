// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_topping_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestToppingVOAdapter extends TypeAdapter<RequestToppingVO> {
  @override
  final int typeId = 6;

  @override
  RequestToppingVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequestToppingVO();
  }

  @override
  void write(BinaryWriter writer, RequestToppingVO obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestToppingVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestToppingVO _$RequestToppingVOFromJson(Map<String, dynamic> json) =>
    RequestToppingVO(
      rawMaterialId: json['raw_material_id'] as int?,
      rawMaterialQuantity: json['raw_material_qty'] as int?,
      rawMaterialName: json['raw_material_name'] as String?,
      rawMaterialPrice: json['raw_material_price'] as int?,
      itemId: json['item_id'] as int?,
      itemSize: json['item_size'] as String?,
      itemCheckId: json['item_check_id'] as int?,
      optionId: json['option_id'] as int?,
      totalAmount: json['totalAmount'] as int?,
      salePrice: json['salePrice'] as int?,
      deliPrice: json['deliPrice'] as int?,
    );

Map<String, dynamic> _$RequestToppingVOToJson(RequestToppingVO instance) =>
    <String, dynamic>{
      'raw_material_id': instance.rawMaterialId,
      'raw_material_qty': instance.rawMaterialQuantity,
      'raw_material_name': instance.rawMaterialName,
      'raw_material_price': instance.rawMaterialPrice,
      'item_id': instance.itemId,
      'item_size': instance.itemSize,
      'item_check_id': instance.itemCheckId,
      'option_id': instance.optionId,
      'totalAmount': instance.totalAmount,
      'salePrice': instance.salePrice,
      'deliPrice': instance.deliPrice,
    };
