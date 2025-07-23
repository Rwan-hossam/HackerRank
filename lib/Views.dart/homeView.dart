// onboarding_view.dart
import 'package:final_project_hacker_rank/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Homeviewmodel>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 15, 74, 116),
              Color.fromARGB(255, 10, 100, 127),
              Color.fromARGB(255, 7, 44, 112),
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
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const Text(
              'TIC TAC TOE',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 248, 249, 247),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/icon.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => viewModel.goToFriendGame(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  backgroundColor: const Color.fromARGB(255, 14, 108, 159),
                ),
                child: const Text(
                  'Play VS Friend',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 247, 242, 242),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => viewModel.goToComputerGame(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  backgroundColor: const Color.fromARGB(255, 14, 108, 159),
                ),
                child: const Text(
                  'Play VS Computer',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 244, 237, 237),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
