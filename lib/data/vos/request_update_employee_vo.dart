import 'package:dio/dio.dart';
import 'dart:io';

class RequestUpdateEmployeeVO {
  int? employeeId;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;
  File? photo;
  String? nrc;
  int? salary;
  int? userId;
  String? createdAt;
  String? updatedAt;

  RequestUpdateEmployeeVO(
      {this.employeeId,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.password,
      this.photo,
      this.nrc,
      this.salary,
      this.userId,
      this.createdAt,
      this.updatedAt});

  RequestUpdateEmployeeVO.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    password = json['password'];
    //photo = json['photo'];
    nrc = json['nrc'];
    salary = json['salary'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['password'] = this.password;
    //data['photo'] = this.photo;
    data['nrc'] = this.nrc;
    data['salary'] = this.salary;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
