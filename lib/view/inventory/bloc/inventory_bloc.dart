import 'package:flutter/foundation.dart';
import 'package:multipurpose_pos_application/core/core_config/config_text.dart';
import 'package:multipurpose_pos_application/core/core_data/inventory_data.dart';
import 'package:multipurpose_pos_application/core/core_data/inventory_item_data_vo.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';

class InventoryBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Screen states
  int value = 0;
  List<InventoryItemDataVO> inventoryList = [];

  InventoryBloc() {
    _multiPosRepoModel.getInt(KEY).then((value) {
      this.value = value;
      _notifySafely();
      if (value == 1) {
        inventoryList = InventoryData.inventoryItemListForRetail;
        _notifySafely();
      } else if (value == 2) {
        inventoryList = InventoryData.inventoryItemListForWholeSale;
        _notifySafely();
      } else {
        inventoryList = InventoryData.inventoryItemListForFood;
        _notifySafely();
      }
    });
  }

  Future onTapLogOut() {
    return _multiPosRepoModel.clearSharePrefItems();
  }

  // void onTapRadio(int value) async {
  //   await _multiPosRepoModel.saveInt(KEY, value);
  //   _multiPosRepoModel.getInt(KEY).then((value) {
  //     this.value = value;
  //     _notifySafely();
  //     if (value == 1) {
  //       inventoryList = InventoryData.inventoryItemListForRetail;
  //       _notifySafely();
  //     } else if (value == 2) {
  //       inventoryList = InventoryData.inventoryItemListForWholeSale;
  //       _notifySafely();
  //     } else {
  //       inventoryList = InventoryData.inventoryItemListForFood;
  //       _notifySafely();
  //     }
  //   });
  // }

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
