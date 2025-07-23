// onboarding_view_model.dart
import 'package:final_project_hacker_rank/Views.dart/playVSComputerView.dart';
import 'package:final_project_hacker_rank/Views.dart/playVSPlayerView.dart';
import 'package:flutter/material.dart';

class Homeviewmodel extends ChangeNotifier {
  void goToFriendGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerVsPlayerView()),
    );
  }

  void goToComputerGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Playvscomputerview()),
    );
  }
}
