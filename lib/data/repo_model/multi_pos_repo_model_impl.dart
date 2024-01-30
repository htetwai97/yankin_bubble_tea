import 'dart:io';

import 'package:dio/dio.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/vos/category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_id_for_option_list_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_update_category_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_voucher_vo.dart';
import 'package:multipurpose_pos_application/data/vos/sales_amounts_vo.dart';
import 'package:multipurpose_pos_application/data/vos/user_data_vo.dart';
import 'package:multipurpose_pos_application/data/vos/ykbbt_user_vo.dart';
import 'package:multipurpose_pos_application/network/data_agents/http/http_data_agent.dart';
import 'package:multipurpose_pos_application/data/vos/supplier_vo.dart';
import 'package:multipurpose_pos_application/data/vos/employee_vo.dart';
import 'package:multipurpose_pos_application/data/vos/customer_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_cashback_and_promotion.dart';
import 'package:multipurpose_pos_application/network/data_agents/retrofit/retrofit_data_agent.dart';
import 'package:multipurpose_pos_application/network/data_agents/retrofit/retrofit_data_agent_impl.dart';
import 'package:multipurpose_pos_application/network/response/post_category_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_category_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_new_product_response.dart';
import 'package:multipurpose_pos_application/network/response/post_cashback_and_promotion_response.dart';
import 'package:multipurpose_pos_application/network/response/post_option_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_delete_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_edit_response.dart';
import 'package:multipurpose_pos_application/network/response/post_raw_materials_response.dart';
import 'package:multipurpose_pos_application/network/response/post_store_ingredientv2_response.dart';
import 'package:multipurpose_pos_application/network/response/post_user_data_response.dart';
import 'package:multipurpose_pos_application/network/response/post_voucher_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_ykbbt_user_response.dart';
import 'package:multipurpose_pos_application/persistence/hive/daos/size_with_ingredient_dao.dart';
import 'package:multipurpose_pos_application/persistence/hive/daos/product_dao.dart';
import 'package:multipurpose_pos_application/network/response/post_customer_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_employee_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_employee_store_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_supplier_list_response.dart';
import 'package:multipurpose_pos_application/network/response/post_supplier_store_response.dart';
import 'package:multipurpose_pos_application/persistence/share_preference/share_preference.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../network/response/post_best_selling_items_response.dart';
import '../../network/response/post_brand_list_response.dart';
import '../../network/response/post_brand_create_response.dart';
import '../../network/response/post_brand_update_response.dart';
import '../../network/response/post_category_update_response.dart';
import '../../network/response/post_customer_list_response.dart';
import '../../network/response/post_customer_update_response.dart';
import '../../network/response/post_employee_update_response.dart';
import '../../network/response/post_material_create_response.dart';
import '../../network/response/post_promotion_list_response.dart';
import '../../network/response/post_promotion_store_response.dart';
import '../../network/response/post_promotion_update_response.dart';
import '../../network/response/post_raw_material_update_response.dart';
import '../../network/response/post_supplier_update_response.dart';
import '../../network/response/post_voucher_delete_response.dart';
import '../../network/response/post_voucher_detail_response.dart';
import '../../network/response/post_voucher_history_response.dart';
import '../vos/date_vo.dart';
import '../vos/product_vo.dart';
import '../vos/request_brand_create_vo.dart';
import '../vos/request_brand_update_vo.dart';
import '../vos/request_create_promotion_vo.dart';
import '../vos/request_delete_voucher.dart';
import '../vos/request_raw_material_vo.dart';
import '../vos/request_supplier_vo.dart';
import '../vos/request_update_customer_vo.dart';
import '../vos/request_update_employee_vo.dart';
import '../vos/request_update_promotion_vo.dart';
import '../vos/request_update_raw_material_vo.dart';
import '../vos/request_voucher_detail_vo.dart';
import '../vos/voucher_start_and_end_date_vo.dart';

class MultiPosRepoModelImpl extends MultiPosRepoModel {
  static final MultiPosRepoModelImpl _singleton =
      MultiPosRepoModelImpl._internal();
  factory MultiPosRepoModelImpl() {
    return _singleton;
  }
  MultiPosRepoModelImpl._internal();

  /// Daos
  SizeWithIngredientDao sizeWithIngredientDao = SizeWithIngredientDao();
  ProductDao productDao = ProductDao();

  /// Dependencies
  SharePreferenceModel sharePreferenceModel = SharePreferenceModel();
  RetroFitDataAgent retroFitDataAgent = RetrofitDataAgentImpl();
  HttpDataAgent httpDataAgent = HttpDataAgent();

  @override
  Future<int> getInt(String key) {
    return sharePreferenceModel.getInt(key);
  }

  @override
  Future<void> saveInt(String key, int value) {
    return sharePreferenceModel.saveInt(key, value);
  }

  @override
  Future<PostCategoryListResponse> postCategoryListResponse() {
    return retroFitDataAgent.postCategoryListResponse();
  }

  @override
  Future<PostCategoryStoreResponse> postCategoryStoreResponse(
      CategoryVO categoryVO) {
    return retroFitDataAgent.postCategoryStoreResponse(categoryVO);
  }

