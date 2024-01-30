import 'package:json_annotation/json_annotation.dart';
import 'package:multipurpose_pos_application/data/vos/request_card_product_vo.dart';
part 'request_voucher_vo.g.dart';

@JsonSerializable()
class RequestVoucherVO {
  @JsonKey(name: "backdate_flag")
  int? backDateFlag;

  @JsonKey(name: "backdate")
  String? backDate;

  @JsonKey(name: "cashback_flag")
  int? cashBackFlag;

  @JsonKey(name: "cashback")
  double? cashBack;

  @JsonKey(name: "tax_flag")
  int? taxFlag;

  @JsonKey(name: "taxamount")
  double? taxAmount;

  @JsonKey(name: "grand_total")
  double? grandTotal;

  @JsonKey(name: "total")
  double? total;

  @JsonKey(name: "promotion_id")
  int? promotionId;

  @JsonKey(name: "customer_id")
  int? customerId;

  @JsonKey(name: "sold_by")
  int? soldBy;

  @JsonKey(name: "employee_name")
  String? employeeName;

  @JsonKey(name: "voucher")
  List<RequestCardProductVO?>? voucherItemList;

  RequestVoucherVO({
    this.backDateFlag,
    this.backDate,
    this.cashBackFlag,
    this.cashBack,
    this.taxFlag,
    this.taxAmount,
    this.grandTotal,
    this.total,
    this.promotionId,
    this.customerId,
    this.soldBy,
    this.employeeName,
    this.voucherItemList,
  });

  @override
  String toString() {
    return 'RequestVoucherVO{backDateFlag: $backDateFlag, backDate: $backDate, cashBackFlag: $cashBackFlag, cashBack: $cashBack, taxFlag: $taxFlag, taxAmount: $taxAmount, grandTotal: $grandTotal, total: $total, promotionId: $promotionId, customerId: $customerId, soldBy: $soldBy, employeeName: $employeeName, voucherItemList: $voucherItemList}';
  }

  factory RequestVoucherVO.fromJson(Map<String, dynamic> json) =>
      _$RequestVoucherVOFromJson(json);
  Map<String, dynamic> toJson() => _$RequestVoucherVOToJson(this);
}
