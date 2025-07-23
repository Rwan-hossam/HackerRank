import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isRegistered = false;
  String? errorMessage;

  Future<void> signUp(String email, String password, String username) async {
    isLoading = true;
    errorMessage = null;
    isRegistered = false;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      errorMessage = "All fields are required.";
      isLoading = false;
      notifyListeners();
      return;
    }

    if (password.length < 6) {
      errorMessage = "password should be greater than 6 letters ";
      isLoading = false;
      notifyListeners();
      return;
    }

    if (email.contains("@")) {
      isRegistered = true;
    } else {
      errorMessage = "Invalid email address.";
    }

    isLoading = false;
    notifyListeners();
  }
}
