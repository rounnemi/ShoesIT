class RegisterModel {
  RegisterModel({
    required this.username,
    required this.password,
    seller =false,
  });
  late final String username;
  late final String password;
  final bool seller = false;
  factory RegisterModel.fromJson(Map<String, dynamic> json){
    return RegisterModel(
        username : json['username'],
        password : json['password'],
        seller : json['seller']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data ['seller'] =false;
    return data;
  }
}