import 'package:final_project_hacker_rank/Views.dart/home_view.dart';
import 'package:final_project_hacker_rank/viewModel/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, viewModel, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (viewModel.isRegistered) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeView()),
              );
            }
          });

          return Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up'),
              backgroundColor: const Color.fromARGB(255, 11, 76, 142),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Image.asset('assets/xo.jpg'),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: "Username"),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed:
                          viewModel.isLoading
                              ? null
                              : () {
                                viewModel.signUp(
                                  emailController.text,
                                  passwordController.text,
                                  usernameController.text,
                                );
                              },

                      child:
                          viewModel.isLoading
                              ? CircularProgressIndicator()
                              : Text("Sign Up"),
                    ),
                  ),
                  if (viewModel.errorMessage != null)
                    Text(
                      viewModel.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  if (viewModel.isRegistered)
                    Text(
                      "Account created successfully!",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 11, 76, 142),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
