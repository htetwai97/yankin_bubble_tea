// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/drawer_list_tile_item_view.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/setting_radio_view.dart';

class DrawerPropertyListView extends StatelessWidget {
  Function onTapAdmin;
  Function onTapBestSellingItems;
  Function onTapInventory;
  Function onTapSaleAndHistory;
  Function onTapCashbackAndPromotion;
  Function onTapLogOut;

  Function(int?) onTapRadio;
  int? groupValue;
  DrawerPropertyListView({
    super.key,
    required this.onTapInventory,
    required this.onTapBestSellingItems,
    required this.onTapAdmin,
    required this.onTapSaleAndHistory,
    required this.onTapCashbackAndPromotion,
    required this.onTapRadio,
    required this.groupValue,
    required this.onTapLogOut,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          height: scaleHeight(context) / 8,
          color: APP_THEME_COLOR,
        ),
        DrawerListTileSectionView(
          icon: Icons.inventory,
          text: "Inventory",
          onTap: () {
            onTapInventory();
          },
        ),
        DrawerListTileSectionView(
          icon: Icons.account_tree_rounded,
          text: "Best Selling Items",
          onTap: () {
            onTapBestSellingItems();
          },
        ),
        DrawerListTileSectionView(
          icon: Icons.account_circle_sharp,
          text: "Admin",
          onTap: () {
            onTapAdmin();
          },
        ),
        DrawerListTileSectionView(
          icon: Icons.sell_outlined,
          text: "Sales And History",
          onTap: () {
            onTapSaleAndHistory();
          },
        ),
        DrawerListTileSectionView(
          icon: Icons.add_shopping_cart_outlined,
          text: "Cashback and Promotion",
          onTap: () {
            onTapCashbackAndPromotion();
          },
        ),
        DrawerListTileSectionView(
          icon: Icons.logout,
          text: "Log Out",
          onTap: () {
            onTapLogOut();
          },
        ),
        // ExpansionTile(
        //   title: const Text(
        //     "Setting",
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: FONT_MEDIUM,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        //   leading: const Icon(
        //     Icons.settings,
        //     size: 20,
        //     color: Colors.grey,
        //   ),
        //   children: [
        //     SettingRadioView(
        //       groupValue: groupValue,
        //       onChooseType: (groupValue) {
        //         onTapRadio(groupValue);
        //       },
        //     ),
        //   ],
        // )
      ],
    );
  }
}

class YanKinLogoImageAvatarView extends StatelessWidget {
  double radius;
  YanKinLogoImageAvatarView({
    super.key,
    this.radius = 38,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/kwin_logo.png",
      width: scaleWidth(context) / 3,
    );
  }
}
