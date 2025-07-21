import 'dart:async';
import 'package:final_project_hacker_rank/Views.dart/homeView.dart';
import 'package:flutter/material.dart';

class Splashviewmodel extends ChangeNotifier {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    });
  }
}
