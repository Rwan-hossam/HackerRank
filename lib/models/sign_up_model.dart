class SignUpModel {
  final String email;
  final String password;
  final String userName;
  SignUpModel({
    required this.userName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'UserName': userName, 'password': password};
  }
}
