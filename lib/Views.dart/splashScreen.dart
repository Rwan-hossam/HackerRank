import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModel/splashViewModel.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Splashviewmodel>(context, listen: false).startTimer(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/x-o.jpg'),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
      ),
    );
  }
}
