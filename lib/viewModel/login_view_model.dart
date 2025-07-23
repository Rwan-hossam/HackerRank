import 'package:final_project_hacker_rank/Views.dart/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:final_project_hacker_rank/api.dart';
import 'package:final_project_hacker_rank/models/login_model.dart';

class LoginViewModel extends ChangeNotifier {
  final Api api = Api();

  bool _isLoading = false;
  String? _errorMessage;
  bool _isLoggedIn = false;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      List<LoginModel> users = await api.fetchProducts();
      bool found = users.any(
        (user) =>
            user.email == email.trim() && user.password == password.trim(),
      );

      if (found) {
        _isLoggedIn = true;
      } else {
        _errorMessage = 'Invalid email or password';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
