import 'dart:convert';
import 'package:http/http.dart' as http;

class Login {
  final String username;
  final String email;
  final String password;
  const Login({
    required this.username,
    required this.email,
    required this.password,
  });
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }
}

class Auth {
  Future<List<Login>> getLogin() async {
    final response = await http
        .get(Uri.parse("https://www.kkmapi.online/api/v1/auth/login/"));
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final List<Login> list = [];
      for (var i = 0; i < data.length; i++) {
        final entry = data[i];
        list.add(Login.fromJson(entry));
      }
      return list;
    } else {
      throw Exception("HTTP Failed");
    }
  }
}
