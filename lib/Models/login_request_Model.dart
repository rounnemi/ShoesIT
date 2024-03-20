class LoginModel {
  LoginModel({
    required this.username,
    required this.password,
  });
  late final String username;
  late final String password;
  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
        username : json['username'],
        password : json['password']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}