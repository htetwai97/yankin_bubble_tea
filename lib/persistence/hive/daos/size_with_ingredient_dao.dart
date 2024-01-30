import 'package:hive_flutter/hive_flutter.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';

class SizeWithIngredientDao {
  static final SizeWithIngredientDao _singleton =
      SizeWithIngredientDao._internal();

  factory SizeWithIngredientDao() {
    return _singleton;
  }
  SizeWithIngredientDao._internal();

  /// Persistence
  void saveSizeWithIngredientItem(
      RequestSizeObjectVO? sizeWithIngredient) async {
    await getSizeWithIngredientBox()
        .put(sizeWithIngredient?.timeStamp, sizeWithIngredient!);
  }

  Future saveAllSizeOfIngredients(List<RequestSizeObjectVO?>? rList) async {
    Map<String?, RequestSizeObjectVO> requestSizeObjMap = Map.fromIterable(
        rList ?? [],
        key: (r) => r.timeStamp.toString(),
        value: (r) => r);
    await getSizeWithIngredientBox().putAll(requestSizeObjMap);
  }

  void deleteSizeWithIngredient(int? timeStamp) async {
    await getSizeWithIngredientBox().delete(timeStamp);
  }

  void clearSizeWithIngredients() async {
    await getSizeWithIngredientBox().clear();
  }

  List<RequestSizeObjectVO>? getAllSizeWithIngredientList() {
    return getSizeWithIngredientBox().values.toList();
  }

  /// Reactive
  Stream<void> getAllSizeWithIngredientEventStream() {
    return getSizeWithIngredientBox().watch();
  }

  Stream<List<RequestSizeObjectVO>?> getAllSizeWithIngredientsStream() {
    return Stream.value(getAllSizeWithIngredientList());
  }

  /// Box
  Box<RequestSizeObjectVO> getSizeWithIngredientBox() {
    return Hive.box<RequestSizeObjectVO>(BOX_NAME_SIZE_WITH_INGREDIENT_VO);
  }
}
