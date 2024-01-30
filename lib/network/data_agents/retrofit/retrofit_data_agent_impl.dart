import 'package:dio/dio.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_id_for_option_list_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_create_promotion_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_voucher_vo.dart';
import 'package:multipurpose_pos_application/data/vos/sales_amounts_vo.dart';
import 'package:multipurpose_pos_application/data/vos/supplier_vo.dart';
import 'package:multipurpose_pos_application/data/vos/employee_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_update_employee_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_update_customer_vo.dart';
import 'package:multipurpose_pos_application/data/vos/user_data_vo.dart';
import 'package:multipurpose_pos_application/data/vos/ykbbt_user_vo.dart';
import 'package:multipurpose_pos_application/data/vos/voucher_detail_vo.dart';
import 'package:multipurpose_pos_application/network/api_service/api_constants.dart';
import 'package:multipurpose_pos_application/network/api_service/multipos_api.dart';
import 'package:multipurpose_pos_application/network/data_agents/retrofit/retrofit_data_agent.dart';
import 'package:multipurpose_pos_application/network/response/post_category_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_category_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_option_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_customer_update_response.dart';
import 'package:multipurpose_pos_application/network/response/post_employee_update_response.dart';
import 'package:multipurpose_pos_application/network/response/post_promotion_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_voucher_history_response.dart';
import 'package:multipurpose_pos_application/network/response/post_voucher_detail_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_delete_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_raw_materials_response.dart';
import 'package:multipurpose_pos_application/network/response/post_store_ingredientv2_response.dart';
import 'package:multipurpose_pos_application/network/response/post_customer_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_supplier_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_employee_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_employee_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_supplier_store_response.dart';
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
import '../../../data/vos/request_update_promotion_vo.dart';
import '../../../data/vos/request_update_raw_material_vo.dart';
import '../../../data/vos/request_voucher_detail_vo.dart';
import '../../../data/vos/voucher_start_and_end_date_vo.dart';
import '../../../data/vos/voucher_vo.dart';
import '../../response/post_best_selling_items_response.dart';
import '../../response/post_brand_list_response.dart';
import '../../response/post_cashback_and_promotion_response.dart';
import '../../response/post_category_update_response.dart';
import '../../response/post_customer_store_response.dart';
import '../../response/post_customer_update_response.dart';
import '../../response/post_promotion_list_response.dart';
import '../../response/post_promotion_update_response.dart';
import '../../response/post_raw_material_update_response.dart';
import '../../response/post_supplier_update_response.dart';
import '../../response/post_voucher_delete_response.dart';
import '../../response/post_voucher_history_response.dart';

