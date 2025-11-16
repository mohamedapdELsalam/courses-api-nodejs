class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? token;
  String? role;
  String? avatar;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.token,
    this.role,
    this.avatar,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
    role = json['role'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    data['role'] = role;
    data['avatar'] = avatar;
    return data;
  }
}
