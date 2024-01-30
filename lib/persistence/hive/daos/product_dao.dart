import 'package:hive_flutter/hive_flutter.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';

import '../../../data/vos/product_vo.dart';

class ProductDao {
  static final ProductDao _singleton = ProductDao._internal();

  factory ProductDao() {
    return _singleton;
  }
  ProductDao._internal();

  /// Persistence
  void saveProduct(ProductVO? productVO) async {
    await getProductBox().put(productVO?.id.toString(), productVO!);
  }

  Future saveAllProducts(List<ProductVO?>? pList) async {
    Map<String?, ProductVO> requestProductObjMap = Map.fromIterable(pList ?? [],
        key: (p) => p.id.toString(), value: (p) => p);
    await getProductBox().putAll(requestProductObjMap);
  }

  void deleteProduct(int? id) async {
    await getProductBox().delete(id.toString());
  }

  void clearProducts() async {
    await getProductBox().clear();
  }

  List<ProductVO>? getAllProductList() {
    return getProductBox().values.toList();
  }

  /// Reactive
  Stream<void> getAllProductEventStream() {
    return getProductBox().watch();
  }

  Stream<List<ProductVO>?> getAllProductsStream() {
    return Stream.value(getAllProductList());
  }

  /// Box
  Box<ProductVO> getProductBox() {
    return Hive.box<ProductVO>(BOX_NAME_PRODUCT_VO);
  }
}
