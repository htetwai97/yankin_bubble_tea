import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_id_for_option_list_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_delete_voucher.dart';
import 'package:multipurpose_pos_application/data/vos/request_option_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_update_promotion_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_voucher_vo.dart';
import 'package:multipurpose_pos_application/data/vos/sales_amounts_vo.dart';
import 'package:multipurpose_pos_application/data/vos/user_data_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_update_category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/ykbbt_user_vo.dart';
import 'package:multipurpose_pos_application/network/api_service/api_constants.dart';
import 'package:multipurpose_pos_application/network/response/post_category_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_category_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_option_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_category_update_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_delete_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_promotion_update_response.dart';
import 'package:multipurpose_pos_application/network/response/post_supplier_update_response.dart';
import 'package:multipurpose_pos_application/network/response/post_raw_materials_response.dart';
import 'package:multipurpose_pos_application/network/response/post_store_ingredientv2_response.dart';
import 'package:multipurpose_pos_application/network/response/post_employee_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_supplier_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_user_data_response.dart';
import 'package:multipurpose_pos_application/network/response/post_voucher_delete_response.dart';
import 'package:multipurpose_pos_application/network/response/post_voucher_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_ykbbt_user_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../data/vos/customer_vo.dart';
import '../../data/vos/date_vo.dart';
import '../../data/vos/employee_vo.dart';
import '../../data/vos/request_brand_create_vo.dart';
import '../../data/vos/request_brand_update_vo.dart';
import '../../data/vos/request_cashback_and_promotion.dart';
import '../../data/vos/request_create_promotion_vo.dart';
import '../../data/vos/request_supplier_vo.dart';
import '../../data/vos/request_update_customer_vo.dart';
import '../../data/vos/request_update_employee_vo.dart';
import '../../data/vos/request_update_raw_material_vo.dart';
import '../../data/vos/request_voucher_detail_vo.dart';
import '../../data/vos/supplier_vo.dart';
import '../../data/vos/voucher_detail_vo.dart';
import '../../data/vos/voucher_start_and_end_date_vo.dart';
import '../../data/vos/voucher_vo.dart';
import '../response/post_best_selling_items_response.dart';
import '../response/post_brand_create_response.dart';
import '../response/post_brand_list_response.dart';
import '../response/post_brand_update_response.dart';
import '../response/post_cashback_and_promotion_response.dart';
import '../response/post_customer_list_response.dart';
import '../response/post_customer_store_response.dart';
import '../response/post_customer_update_response.dart';
import '../response/post_employee_list_response.dart';
import '../response/post_employee_update_response.dart';
import '../response/post_promotion_list_response.dart';
import '../response/post_promotion_store_response.dart';
import '../response/post_raw_material_update_response.dart';
import '../response/post_supplier_store_response.dart';
import '../response/post_voucher_detail_response.dart';
import '../response/post_voucher_history_response.dart';
part 'multipos_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class MultiPosApi {
  factory MultiPosApi(Dio dio) = _MultiPosApi;

  @POST(ENDPOINT_CATEGORY_LIST)
  Future<PostCategoryListResponse> postCategoryListResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
  );

  @POST(ENDPOINT_CATEGORY_STORE)
  Future<PostCategoryStoreResponse> postCategoryStoreResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() CategoryVO categoryVO,
  );

  @POST(ENDPOINT_CATEGORY_UPDATE)
  Future<PostCategoryUpdateResponse> postCategoryUpdateResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestUpdateCategoryVO requestUpdateCategoryVO,
  );

  @POST(ENDPOINT_PRODUCT_LIST)
  Future<PostProductListResponse> postProductListResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
  );

  @POST(ENDPOINT_RAW_MATERIAL)
  Future<PostRawMaterialResponse> postRawMaterialResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
  );

  @POST(ENDPOINT_SUPPLIER_LIST)
  Future<PostSupplierListResponse> postSupplierListResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
  );

  @POST(ENDPOINT_STOREINGREDIENTV2)
  Future<PostStoreIngredientV2Response> postStoreIngredientResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestProductVO requestProductVO,
  );

  @POST(ENDPOINT_PRODUCT_DELETE)
  Future<PostProductDeleteResponse> postProductDeleteResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestProductVO requestProductVO,
  );

  @POST(ENDPOINT_SUPPLIER_STORE)
  Future<PostSupplierStoreResponse> postSupplierStoreResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() SupplierVO supplierVO,
  );

  @POST(ENDPOINT_SUPPLIER_UPDATE)
  Future<PostSupplierUpdateResponse> postSupplierUpdateResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestSupplierVO requestSupplierVO,
  );

  @GET(ENDPOINT_CUSTOMER_LIST)
  Future<PostCustomerListResponse> postCustomerListResponse();

  @POST(ENDPOINT_CUSTOMER_STORE)
  Future<PostCustomerStoreResponse> postCustomerStoreResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() CustomerVO customerVO,
  );

  @POST(ENDPOINT_CUSTOMER_UPDATE)
  Future<PostCustomerUpdateResponse> postCustomerUpdateResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestUpdateCustomerVO requestUpdateCustomerVO,
  );

  @POST(ENDPOINT_EMPLOYEE_LIST)
  Future<PostEmployeeListResponse> postEmployeeListResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
  );

  @POST(ENDPOINT_BRAND_LIST)
  Future<PostBrandListResponse> postBrandListResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
  );

  @POST(ENDPOINT_BRAND_CREATE)
  Future<PostBrandCreateResponse> postBrandCreateResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestBrandCreateVO requestBrandCreateVO,
  );

  @POST(ENDPOINT_BRAND_UPDATE)
  Future<PostBrandUpdateResponse> postBrandUpdateResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestBrandUpdateVO requestBrandUpdateVO,
  );

  // @POST(ENDPOINT_EMPLOYEE_STORE)
  // Future<PostEmployeeStoreResponse> postEmployeeStoreResponse(
  //   @Header(PARAM_CONTENT_TYPE) String contentType,
  //   @Header(PARAM_ACCEPT) String accept,
  //   @Part() FormData formData,
  // );

  // @POST(ENDPOINT_EMPLOYEE_UPDATE)
  // Future<PostEmployeeUpdateResponse> postEmployeeUpdateResponse(
  //   @Header(PARAM_CONTENT_TYPE) String contentType,
  //   @Header(PARAM_ACCEPT) String accept,
  //   @Body() RequestUpdateEmployeeVO requestUpdateEmployeeVO,
  // );

  @POST(ENDPOINT_BEST_SELLING_ITEMS)
  Future<PostBestSellingItemsResponse> postBestSellingItemsResponse(
      @Header(PARAM_CONTENT_TYPE) String contentType,
      @Header(PARAM_ACCEPT) String accept,
      @Body() DateVO dateVO);

  // @POST(ENDPOINT_VOUCHER_HISTORY)
  // Future<PostVoucherHistoryResponse> postVoucherHistoryResponse(
  //     @Header(PARAM_CONTENT_TYPE) String contentType,
  //     @Header(PARAM_ACCEPT) String accept,
  //     @Body() VoucherStartAndEndDateVO voucherStartAndEndDateVO);

  @POST(ENDPOINT_VOUCHER_DETAIL)
  Future<PostVoucherDetailResponse> postVoucherDetailResponse(
      @Header(PARAM_CONTENT_TYPE) String contentType,
      @Header(PARAM_ACCEPT) String accept,
      @Body() RequestVoucherDetailVO requestVoucherDetailVO);

  @GET(ENDPOINT_PROMOTION_LIST)
  Future<PostPromotionListResponse> postPromotionListResponse();

  @POST(ENDPOINT_PROMOTION_STORE)
  Future<PostPromotionStoreResponse> postPromotionStoreResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestCreatePromotionVO requestCreatePromotionVO,
  );

  @POST(ENDPOINT_MAIN_LOGIN)
  Future<PostUserDataResponse> postUserDataResponse(
      @Header(PARAM_CONTENT_TYPE) String contentType,
      @Header(PARAM_ACCEPT) String accept,
      @Body() UserDataVO userDataVO);

  @POST(ENDPOINT_YKBBT_LOGIN)
  Future<PostYkbbtUserResponse> postYkbbtLoginResponse(
      @Header(PARAM_CONTENT_TYPE) String contentType,
      @Header(PARAM_ACCEPT) String accept,
      @Body() UserDataVO userDataVO);

  @POST(ENDPOINT_OPTION_LIST)
  Future<PostOptionListResponse> postOptionList(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() ProductIdForOptionListVO productIdForOptionListVO,
  );

  @POST(ENDPOINT_VOUCHER_STORE)
  Future<PostVoucherStoreResponse> postVoucherStore(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestVoucherVO requestVoucherVO,
  );

  @POST(ENDPOINT_VOUCHER_DELETE)
  Future<PostVoucherDeleteResponse> postVoucherDeleteResponse(
      @Header(PARAM_CONTENT_TYPE) String contentType,
      @Header(PARAM_ACCEPT) String accept,
      @Body() RequestDeleteVoucher requestDeleteVoucher);

  @POST(ENDPOINT_PROMOTION_UPDATE)
  Future<PostPromotionUpdateResponse> postPromotionUpdateResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestUpdatePromotionVO requestUpdatePromotionVO,
  );

  @POST(ENDPOINT_RAW_MATERIAL_UPDATE)
  Future<PostRawMaterialUpdateResponse> postRawMaterialUpdateResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestUpdateRawMaterialVO requestUpdateRawMaterialVO,
  );

  @GET(ENDPOINT_VOUCHER_SALES_TOTAL)
  Future<SaleAmountVO> getSalesTotal();

  @POST(ENDPOINT_CASHBACK_AND_PROMO)
  Future<PostCashbackAndPromotionResponse> postCashbackAndPromotionResponse(
    @Header(PARAM_CONTENT_TYPE) String contentType,
    @Header(PARAM_ACCEPT) String accept,
    @Body() RequestCashbackAndPromotion requestCashbackAndPromotion,
  );
}
