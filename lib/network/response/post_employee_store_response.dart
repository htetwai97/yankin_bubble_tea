import '../../data/vos/employee_vo.dart';

class PostEmployeeStoreResponse {
  EmployeeVO? employee;
  bool? success;
  String? message;

  PostEmployeeStoreResponse({this.employee, this.success, this.message});

  PostEmployeeStoreResponse.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? new EmployeeVO.fromJson(json['employee'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
