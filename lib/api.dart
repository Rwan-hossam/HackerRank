import 'dart:convert';

import 'package:final_project_hacker_rank/models/login_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<LoginModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/users'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((item) => LoginModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
