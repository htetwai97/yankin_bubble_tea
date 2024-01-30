import '../../data/vos/request_update_employee_vo.dart';

class PostEmployeeUpdateResponse {
  RequestUpdateEmployeeVO? employee;
  bool? success;
  String? message;

  PostEmployeeUpdateResponse({this.employee, this.success, this.message});

  PostEmployeeUpdateResponse.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? new RequestUpdateEmployeeVO.fromJson(json['employee'])
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
