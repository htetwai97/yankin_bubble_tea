import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/network/api_service/api_constants.dart';
import 'package:multipurpose_pos_application/network/response/post_new_product_response.dart';
import 'package:multipurpose_pos_application/network/response/post_product_edit_response.dart';

import '../../../data/vos/employee_vo.dart';
import '../../../data/vos/request_cashback_and_promotion.dart';
import '../../../data/vos/request_raw_material_vo.dart';
import '../../../data/vos/request_update_employee_vo.dart';
import '../../../data/vos/voucher_start_and_end_date_vo.dart';
import '../../response/post_cashback_and_promotion_response.dart';
import '../../response/post_employee_store_response.dart';
import '../../response/post_employee_update_response.dart';
import '../../response/post_material_create_response.dart';
import '../../response/post_voucher_history_response.dart';

class HttpDataAgent {
  static final HttpDataAgent _singleton = HttpDataAgent._internal();
  factory HttpDataAgent() {
    return _singleton;
  }
  HttpDataAgent._internal();

  Future<PostEditProductResponse> postEditProduct(
    File file,
    String id,
    String productName,
    String description,
    String categoryId,
    String displayIndex,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$BASE_URL$ENDPOINT_PRODUCT_EDIT"),
    );

    request.fields.addAll({
      'product_id': id,
      'name': productName,
      'category_id': categoryId,
      'description': description,
      'display_index': displayIndex,
    });

    request.files.add(
      http.MultipartFile.fromBytes(
        'photo',
        await file.readAsBytes(),
        filename: file.path.split('/').last,
      ),
    );

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return PostEditProductResponse.fromJson(jsonDecode(responseBody));
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<PostEditProductResponse> postEditProductV2(
    String id,
    String productName,
    String description,
    String categoryId,
    String displayIndex,
  ) async {
    var requestData = {
      'product_id': id,
      'name': productName,
      'category_id': categoryId,
      'description': description,
      'display_index': displayIndex,
    };
    var body = json.encode(requestData);
    final headers = {
      PARAM_CONTENT_TYPE: APPLICATIONJSON,
      PARAM_ACCEPT: APPLICATIONJSON
    };
    final url = Uri.parse("$BASE_URL$ENDPOINT_PRODUCT_EDITV2");
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return PostEditProductResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<int> postStoreOption(
      List<RequestIngredientVO>? requestIngredientList) async {
    var requestData = {
      'options': requestIngredientList,
    };
    var body = json.encode(requestData);
    final headers = {
      PARAM_CONTENT_TYPE: APPLICATIONJSON,
      PARAM_ACCEPT: APPLICATIONJSON
    };
    final url = Uri.parse("$BASE_URL$ENDPOINT_STORE_OPTION");
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<PostNewProductResponse> postNewProduct(
    File file,
    String productName,
    String description,
    String categoryId,
    String displayIndex,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$BASE_URL$ENDPOINT_PRODUCT_STORE"),
    );

    request.fields.addAll({
      'name': productName,
      'category_id': categoryId,
      'description': description,
      'display_index': displayIndex,
    });

    request.files.add(
      http.MultipartFile.fromBytes(
        'photo',
        await file.readAsBytes(),
        filename: file.path.split('/').last,
      ),
    );

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return PostNewProductResponse.fromJson(jsonDecode(responseBody));
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<PostNewProductResponse> postNewProductV2(
    String productName,
    String description,
    String categoryId,
  ) async {
    var requestData = {
      'name': productName,
      'category_id': categoryId,
      'description': description,
    };
    var body = json.encode(requestData);
    final headers = {
      PARAM_CONTENT_TYPE: APPLICATIONJSON,
      PARAM_ACCEPT: APPLICATIONJSON
    };
    final url = Uri.parse("$BASE_URL$ENDPOINT_PRODUCT_STORE");
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return PostNewProductResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<PostEmployeeStoreResponse> postNewEmployee(
      EmployeeVO employeeVO) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$BASE_URL$ENDPOINT_EMPLOYEE_STORE"),
    );

    request.fields.addAll({
      'name': employeeVO.name ?? "",
      'email': employeeVO.email ?? "",
      'password': employeeVO.password ?? "",
      'salary': employeeVO.salary.toString(),
      'phone': employeeVO.phone ?? "",
      'address': employeeVO.address ?? "",
      'role': employeeVO.role.toString(),
    });

    request.files.add(
      http.MultipartFile.fromBytes(
        'photo',
        await employeeVO.photo!.readAsBytes(),
        filename: employeeVO.photo?.path.split('/').last,
      ),
    );

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return PostEmployeeStoreResponse.fromJson(jsonDecode(responseBody));
    } else {
      int code = response.statusCode;
      log('response : $code');
      throw Exception('Failed to load response $responseBody');
    }
  }

