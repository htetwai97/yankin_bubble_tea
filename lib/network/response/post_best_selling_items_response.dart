import 'dart:developer';

import '../../data/vos/high_sale_item_vo.dart';

class PostBestSellingItemsResponse {
  List<HighSaleItemVO>? items;
  bool? success;
  String? message;

  PostBestSellingItemsResponse({this.items, this.success, this.message});

  PostBestSellingItemsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      items = <HighSaleItemVO>[];
      json['data'].forEach((v) {
        items!.add(new HighSaleItemVO.fromJson(v));
      });
    } else {
      log('items: $items.length');
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> items = new Map<String, dynamic>();
    if (this.items != null) {
      items['data'] = this.items!.map((v) => v.toJson()).toList();
    }
    items['success'] = this.success;
    items['message'] = this.message;
    return items;
  }
}
