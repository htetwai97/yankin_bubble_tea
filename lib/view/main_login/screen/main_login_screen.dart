import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/view/inventory/screen/inventory_screen.dart';
import 'package:multipurpose_pos_application/view/inventory/widgets/drawer_property_list_view.dart';
import 'package:multipurpose_pos_application/view/main_login/bloc/main_login_bloc.dart';
import 'package:multipurpose_pos_application/view/main_login/widgets/common_text_field_view.dart';
import 'package:provider/provider.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainLoginBloc(),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Login Page",
                style: ConfigStyle.boldStyle(FONT_MEDIUM, WHITE_COLOR),
              ),
              backgroundColor: APP_THEME_COLOR,
            ),
            body: Selector<MainLoginBloc, bool>(
                builder: (context, isLoading, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: scaleHeight(context) / 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: scaleHeight(context) / 20),
                              YanKinLogoImageAvatarView(radius: 44),
                              Consumer<MainLoginBloc>(
                                builder: (context, bloc, child) =>
                                    CommonTextFieldView(
                                  predefinedText: bloc.email,
                                  focusNode: bloc.emailFocus,
                                  onEditingComplete: () {
                                    bloc.onEmailEditDone();
                                  },
                                  labelText: "Email",
                                  onChanged: (e) {
                                    bloc.onChangeEmail(e);
                                  },
                                ),
                              ),
                              Consumer<MainLoginBloc>(
                                builder: (context, bloc, child) =>
                                    CommonTextFieldView(
                                  predefinedText: bloc.password,
                                  focusNode: bloc.passwordFocus,
                                  onEditingComplete: () {
                                    bloc.onPasswordEditDone();
                                  },
                                  labelText: "Password",
                                  onChanged: (e) {
                                    bloc.onChangePassword(e);
                                  },
                                  visibleEye: true,
                                ),
                              ),
                              SizedBox(height: scaleHeight(context) / 20),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Consumer<MainLoginBloc>(
                                  builder: (context, bloc, child) =>
                                      MaterialButton(
                                    onPressed: () {
                                      bloc.onTapLogin().then((value) {
                                        if (bloc.isFood) {
                                          Functions.replacementTransition(
                                              context, const InventoryScreen());
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 34,
                                        vertical: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: BUTTON_COLOR,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "LOGIN",
                                        style: ConfigStyle.boldStyle(
                                          FONT_MEDIUM,
                                          WHITE_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: scaleHeight(context) / 30),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isLoading,
                        child: Center(
                          child: SpinKitFadingCircle(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: index.isEven
                                      ? APP_THEME_COLOR_REDUCE
                                      : CARD_FIRST_COLOR,
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  );
                },
                selector: (context, bloc) => bloc.isLoading)),
      ),
    );
  }
}
