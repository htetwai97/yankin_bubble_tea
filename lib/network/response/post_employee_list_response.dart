import '../../data/vos/employee_vo.dart';

class PostEmployeeListResponse {
  List<EmployeeVO>? employees;
  bool? success;
  String? message;

  PostEmployeeListResponse({this.employees, this.success, this.message});

  PostEmployeeListResponse.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <EmployeeVO>[];
      json['employees'].forEach((v) {
        employees!.add(new EmployeeVO.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