  @override
  Future<PostCategoryUpdateResponse> postCategoryUpdateResponse(
      RequestUpdateCategoryVO requestUpdateCategoryVO) {
    return retroFitDataAgent
        .postCategoryUpdateResponse(requestUpdateCategoryVO);
  }

  @override
  Future<PostProductListResponse> postProductListResponse() {
    return retroFitDataAgent.postProductListResponse();
  }

  @override
  Future<PostBrandListResponse> postBrandListResponse() {
    return retroFitDataAgent.postBrandListResponse();
  }

  @override
  Future<PostBrandCreateResponse> postBrandCreateResponse(
      RequestBrandCreateVO requestBrandCreateVO) {
    return retroFitDataAgent.postBrandCreateResponse(requestBrandCreateVO);
  }

  @override
  Future<PostBrandUpdateResponse> postBrandUpdateResponse(
      RequestBrandUpdateVO requestBrandUpdateVO) {
    return retroFitDataAgent.postBrandUpdateResponse(requestBrandUpdateVO);
  }

  @override
  Future<PostRawMaterialResponse> postRawMaterialResponse() {
    return retroFitDataAgent.postRawMaterialResponse();
  }

  @override
  Future<PostRawMaterialUpdateResponse> postRawMaterialUpdateResponse(
      RequestUpdateRawMaterialVO requestUpdateRawMaterialVO) {
    return retroFitDataAgent
        .postRawMaterialUpdateResponse(requestUpdateRawMaterialVO);
  }

  @override
  Future<PostNewProductResponse> postNewProduct(File file, String productName,
      String description, String categoryId, String displayIndex) {
    return httpDataAgent.postNewProduct(
        file, productName, description, categoryId, displayIndex);
  }

  @override
  Future<String> getString(String key) {
    return sharePreferenceModel.getString(key);
  }

  @override
  Future<void> saveString(String key, String value) {
    return sharePreferenceModel.saveString(key, value);
  }

  @override
  Future<void> removeSharePrefItem(String key) {
    return sharePreferenceModel.removeSharePrefItem(key);
  }

  @override
  Future<PostStoreIngredientV2Response> postStoreIngredientResponse(
      RequestProductVO requestProductVO) {
    return retroFitDataAgent.postStoreIngredientResponse(requestProductVO);
  }

  @override
  Future<PostProductDeleteResponse> postProductDeleteResponse(
      RequestProductVO requestProductVO) {
    return retroFitDataAgent.postProductDeleteResponse(requestProductVO);
  }

  @override
  void clearSizeWithIngredients() {
    return sizeWithIngredientDao.clearSizeWithIngredients();
  }

  @override
  void deleteSizeWithIngredient(int? timeStamp) {
    return sizeWithIngredientDao.deleteSizeWithIngredient(timeStamp);
  }

  @override
  Stream<List<RequestSizeObjectVO>?> getAllSizeWithIngredients() {
    return sizeWithIngredientDao
        .getAllSizeWithIngredientEventStream()
        .startWith(sizeWithIngredientDao.getAllSizeWithIngredientsStream())
        .map((event) => sizeWithIngredientDao.getAllSizeWithIngredientList());
  }

  @override
  void saveSizeWithIngredientItem(RequestSizeObjectVO? sizeWithIngredient) {
    return sizeWithIngredientDao.saveSizeWithIngredientItem(sizeWithIngredient);
  }

  @override
  Future saveAllSizeOfIngredients(
      List<RequestSizeObjectVO?>? requestSizeObjList) {
    return sizeWithIngredientDao.saveAllSizeOfIngredients(requestSizeObjList);
  }

  @override
  Stream<List<ProductVO>?> getAllProducts() {
    return productDao
        .getAllProductEventStream()
        .startWith(productDao.getAllProductsStream())
        .map((event) => productDao.getAllProductList());
  }

  @override
  Future saveAllProducts(List<ProductVO?>? productObjList) {
    return productDao.saveAllProducts(productObjList);
  }

  @override
  void clearProducts() {
    return productDao.clearProducts();
  }

  // Supplier

  @override
  Future<PostSupplierListResponse> postSupplierListResponse() {
    return retroFitDataAgent.postSupplierListResponse();
  }

  @override
  Future<PostSupplierStoreResponse> postSupplierStoreResponse(
      SupplierVO supplierVO) {
    return retroFitDataAgent.postSupplierStoreResponse(supplierVO);
  }

  @override
  Future<PostSupplierUpdateResponse> postSupplierUpdateResponse(
      RequestSupplierVO requestSupplierVO) {
    return retroFitDataAgent.postSupplierUpdateResponse(requestSupplierVO);
  }

  // Customer

  @override
  Future<PostCustomerListResponse> postCustomerListResponse() {
    return retroFitDataAgent.postCustomerListResponse();
  }

  @override
  Future<PostCustomerStoreResponse> postCustomerStoreResponse(
      CustomerVO customerVO) {
    return retroFitDataAgent.postCustomerStoreResponse(customerVO);
  }

