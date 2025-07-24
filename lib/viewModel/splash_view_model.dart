import 'dart:async';
import 'package:final_project_hacker_rank/Views.dart/Login_view.dart';
import 'package:final_project_hacker_rank/Views.dart/home_view.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }
}
