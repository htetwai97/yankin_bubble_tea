import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multipurpose_pos_application/core/core_data/inventory_item_data_vo.dart';

class InventoryData {
  static List<InventoryItemDataVO> inventoryItemListForWholeSale = [
    InventoryItemDataVO(
      name: "Category",
      icon: MdiIcons.listBox,
    ),
    InventoryItemDataVO(
      name: "Subcategory",
      icon: Icons.subdirectory_arrow_right_outlined,
    ),
    InventoryItemDataVO(
      name: "Material",
      icon: Icons.adb,
    ),
    InventoryItemDataVO(
      name: "Brand",
      icon: Icons.catching_pokemon_outlined,
    ),
    InventoryItemDataVO(
      name: "Type",
      icon: Icons.type_specimen_outlined,
    ),
    InventoryItemDataVO(
      name: "Product",
      icon: Icons.production_quantity_limits_outlined,
    ),
    InventoryItemDataVO(
      name: "Item",
      icon: Icons.shopping_basket_outlined,
    ),
  ];

  static List<InventoryItemDataVO> inventoryItemListForFood = [
    InventoryItemDataVO(
      name: "Category",
      icon: MdiIcons.listBox,
    ),
    InventoryItemDataVO(
      name: "Subcategory",
      icon: Icons.subdirectory_arrow_right_outlined,
    ),
    InventoryItemDataVO(
      name: "Material",
      icon: Icons.adb,
    ),
    InventoryItemDataVO(
      name: "Brand",
      icon: Icons.catching_pokemon_outlined,
    ),
    InventoryItemDataVO(
      name: "Product",
      icon: Icons.production_quantity_limits_outlined,
    ),
    InventoryItemDataVO(
      name: "Item",
      icon: MdiIcons.checkbook,
    ),
    InventoryItemDataVO(
      name: "Ingredient",
      icon: Icons.format_color_fill_outlined,
    ),
    InventoryItemDataVO(
      name: "Promotion",
      icon: MdiIcons.package,
    ),
  ];

  static List<InventoryItemDataVO> inventoryItemListForRetail = [
    InventoryItemDataVO(
      name: "Category",
      icon: MdiIcons.listBox,
    ),
    InventoryItemDataVO(
      name: "Subcategory",
      icon: Icons.subdirectory_arrow_right_outlined,
    ),
  ];

  static List<InventoryItemDataVO> inventoryItemListForAdmin = [
    InventoryItemDataVO(
      name: "Supplier",
      icon: MdiIcons.accountCowboyHat,
    ),
    InventoryItemDataVO(
      name: "Customer",
      icon: Icons.account_circle_rounded,
    ),
    InventoryItemDataVO(
      name: "Employee",
      icon: Icons.account_tree_sharp,
    ),
  ];
}