class RetrofitDataAgentImpl extends RetroFitDataAgent {
  late MultiPosApi mApi;

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = MultiPosApi(dio);
  }

  @override
  Future<PostCategoryListResponse> postCategoryListResponse() {
    return mApi.postCategoryListResponse(APPLICATIONJSON, APPLICATIONJSON);
  }

  @override
  Future<PostCategoryStoreResponse> postCategoryStoreResponse(
      CategoryVO categoryVO) {
    return mApi.postCategoryStoreResponse(
        APPLICATIONJSON, APPLICATIONJSON, categoryVO);
  }

  @override
  Future<PostCategoryUpdateResponse> postCategoryUpdateResponse(
      RequestUpdateCategoryVO requestUpdateCategoryVO) {
    return mApi.postCategoryUpdateResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestUpdateCategoryVO);
  }

  @override
  Future<PostProductListResponse> postProductListResponse() {
    return mApi.postProductListResponse(APPLICATIONJSON, APPLICATIONJSON);
  }

  @override
  Future<PostBrandListResponse> postBrandListResponse() {
    return mApi.postBrandListResponse(APPLICATIONJSON, APPLICATIONJSON);
  }

  @override
  Future<PostBrandCreateResponse> postBrandCreateResponse(
      RequestBrandCreateVO requestBrandCreateVO) {
    return mApi.postBrandCreateResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestBrandCreateVO);
  }

  @override
  Future<PostBrandUpdateResponse> postBrandUpdateResponse(
      RequestBrandUpdateVO requestBrandUpdateVO) {
    return mApi.postBrandUpdateResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestBrandUpdateVO);
  }

  @override
  Future<PostRawMaterialResponse> postRawMaterialResponse() {
    return mApi.postRawMaterialResponse(APPLICATIONJSON, APPLICATIONJSON);
  }

  @override
  Future<PostRawMaterialUpdateResponse> postRawMaterialUpdateResponse(
      RequestUpdateRawMaterialVO requestUpdateRawMaterialVO) {
    return mApi.postRawMaterialUpdateResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestUpdateRawMaterialVO);
  }

  @override
  Future<PostStoreIngredientV2Response> postStoreIngredientResponse(
      RequestProductVO requestProductVO) {
    return mApi.postStoreIngredientResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestProductVO);
  }

  @override
  Future<PostProductDeleteResponse> postProductDeleteResponse(
      RequestProductVO requestProductVO) {
    return mApi.postProductDeleteResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestProductVO);
  }

  @override
  Future<PostSupplierListResponse> postSupplierListResponse() {
    return mApi.postSupplierListResponse(APPLICATIONJSON, APPLICATIONJSON);
  }

  @override
  Future<PostSupplierStoreResponse> postSupplierStoreResponse(
      SupplierVO supplierVO) {
    return mApi.postSupplierStoreResponse(
        APPLICATIONJSON, APPLICATIONJSON, supplierVO);
  }

  @override
  Future<PostSupplierUpdateResponse> postSupplierUpdateResponse(
      RequestSupplierVO requestSupplierVO) {
    return mApi.postSupplierUpdateResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestSupplierVO);
  }

  @override
  Future<PostCustomerListResponse> postCustomerListResponse() {
    return mApi.postCustomerListResponse();
  }

  @override
  Future<PostCustomerStoreResponse> postCustomerStoreResponse(
      CustomerVO customerVO) {
    return mApi.postCustomerStoreResponse(
        APPLICATIONJSON, APPLICATIONJSON, customerVO);
  }

  @override
  Future<PostCustomerUpdateResponse> postCustomerUpdateResponse(
      RequestUpdateCustomerVO requestUpdateCustomerVO) {
    return mApi.postCustomerUpdateResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestUpdateCustomerVO);
  }

  @override
  Future<PostEmployeeListResponse> postEmployeeListResponse() {
    return mApi.postEmployeeListResponse(APPLICATIONJSON, APPLICATIONJSON);
  }

  // @override
  // Future<PostEmployeeStoreResponse> postEmployeeStoreResponse(
  //     FormData employeeVO) {
  //   return mApi.postEmployeeStoreResponse(
  //       MULTIPART_FORM_DATA, APPLICATIONJSON, employeeVO);
  // }

  // @override
  // Future<PostEmployeeUpdateResponse> postEmployeeUpdateResponse(
  //     RequestUpdateEmployeeVO requestUpdateEmployeeVO) {
  //   return mApi.postEmployeeUpdateResponse(
  //       MULTIPART_FORM_DATA, APPLICATIONJSON, requestUpdateEmployeeVO);
  // }

  @override
  Future<PostBestSellingItemsResponse> postBestSellingItemsResponse(
      DateVO dateVO) {
    return mApi.postBestSellingItemsResponse(
        APPLICATIONJSON, APPLICATIONJSON, dateVO);
  }

  // @override
  // Future<PostVoucherHistoryResponse> postVoucherHistoryResponse(
  //     VoucherStartAndEndDateVO voucherStartAndEndDateVO) {
  //   return mApi.postVoucherHistoryResponse(
  //       APPLICATIONJSON, APPLICATIONJSON, voucherStartAndEndDateVO);
  // }

  @override
  Future<PostVoucherDeleteResponse> postVoucherDeleteResponse(
      RequestDeleteVoucher requestDeleteVoucher) {
    return mApi.postVoucherDeleteResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestDeleteVoucher);
  }

  @override
  Future<PostVoucherDetailResponse> postVoucherDetailResponse(
      RequestVoucherDetailVO requestVoucherDetailVO) {
    return mApi.postVoucherDetailResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestVoucherDetailVO);
  }

  @override
  Future<PostPromotionListResponse> postPromotionListResponse() {
    return mApi.postPromotionListResponse();
  }

  @override
  Future<PostUserDataResponse> postUserDataResponse(UserDataVO userDataVO) {
    return mApi.postUserDataResponse(
        APPLICATIONJSON, APPLICATIONJSON, userDataVO);
  }

  @override
  Future<PostYkbbtUserResponse> postYkbbtLoginResponse(UserDataVO userDataVO) {
    return mApi.postYkbbtLoginResponse(
        APPLICATIONJSON, APPLICATIONJSON, userDataVO);
  }

  @override
  Future<PostOptionListResponse> postOptionList(
      ProductIdForOptionListVO productIdForOptionListVO) {
    return mApi.postOptionList(
        APPLICATIONJSON, APPLICATIONJSON, productIdForOptionListVO);
  }

  @override
  Future<PostVoucherStoreResponse> postVoucherStore(
      RequestVoucherVO requestVoucherVO) {
    return mApi.postVoucherStore(
        APPLICATIONJSON, APPLICATIONJSON, requestVoucherVO);
  }

  @override
  Future<PostPromotionStoreResponse> postPromotionStoreResponse(
      RequestCreatePromotionVO requestCreatePromotionVO) {
    return mApi.postPromotionStoreResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestCreatePromotionVO);
  }

  @override
  Future<PostPromotionUpdateResponse> postPromotionUpdateResponse(
      RequestUpdatePromotionVO requestUpdatePromotionVO) {
    return mApi.postPromotionUpdateResponse(
        APPLICATIONJSON, APPLICATIONJSON, requestUpdatePromotionVO);
  }

  @override
  Future<SaleAmountVO> getSalesTotal() {
    return mApi.getSalesTotal();
  }
  // @override
  // Future<PostCashbackAndPromotionResponse> postCashbackAndPromotionResponse(
  //     RequestCashbackAndPromotion requestCashbackAndPromotion) {
  //   return mApi.postCashbackAndPromotionResponse(
  //       APPLICATIONJSON, APPLICATIONJSON, requestCashbackAndPromotion);
  // }
}
