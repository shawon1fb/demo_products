import 'dart:convert';

class LoginDto {
  String username;
  String password;

  LoginDto({required this.username, required this.password});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    return const JsonEncoder.withIndent(' ').convert(toJson());
  }
}
