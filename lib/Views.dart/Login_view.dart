import 'package:final_project_hacker_rank/Views.dart/home_view.dart';
import 'package:final_project_hacker_rank/Views.dart/sign_up_view.dart';
import 'package:final_project_hacker_rank/viewModel/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project_hacker_rank/viewModel/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeView()),
        );
      } else if (viewModel.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(viewModel.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'XO GAME',
                style: TextStyle(
                  fontFamily: 'ManufacturingConsent-Regular',
                  fontSize: 60,
                  color: const Color.fromARGB(255, 11, 76, 142),
                ),
              ),
            ),
            Image.asset('assets/xo.jpg'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 249, 247, 247),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: const Color.fromARGB(255, 11, 76, 142),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 249, 247, 247),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: const Color.fromARGB(255, 11, 76, 142),
                  filled: true,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                viewModel.login(email, password);
              },
              child: const Text('Login'),
            ),
            if (viewModel.isLoading) CircularProgressIndicator(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ChangeNotifierProvider(
                          create: (_) => SignUpViewModel(),
                          child: SignUpView(),
                        ),
                  ),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
