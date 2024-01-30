import 'package:flutter/cupertino.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';

import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';

class RawMaterialListBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<RawMaterialVO>? rawMaterialList = [];
  List<RawMaterialVO>? poppingList = [];

  RawMaterialListBloc(bool? isPoppingList) {
    _showLoading();
    _multiPosRepoModel.postRawMaterialResponse().then((response) {
      rawMaterialList = response.rawMaterials;
      rawMaterialList?.sort((a, b) => b.id!.compareTo(a.id!));

      if (isPoppingList!) {
        for (var i = 0; i < rawMaterialList!.length; i++) {
          if (rawMaterialList![i].toppingFlag == 1) {
            poppingList!.add(rawMaterialList![i]);
            _notifySafely();
          }
        }
      }

      _notifySafely();
      _hideLoading();
    });
  }

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
