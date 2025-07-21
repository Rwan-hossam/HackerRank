// onboarding_view.dart
import 'package:final_project_hacker_rank/viewModel/onBoardingViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingviewModel>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 30, 125, 19),
              Color.fromARGB(255, 7, 88, 10),
              Color.fromARGB(255, 5, 73, 5),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'XO GAME',
              style: TextStyle(
                fontFamily: 'ManufacturingConsent-Regular',
                fontSize: 80,
                color: Color.fromARGB(255, 7, 24, 1),
              ),
            ),
            const Text(
              'TIC TAC TOE',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 7, 24, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/tic.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => viewModel.goToFriendGame(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  backgroundColor: const Color.fromARGB(255, 16, 74, 4),
                ),
                child: const Text(
                  'Play VS Friend',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => viewModel.goToComputerGame(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  backgroundColor: const Color.fromARGB(255, 16, 74, 4),
                ),
                child: const Text(
                  'Play VS Computer',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
