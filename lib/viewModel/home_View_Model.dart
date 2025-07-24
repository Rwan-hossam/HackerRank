// onboarding_view_model.dart
import 'package:final_project_hacker_rank/Views.dart/play_vs_computer_view.dart';
import 'package:final_project_hacker_rank/Views.dart/play_vs_player_view.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  void goToFriendGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerVsPlayerView()),
    );
  }

  void goToComputerGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayVsComputerView()),
    );
  }
}
