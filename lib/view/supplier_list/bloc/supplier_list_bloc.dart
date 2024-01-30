import 'package:flutter/cupertino.dart';

import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/request_supplier_vo.dart';
import '../../../data/vos/supplier_vo.dart';

class SupplierListBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Screen states
  List<SupplierVO>? supplierList = [];

  SupplierListBloc() {
    _showLoading();
    _multiPosRepoModel.postSupplierListResponse().then((response) {
      supplierList = response.suppliers;
      supplierList?.sort((a, b) => b.id!.compareTo(a.id!));
      _notifySafely();
      _hideLoading();
    });
  }

  // Future onTapDelete(int? id) {
  //   isApiCalling = true;
  //   _notifySafely();
  //   var supplier = RequestSupplierVO(supplierId: id);
  //   _multiPosRepoModel.postSupplierDeleteResponse(supplier);
  //   return _multiPosRepoModel.postSupplierListResponse().then((value) {
  //     supplierList = value.suppliers;
  //     isApiCalling = false;
  //     _notifySafely();
  //   });
  // }

  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
