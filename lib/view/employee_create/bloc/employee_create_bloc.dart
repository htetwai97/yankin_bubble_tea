import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/employee_vo.dart';

class EmployeeCreateBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  File? _image;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? password;
  String? nrcNumber;
  int? salary;

  //ImagePicker picker = ImagePicker();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();
  FocusNode seventhFocusNode = FocusNode();

  EmployeeCreateBloc();

  Future onTapCreate() {
    _showLoading();
    if (name != null &&
        name != "" &&
        phone != null &&
        phone != "" &&
        address != null &&
        address != "" &&
        email != null &&
        email != "" &&
        password != null &&
        password != "" &&
        nrcNumber != null &&
        nrcNumber != "" &&
        salary != null) {
      // Functions.toast(
      //     msg:
      //         "$name $phone $address $email $password $nrcNumber $salary $_image",
      //     status: false);
      EmployeeVO employeeVO = EmployeeVO(
          name: name,
          phone: phone,
          address: address,
          email: email,
          password: password,
          photo: _image ?? File(""),
          role: 1,
          nrc: nrcNumber,
          salary: salary);
      return _multiPosRepoModel
          .postEmployeeStoreResponse(employeeVO)
          .then((value) => _hideLoading());
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
