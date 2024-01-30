// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multipos_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MultiPosApi implements MultiPosApi {
  _MultiPosApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://yankinbubbletea.kwintechnologykw11.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PostCategoryListResponse> postCategoryListResponse(
    String contentType,
    String accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCategoryListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCategoryListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostCategoryStoreResponse> postCategoryStoreResponse(
    String contentType,
    String accept,
    CategoryVO categoryVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(categoryVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCategoryStoreResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'categories/store',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCategoryStoreResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostCategoryUpdateResponse> postCategoryUpdateResponse(
    String contentType,
    String accept,
    RequestUpdateCategoryVO requestUpdateCategoryVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestUpdateCategoryVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCategoryUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'categories/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCategoryUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostProductListResponse> postProductListResponse(
    String contentType,
    String accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostProductListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'products',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostProductListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostRawMaterialResponse> postRawMaterialResponse(
    String contentType,
    String accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostRawMaterialResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'raw_materials',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostRawMaterialResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostSupplierListResponse> postSupplierListResponse(
    String contentType,
    String accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostSupplierListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'suppliers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostSupplierListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostStoreIngredientV2Response> postStoreIngredientResponse(
    String contentType,
    String accept,
    RequestProductVO requestProductVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestProductVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostStoreIngredientV2Response>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'products/storeIngredientv2',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostStoreIngredientV2Response.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostProductDeleteResponse> postProductDeleteResponse(
    String contentType,
    String accept,
    RequestProductVO requestProductVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestProductVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostProductDeleteResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'products/delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostProductDeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostSupplierStoreResponse> postSupplierStoreResponse(
    String contentType,
    String accept,
    SupplierVO supplierVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(supplierVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostSupplierStoreResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'suppliers/store',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostSupplierStoreResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostSupplierUpdateResponse> postSupplierUpdateResponse(
    String contentType,
    String accept,
    RequestSupplierVO requestSupplierVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestSupplierVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostSupplierUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'suppliers/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostSupplierUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostCustomerListResponse> postCustomerListResponse() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCustomerListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCustomerListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostCustomerStoreResponse> postCustomerStoreResponse(
    String contentType,
    String accept,
    CustomerVO customerVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(customerVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCustomerStoreResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'customers/store',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCustomerStoreResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostCustomerUpdateResponse> postCustomerUpdateResponse(
    String contentType,
    String accept,
    RequestUpdateCustomerVO requestUpdateCustomerVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestUpdateCustomerVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCustomerUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'customers/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCustomerUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostEmployeeListResponse> postEmployeeListResponse(
    String contentType,
    String accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostEmployeeListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'employees',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostEmployeeListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostBestSellingItemsResponse> postBestSellingItemsResponse(
    String contentType,
    String accept,
    DateVO dateVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(dateVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostBestSellingItemsResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'vouchers/best-sale',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostBestSellingItemsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostVoucherDetailResponse> postVoucherDetailResponse(
    String contentType,
    String accept,
    RequestVoucherDetailVO requestVoucherDetailVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestVoucherDetailVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostVoucherDetailResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'vouchers/voucherDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostVoucherDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostPromotionListResponse> postPromotionListResponse() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostPromotionListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'promotions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostPromotionListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostPromotionStoreResponse> postPromotionStoreResponse(
    String contentType,
    String accept,
    RequestCreatePromotionVO requestCreatePromotionVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestCreatePromotionVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostPromotionStoreResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'promotions/store',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostPromotionStoreResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostUserDataResponse> postUserDataResponse(
    String contentType,
    String accept,
    UserDataVO userDataVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(userDataVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostUserDataResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'Main_login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostUserDataResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostYkbbtUserResponse> postYkbbtLoginResponse(
    String contentType,
    String accept,
    UserDataVO userDataVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(userDataVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostYkbbtUserResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostYkbbtUserResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostOptionListResponse> postOptionList(
    String contentType,
    String accept,
    ProductIdForOptionListVO productIdForOptionListVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(productIdForOptionListVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostOptionListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'products/optionList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostOptionListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostVoucherStoreResponse> postVoucherStore(
    String contentType,
    String accept,
    RequestVoucherVO requestVoucherVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestVoucherVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostVoucherStoreResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'vouchers/storev2',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostVoucherStoreResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostVoucherDeleteResponse> postVoucherDeleteResponse(
    String contentType,
    String accept,
    RequestDeleteVoucher requestDeleteVoucher,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestDeleteVoucher.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostVoucherDeleteResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'vouchers/deleteVoucher',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostVoucherDeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostPromotionUpdateResponse> postPromotionUpdateResponse(
    String contentType,
    String accept,
    RequestUpdatePromotionVO requestUpdatePromotionVO,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestUpdatePromotionVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostPromotionUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'promotions/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostPromotionUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SaleAmountVO> getSalesTotal() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SaleAmountVO>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'vouchers/getSalesTotal',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SaleAmountVO.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  @override
  Future<PostCashbackAndPromotionResponse> postCashbackAndPromotionResponse(
      String contentType,
      String accept,
      RequestCashbackAndPromotion requestCashbackAndPromotion) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestCashbackAndPromotion.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCashbackAndPromotionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'promotions/cbpromohistoryv2',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCashbackAndPromotionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostBrandListResponse> postBrandListResponse(
      String contentType, String accept) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostBrandListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'brands',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostBrandListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostRawMaterialUpdateResponse> postRawMaterialUpdateResponse(
      String contentType,
      String accept,
      RequestUpdateRawMaterialVO requestUpdateRawMaterialVO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestUpdateRawMaterialVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostRawMaterialUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'raw_materials/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostRawMaterialUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostBrandCreateResponse> postBrandCreateResponse(String contentType,
      String accept, RequestBrandCreateVO requestBrandCreateVO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestBrandCreateVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostBrandCreateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'brands/store',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostBrandCreateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostBrandUpdateResponse> postBrandUpdateResponse(String contentType,
      String accept, RequestBrandUpdateVO requestBrandUpdateVO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(requestBrandUpdateVO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostBrandUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'brands/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostBrandUpdateResponse.fromJson(_result.data!);
    return value;
  }
}
