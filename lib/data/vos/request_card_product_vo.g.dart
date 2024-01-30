// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_card_product_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCardProductVO _$RequestCardProductVOFromJson(
        Map<String, dynamic> json) =>
    RequestCardProductVO(
      checkOutId: json['checkout_id'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      orderQuantity: json['order_qty'] as int?,
      size: json['size'] as String?,
      sellingPrice: json['selling_price'] as int?,
      toppingList: (json['poping_list'] as List<dynamic>?)
          ?.map((e) => RequestToppingVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      specialRemark: json['special_remark'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      optionFlag: json['option_flag'] as int?,
      optionId: json['option_id'] as int?,
      optionName: json['option_name'] as String?,
    );

Map<String, dynamic> _$RequestCardProductVOToJson(
        RequestCardProductVO instance) =>
    <String, dynamic>{
      'checkout_id': instance.checkOutId,
      'id': instance.id,
      'name': instance.name,
      'order_qty': instance.orderQuantity,
      'size': instance.size,
      'selling_price': instance.sellingPrice,
      'poping_list': instance.toppingList,
      'special_remark': instance.specialRemark,
      'totalPrice': instance.totalPrice,
      'option_flag': instance.optionFlag,
      'option_id': instance.optionId,
      'option_name': instance.optionName,
    };
