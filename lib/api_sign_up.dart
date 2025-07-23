import 'dart:convert';

import 'package:final_project_hacker_rank/models/sign_up_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiSignUp {
  Future<bool> registerUser(SignUpModel user) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to register user');
    }
  }
}
