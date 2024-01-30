import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/employee_vo.dart';
import '../../../data/vos/request_update_employee_vo.dart';

class EmployeeEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  File? _image;
  int? employeeId;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? url;
  String? password;
  String? nrcNumber;
  int? salary;

  EmployeeVO? employeeVO;

  //ImagePicker picker = ImagePicker();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();
  FocusNode seventhFocusNode = FocusNode();

  EmployeeEditBloc(EmployeeVO? employeeVO) {
    _showLoading();
    if (employeeVO != null) {
      _prePopulateBeforeEdit(employeeVO).then((value) => _hideLoading());
    }
  }

  Future _prePopulateBeforeEdit(EmployeeVO? employeeVO) async {
    this.employeeVO = employeeVO;
    employeeId = this.employeeVO?.id;
    name = this.employeeVO?.name;
    address = this.employeeVO?.address;
    phone = this.employeeVO?.phone;
    email = this.employeeVO?.email;
    password = this.employeeVO?.password;
    url = this.employeeVO?.url;
    nrcNumber = this.nrcNumber;
    salary = this.salary;

    _notifySafely();
  }

  Future onTapEdit() {
    _showLoading();
    if (name != null &&
        password != null &&
        password != "" &&
        _image != null &&
        salary != null) {
      // Functions.toast(
      //     msg:
      //         "$name $phone $address $email $password $nrcNumber $salary $_image $url",
      //     status: false);
      RequestUpdateEmployeeVO requestUpdateEmployeeVO = RequestUpdateEmployeeVO(
          employeeId: employeeId,
          name: name,
          phone: phone,
          address: address,
          email: email,
          photo: _image,
          password: password,
          nrc: nrcNumber,
          salary: salary);
      return _multiPosRepoModel
          .postEmployeeUpdateResponse(requestUpdateEmployeeVO)
          .then((value) => _hideLoading())
          .onError((error, stackTrace) =>
              Functions.toast(msg: "$error $_image", status: false));
    } else {
      _hideLoading();
      /*Functions.toast(
          msg: "$name $phone $address $email $password $nrcNumber $salary",
          status: false);*/
      return Future.error("Fail to add employee");
    }
  }

  void onFirstEditingComplete() {
    secondFocusNode.requestFocus();
    _notifySafely();
  }

  void onSecondEditingComplete() {
    thirdFocusNode.requestFocus();
    _notifySafely();
  }

  void onThirdEditingComplete() {
    fourthFocusNode.requestFocus();
    _notifySafely();
  }

  void onFourthEditingComplete() {
    fifthFocusNode.requestFocus();
    _notifySafely();
  }

  void onFifthEditingComplete() {
    sixthFocusNode.requestFocus();
    _notifySafely();
  }

  void onSixthEditingComplete() {
    seventhFocusNode.requestFocus();
    _notifySafely();
  }

  void onSeventhEditingComplete() {
    firstFocusNode.unfocus();
    secondFocusNode.unfocus();
    thirdFocusNode.unfocus();
    fourthFocusNode.unfocus();
    fifthFocusNode.unfocus();
    sixthFocusNode.unfocus();
    seventhFocusNode.unfocus();
    _notifySafely();
  }

  void onChangeName(String? name) {
    this.name = name;
    _notifySafely();
  }

  void onChangePhone(String? phone) {
    this.phone = phone;
    _notifySafely();
  }

  void onChangeAddress(String? address) {
    this.address = address;
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

  void onChangeNrcNumber(String? nrc) {
    this.nrcNumber = nrc;
    _notifySafely();
  }

  void onChangeSalary(int? salary) {
    this.salary = salary;
    _notifySafely();
  }

  File? getImage() {
    return _image;
  }

  void onChangeFile(File file) {
    this._image = file;
    url = null;
    _notifySafely();
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      this._image = File(pickedImage.path);
    }
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
