import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:task_one/provider/provider.dart';
import 'package:task_one/screens/auth_screens/signup_screen.dart';
import 'package:task_one/utils/extension/extension.dart';
import 'package:task_one/utils/widgets/app_colors/app_colors.dart';
import 'package:task_one/utils/widgets/roundbutton.dart';
import 'package:task_one/utils/widgets/spin_kit.dart';
import 'package:task_one/utils/widgets/top_container_login.dart';

class LogninScreen extends StatelessWidget {
  LogninScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ModalProgressHUD(
      inAsyncCall: authProvider.isLoading,
      progressIndicator: const SpinKitFlutter(),
      child: Scaffold(
        body: Stack(
          children: [
            const TopContainerTwo(),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      20.sH,
                      Button(
                        textcolor: Colors.white,
                        title: 'Log In',
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            authProvider.login(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            );
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text("Create account"),
                      ),
                    ],
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
