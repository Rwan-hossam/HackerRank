import 'package:final_project_hacker_rank/Views.dart/splashScreen.dart';
import 'package:final_project_hacker_rank/viewModel/homeViewModel.dart';
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
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Splashviewmodel()),
            ChangeNotifierProvider(create: (_) => Homeviewmodel()),
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