  @override
  Future<PostCustomerUpdateResponse> postCustomerUpdateResponse(
      RequestUpdateCustomerVO requestUpdateCustomerVO) {
    return retroFitDataAgent
        .postCustomerUpdateResponse(requestUpdateCustomerVO);
  }

  // Employee

  @override
  Future<PostEmployeeListResponse> postEmployeeListResponse() {
    return retroFitDataAgent.postEmployeeListResponse();
  }

  @override
  Future<PostEmployeeStoreResponse> postEmployeeStoreResponse(
      EmployeeVO employeeVO) {
    //return RetroFitDataAgent.postEmployeeStoreResponse(employeeVO);
    return httpDataAgent.postNewEmployee(employeeVO);
  }

  @override
  Future<PostEmployeeUpdateResponse> postEmployeeUpdateResponse(
      RequestUpdateEmployeeVO requestUpdateEmployeeVO) {
    return httpDataAgent.postEmployeeUpdate(requestUpdateEmployeeVO);
  }

  // Best selling item

  @override
  Future<PostBestSellingItemsResponse> postBestSellingItemsResponse(
      DateVO dateVO) {
    return retroFitDataAgent.postBestSellingItemsResponse(dateVO);
  }

  @override
  Future<PostVoucherDetailResponse> postVoucherDetailResponse(
      RequestVoucherDetailVO requestVoucherDetailVO) {
    return retroFitDataAgent.postVoucherDetailResponse(requestVoucherDetailVO);
  }

  @override
  Future<PostVoucherHistoryResponse> postVoucherHistoryResponse(
      VoucherStartAndEndDateVO voucherStartAndEndDateVO) {
    // return retroFitDataAgent
    //     .postVoucherHistoryResponse(voucherStartAndEndDateVO);
    return httpDataAgent.postVoucherHistoryResponse(voucherStartAndEndDateVO);
  }

  @override
  Future<PostVoucherDeleteResponse> postVoucherDeleteResponse(
      RequestDeleteVoucher requestDeleteVoucher) {
    return retroFitDataAgent.postVoucherDeleteResponse(requestDeleteVoucher);
  }

  @override
  Future<PostPromotionListResponse> postPromotionListResponse() {
    return retroFitDataAgent.postPromotionListResponse();
  }

  @override
  Future<PostPromotionStoreResponse> postPromotionStoreResponse(
      RequestCreatePromotionVO requestCreatePromotionVO) {
    return retroFitDataAgent
        .postPromotionStoreResponse(requestCreatePromotionVO);
  }

  @override
  Future<PostPromotionUpdateResponse> postPromotionUpdateResponse(
      RequestUpdatePromotionVO requestUpdatePromotionVO) {
    return retroFitDataAgent
        .postPromotionUpdateResponse(requestUpdatePromotionVO);
  }

  @override
  Future<PostUserDataResponse> postUserDataResponse(UserDataVO userDataVO) {
    return retroFitDataAgent.postUserDataResponse(userDataVO);
  }

  @override
  Future<PostYkbbtUserResponse> postYkbbtLoginResponse(UserDataVO userDataVO) {
    return retroFitDataAgent.postYkbbtLoginResponse(userDataVO);
  }

  @override
  Future<PostEditProductResponse> postEditProduct(
      File file,
      String id,
      String productName,
      String description,
      String categoryId,
      String displayIndex) {
    return httpDataAgent.postEditProduct(
        file, id, productName, description, categoryId, displayIndex);
  }

  @override
  Future<PostEditProductResponse> postEditProductV2(
      String id,
      String productName,
      String description,
      String categoryId,
      String displayIndex) {
    return httpDataAgent.postEditProductV2(
        id, productName, description, categoryId, displayIndex);
  }

  @override
  Future<int> postStoreOption(
      List<RequestIngredientVO>? requestIngredientList) {
    return httpDataAgent.postStoreOption(requestIngredientList);
  }

  @override
  Future<PostOptionListResponse> postOptionList(
      ProductIdForOptionListVO productIdForOptionListVO) {
    return retroFitDataAgent.postOptionList(productIdForOptionListVO);
  }

  @override
  Future<PostVoucherStoreResponse> postVoucherStore(
      RequestVoucherVO requestVoucherVO) {
    return retroFitDataAgent.postVoucherStore(requestVoucherVO);
  }

  @override
  Future<SaleAmountVO> getSalesTotal() {
    return retroFitDataAgent.getSalesTotal();
  }

  Future<PostCashbackAndPromotionResponse> postCashbackAndPromotionResponse(
      RequestCashbackAndPromotion requestCashbackAndPromotion) {
    // return retroFitDataAgent
    //     .postCashbackAndPromotionResponse(requestCashbackAndPromotion);
    return httpDataAgent
        .postCashbackAndPromotionResponse(requestCashbackAndPromotion);
  }

  Future<PostMaterialCreateResponse> postMaterialCreateResponse(
      RequestRawMaterialVO requestRawMaterialVO) {
    return httpDataAgent.postNewMaterial(requestRawMaterialVO);
  }

  @override
  Future<void> clearSharePrefItems() {
    return sharePreferenceModel.clearSharePrefItems();
  }

  @override
  void deleteProduct(int? id) {
    productDao.deleteProduct(id);
  }
}
