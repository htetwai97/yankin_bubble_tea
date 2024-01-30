// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_voucher_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestVoucherVO _$RequestVoucherVOFromJson(Map<String, dynamic> json) =>
    RequestVoucherVO(
      backDateFlag: json['backdate_flag'] as int?,
      backDate: json['backdate'] as String?,
      cashBackFlag: json['cashback_flag'] as int?,
      cashBack: (json['cashback'] as num?)?.toDouble(),
      taxFlag: json['tax_flag'] as int?,
      taxAmount: (json['taxamount'] as num?)?.toDouble(),
      grandTotal: (json['grand_total'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      promotionId: json['promotion_id'] as int?,
      customerId: json['customer_id'] as int?,
      soldBy: json['sold_by'] as int?,
      employeeName: json['employee_name'] as String?,
      voucherItemList: (json['voucher'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : RequestCardProductVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestVoucherVOToJson(RequestVoucherVO instance) =>
    <String, dynamic>{
      'backdate_flag': instance.backDateFlag,
      'backdate': instance.backDate,
      'cashback_flag': instance.cashBackFlag,
      'cashback': instance.cashBack,
      'tax_flag': instance.taxFlag,
      'taxamount': instance.taxAmount,
      'grand_total': instance.grandTotal,
      'total': instance.total,
      'promotion_id': instance.promotionId,
      'customer_id': instance.customerId,
      'sold_by': instance.soldBy,
      'employee_name': instance.employeeName,
      'voucher': instance.voucherItemList,
    };
