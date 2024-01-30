import 'package:flutter/cupertino.dart';

import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/category_vo.dart';
import '../../../data/vos/employee_vo.dart';

class EmployeeListBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<EmployeeVO>? employeeList = [];

  EmployeeListBloc() {
    _showLoading();
    _multiPosRepoModel.postEmployeeListResponse().then((response) {
      employeeList = response.employees;
      employeeList?.sort((a, b) => b.id!.compareTo(a.id!));
      _notifySafely();
      _hideLoading();
    });
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
