import 'package:dio/dio.dart';
import 'dart:io';

class EmployeeVO {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;
  File? photo;
  String? url;
  String? nrc;
  int? salary;
  int? role;

  EmployeeVO(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.password,
      this.photo,
      this.url,
      this.role,
      this.nrc,
      this.salary});

  FormData toChangeFormData() {
    return FormData.fromMap({
      "id": id,
      "name": name,
      "email": email,
      "address": address,
      "phone": phone,
      "password": password,
      "role": role,
      "nrc": nrc,
      "salary": salary,
      "photo": MultipartFile.fromFileSync(photo?.path ?? "")
    });
  }

  EmployeeVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    password = json['password'];
    url = json['photo'];
    role = json['role'];
    nrc = json['nrc'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['password'] = this.password;
    data['photo'] = this.url;
    data['role'] = this.role;
    data['nrc'] = this.nrc;
    data['salary'] = this.salary;
    return data;
  }
}
