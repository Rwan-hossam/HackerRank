import 'package:final_project_hacker_rank/Views.dart/onBoardingView.dart';
import 'package:final_project_hacker_rank/Views.dart/playVSComputerView.dart';
import 'package:final_project_hacker_rank/Views.dart/playVSFriendView.dart';
import 'package:final_project_hacker_rank/Views.dart/splashScreen.dart';
import 'package:final_project_hacker_rank/viewModel/onBoardingViewModel.dart';
import 'package:final_project_hacker_rank/viewModel/splashViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ), // مقاس شاشة التصميم (ممكن يتغير حسب تصميمك)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Splashviewmodel()),
            ChangeNotifierProvider(create: (_) => OnboardingviewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'XO Game',
            initialRoute: '/splash',
            routes: {
              '/splash': (context) => const Splashscreen(),
              // '/': (context) => const OnboardingView(),
              // '/friendGame': (context) => Playvsfriendview(),
              // '/computerGame': (context) => Playvscomputerview(),
            },
          ),
        );
      },
    );
  }
}
