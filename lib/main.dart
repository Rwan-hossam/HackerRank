import 'package:final_project_hacker_rank/Views.dart/sign_up_view.dart';
import 'package:final_project_hacker_rank/Views.dart/splash_screen.dart';
import 'package:final_project_hacker_rank/viewModel/home_View_Model.dart';
import 'package:final_project_hacker_rank/viewModel/login_view_model.dart';
import 'package:final_project_hacker_rank/viewModel/playVSComputer_view_model.dart';
import 'package:final_project_hacker_rank/viewModel/playerVSPlayer_view_model.dart';
import 'package:final_project_hacker_rank/viewModel/sign_up_view_model.dart';
import 'package:final_project_hacker_rank/viewModel/splash_view_model.dart';
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
            ChangeNotifierProvider(create: (_) => SplashViewModel()),
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ChangeNotifierProvider(create: (_) => PlayerVsPlayerViewModel()),
            ChangeNotifierProvider(create: (_) => LoginViewModel()),
            ChangeNotifierProvider(create: (_) => SignUpViewModel()),
            ChangeNotifierProvider(create: (_) => PlayVsComputerViewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'XO Game',
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
