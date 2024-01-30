import 'package:dio/dio.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_id_for_option_list_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_voucher_vo.dart';
import 'package:multipurpose_pos_application/data/vos/sales_amounts_vo.dart';
import 'package:multipurpose_pos_application/data/vos/user_data_vo.dart';
import 'package:multipurpose_pos_application/data/vos/ykbbt_user_vo.dart';
import 'package:multipurpose_pos_application/data/vos/voucher_detail_vo.dart';
import 'package:multipurpose_pos_application/data/vos/voucher_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_create_promotion_vo.dart';
import 'package:multipurpose_pos_application/network/response/post_category_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_category_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_option_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_delete_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_raw_materials_response.dart';
import 'package:multipurpose_pos_application/network/response/post_store_ingredientv2_response.dart';
import 'package:multipurpose_pos_application/network/response/post_supplier_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_employee_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_user_data_response.dart';
import 'package:multipurpose_pos_application/network/response/post_voucher_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_ykbbt_user_response.dart';
import 'package:multipurpose_pos_application/network/response/post_brand_create_response.dart';
import 'package:multipurpose_pos_application/network/response/post_brand_update_response.dart';

import '../../../data/vos/request_brand_create_vo.dart';
import '../../../data/vos/request_brand_update_vo.dart';
import '../../../data/vos/customer_vo.dart';
import '../../../data/vos/date_vo.dart';
import '../../../data/vos/request_cashback_and_promotion.dart';
import '../../../data/vos/request_delete_voucher.dart';
import '../../../data/vos/request_supplier_vo.dart';
import '../../../data/vos/request_update_category_vo.dart';
import '../../../data/vos/request_update_customer_vo.dart';
import '../../../data/vos/request_update_employee_vo.dart';
import '../../../data/vos/request_update_promotion_vo.dart';
import '../../../data/vos/request_update_raw_material_vo.dart';
import '../../../data/vos/request_voucher_detail_vo.dart';
import '../../../data/vos/supplier_vo.dart';
import '../../../data/vos/employee_vo.dart';
import '../../../data/vos/voucher_start_and_end_date_vo.dart';
import '../../response/post_best_selling_items_response.dart';
import '../../response/post_brand_list_response.dart';
import '../../response/post_cashback_and_promotion_response.dart';
import '../../response/post_category_update_response.dart';
import '../../response/post_customer_list_response.dart';
import '../../response/post_customer_store_response.dart';
import '../../response/post_customer_update_response.dart';
import '../../response/post_employee_store_response.dart';
import '../../response/post_employee_update_response.dart';
import '../../response/post_promotion_update_response.dart';
import '../../response/post_raw_material_update_response.dart';
import '../../response/post_voucher_delete_response.dart';
import '../../response/post_voucher_detail_response.dart';
import '../../response/post_voucher_history_response.dart';
import '../../response/post_promotion_list_response.dart';
import '../../response/post_promotion_store_response.dart';
import '../../response/post_supplier_store_response.dart';
import '../../response/post_supplier_update_response.dart';

abstract class RetroFitDataAgent {
  // Category
  Future<PostCategoryListResponse> postCategoryListResponse();
  Future<PostCategoryStoreResponse> postCategoryStoreResponse(
      CategoryVO categoryVO);
  Future<PostCategoryUpdateResponse> postCategoryUpdateResponse(
      RequestUpdateCategoryVO requestUpdateCategoryVO);

  // Product
  Future<PostProductListResponse> postProductListResponse();
  Future<PostProductDeleteResponse> postProductDeleteResponse(
      RequestProductVO requestProductVO);

  Future<PostRawMaterialResponse> postRawMaterialResponse();
  Future<PostRawMaterialUpdateResponse> postRawMaterialUpdateResponse(
      RequestUpdateRawMaterialVO requestUpdateRawMaterialVO);
  Future<PostStoreIngredientV2Response> postStoreIngredientResponse(
      RequestProductVO requestProductVO);

  // Supplier
  Future<PostSupplierListResponse> postSupplierListResponse();
  Future<PostSupplierStoreResponse> postSupplierStoreResponse(
      SupplierVO supplierVO);
  Future<PostSupplierUpdateResponse> postSupplierUpdateResponse(
      RequestSupplierVO requestSupplierVO);

  Future<PostCustomerListResponse> postCustomerListResponse();
  Future<PostCustomerStoreResponse> postCustomerStoreResponse(
      CustomerVO customerVO);
  Future<PostCustomerUpdateResponse> postCustomerUpdateResponse(
      RequestUpdateCustomerVO requestUpdateCustomerVO);
  Future<PostEmployeeListResponse> postEmployeeListResponse();
  // Future<PostEmployeeUpdateResponse> postEmployeeUpdateResponse(
  //     RequestUpdateEmployeeVO requestUpdateEmployeeVO);
  // Future<PostEmployeeStoreResponse> postEmployeeStoreResponse(
  //     FormData employeeVO);
  Future<PostBestSellingItemsResponse> postBestSellingItemsResponse(
      DateVO dateVO);

  Future<PostVoucherDetailResponse> postVoucherDetailResponse(
      RequestVoucherDetailVO requestVoucherDetailVO);
  // Future<PostVoucherHistoryResponse> postVoucherHistoryResponse(
  //     VoucherStartAndEndDateVO voucherStartAndEndDateVO);
  Future<PostVoucherDeleteResponse> postVoucherDeleteResponse(
      RequestDeleteVoucher requestDeleteVoucher);

  Future<PostPromotionListResponse> postPromotionListResponse();
  Future<PostPromotionStoreResponse> postPromotionStoreResponse(
      RequestCreatePromotionVO requestCreatePromotionVO);
  Future<PostPromotionUpdateResponse> postPromotionUpdateResponse(
      RequestUpdatePromotionVO requestUpdatePromotionVO);

  Future<PostBrandListResponse> postBrandListResponse();
  Future<PostBrandCreateResponse> postBrandCreateResponse(
      RequestBrandCreateVO requestBrandCreateVO);
  Future<PostBrandUpdateResponse> postBrandUpdateResponse(
      RequestBrandUpdateVO requestBrandUpdateVO);

  Future<PostUserDataResponse> postUserDataResponse(UserDataVO userDataVO);
  Future<PostYkbbtUserResponse> postYkbbtLoginResponse(UserDataVO userDataVO);
  Future<PostOptionListResponse> postOptionList(
    ProductIdForOptionListVO productIdForOptionListVO,
  );
  Future<PostVoucherStoreResponse> postVoucherStore(
    RequestVoucherVO requestVoucherVO,
  );
  Future<SaleAmountVO> getSalesTotal();

  // Future<PostCashbackAndPromotionResponse> postCashbackAndPromotionResponse(
  //     RequestCashbackAndPromotion requestCashbackAndPromotion);
}
