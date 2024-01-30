import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:multipurpose_pos_application/core/core_config/config_text.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/user_data_vo.dart';
import 'package:multipurpose_pos_application/data/vos/ykbbt_user_vo.dart';

class MainLoginBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Loading State
  bool isLoading = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Screen states
  String? shopFlag;
  String? email = "owner@gmail.com";
  String? password = "yankinbubble7799";
  YkbbtUserVO? ykbbtUserVO;
  bool isFood = false;
  bool isRetail = false;
  bool isWholeSale = false;
  FocusNode? emailFocus = FocusNode();
  FocusNode? passwordFocus = FocusNode();

  MainLoginBloc();

  Future onTapLogin() async {
    _showLoading();
    UserDataVO userDataVO = UserDataVO(
      email: email,
      password: password,
    );
    if (email != null && email != "" && password != null && password != "") {
      var response = await _multiPosRepoModel.postUserDataResponse(userDataVO);
      shopFlag = response.userData?.shopFlag;
      _notifySafely();
      await _multiPosRepoModel.saveString(FLAG, shopFlag ?? "");
    } else {
      _hideLoading();
      Functions.toast(msg: "Fields required", status: false);
    }

    if (shopFlag == "food") {
      return _multiPosRepoModel
          .postYkbbtLoginResponse(userDataVO)
          .then((value) {
        _multiPosRepoModel.saveInt(USER_ID, value.user?.id ?? 0);
        isFood = true;
        _notifySafely();
        _hideLoading();
      }).catchError((e) {
        _hideLoading();
        Functions.toast(msg: "Error Login", status: false);
      });
    }
  }

  void onEmailEditDone() {
    emailFocus?.unfocus();
    _notifySafely();
  }

  void onPasswordEditDone() {
    passwordFocus?.unfocus();
    _notifySafely();
  }

  void onChangeEmail(String? email) {
    this.email = email;
    _notifySafely();
  }

  void onChangePassword(String? password) {
    this.password = password;
    _notifySafely();
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
