import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_dimens.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../bloc/raw_material_list_bloc.dart';
import '../widgets/popping_item_view.dart';

class PoppingListScreen extends StatelessWidget {
  const PoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RawMaterialListBloc(true),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
            child: CommonAppBarView(
              title: "Popping List Page",
              isEnableBack: true,
              onTapBack: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Consumer<RawMaterialListBloc>(
              builder: (context, bloc, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: scaleHeight(context) / 40),
                  Container(
                    height: scaleHeight(context) * 0.73,
                    child: ListView.builder(
                      itemBuilder: (context, index) => PoppingItemView(
                          poppingName: bloc.poppingList?[index].name ?? "name",
                          poppingImage:
                              "http://yankinbubbletea.kwintechnologykw11.com/api/${bloc.poppingList?[index].toppingPhotoPath}",
                          totalProfits:
                              bloc.poppingList?[index].toppingSalesPrice ?? 0,
                          qty:
                              bloc.poppingList?[index].toppingSalesAmount ?? 0),
                      itemCount: bloc.poppingList?.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
