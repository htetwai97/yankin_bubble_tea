class YkbbtUserVO {
  int? id;
  String? email;
  String? name;
  String? role;

  YkbbtUserVO({this.id, this.email, this.name, this.role});

  YkbbtUserVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}