  Future<PostVoucherHistoryResponse> postVoucherHistoryResponse(
      VoucherStartAndEndDateVO voucherStartAndEndDateVO) async {
    var requestData = {
      'start_timetick': voucherStartAndEndDateVO.startDate,
      'end_timetick': voucherStartAndEndDateVO.endDate
    };
    var body = json.encode(requestData);
    final headers = {
      PARAM_CONTENT_TYPE: APPLICATIONJSON,
      PARAM_ACCEPT: APPLICATIONJSON
    };
    final url = Uri.parse("$BASE_URL$ENDPOINT_VOUCHER_HISTORY");
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return PostVoucherHistoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<PostCashbackAndPromotionResponse> postCashbackAndPromotionResponse(
      RequestCashbackAndPromotion requestCashbackAndPromotion) async {
    var requestData = {
      'start_timetick': requestCashbackAndPromotion.startDate,
      'end_timetick': requestCashbackAndPromotion.endDate,
      'cb_or_promo_flag': requestCashbackAndPromotion.cbOrPromoFlag
    };
    var body = json.encode(requestData);
    final headers = {
      PARAM_CONTENT_TYPE: APPLICATIONJSON,
      PARAM_ACCEPT: APPLICATIONJSON
    };
    final url = Uri.parse("$BASE_URL$ENDPOINT_CASHBACK_AND_PROMO");
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return PostCashbackAndPromotionResponse.fromJson(
          jsonDecode(response.body));
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<PostEmployeeUpdateResponse> postEmployeeUpdate(
      RequestUpdateEmployeeVO requestUpdateEmployeeVO) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$BASE_URL$ENDPOINT_EMPLOYEE_UPDATE"),
    );

    request.fields.addAll({
      'employee_id': requestUpdateEmployeeVO.employeeId.toString(),
      'name': requestUpdateEmployeeVO.name ?? 'name',
      'email': requestUpdateEmployeeVO.email ?? 'first@gmail.com',
      'phone': requestUpdateEmployeeVO.phone ?? '09787890090',
      'address': requestUpdateEmployeeVO.address ?? 'yangon',
      'password': requestUpdateEmployeeVO.password ?? 'fetwe',
      'nrc': requestUpdateEmployeeVO.nrc ?? 'nrc',
      'salary': requestUpdateEmployeeVO.salary.toString(),
      'user_id': "2"
    });

    request.files.add(
      http.MultipartFile.fromBytes(
        'photo',
        await requestUpdateEmployeeVO.photo!.readAsBytes(),
        filename: requestUpdateEmployeeVO.photo?.path.split('/').last,
      ),
    );

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return PostEmployeeUpdateResponse.fromJson(jsonDecode(responseBody));
    } else {
      int code = response.statusCode;
      log('response : $code');

      throw Exception('Failed to load response $responseBody');
    }
  }

  Future<PostMaterialCreateResponse> postNewMaterial(
      RequestRawMaterialVO requestRawMaterialVO) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$BASE_URL$ENDPOINT_RAW_MATERIAL_CREATE"),
    );

    request.fields.addAll({
      'raw_material_id': requestRawMaterialVO.rawMaterialId.toString(),
      'name': requestRawMaterialVO.name ?? "icc",
      'category_id': requestRawMaterialVO.categoryId.toString(),
      'brand_id': requestRawMaterialVO.brandId.toString(),
      'supplier_id': requestRawMaterialVO.supplierId.toString(),
      'instock_qty': requestRawMaterialVO.inStockQty.toString(),
      'reorder_qty': requestRawMaterialVO.reorderQty.toString(),
      'unit': requestRawMaterialVO.unit.toString(),
      'purchase_price': requestRawMaterialVO.purchasePrice.toString(),
      'currency': requestRawMaterialVO.currency.toString(),
      'special_flag': requestRawMaterialVO.specialFlag.toString(),
      'topping_flag': requestRawMaterialVO.toppingFlag.toString(),
      'updated_at': "2023-06-22T03:15:38.000000Z",
      'created_at': "2023-06-22T03:15:38.000000Z",
      'topping_sales_amount':
          requestRawMaterialVO.toppingSalesAmount.toString(),
      'topping_sales_price': requestRawMaterialVO.toppingSalesPrice.toString()
    });

    request.files.add(
      http.MultipartFile.fromBytes(
        'topping_photo_path',
        await requestRawMaterialVO.toppingPhotoPath!.readAsBytes(),
        filename: requestRawMaterialVO.toppingPhotoPath?.path.split('/').last,
      ),
    );

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return PostMaterialCreateResponse.fromJson(jsonDecode(responseBody));
    } else {
      int code = response.statusCode;
      log('response : $code');
      throw Exception('Failed to load response $responseBody');
    }
  }
}
