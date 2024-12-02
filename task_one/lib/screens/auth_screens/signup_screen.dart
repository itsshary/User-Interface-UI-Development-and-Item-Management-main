import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:task_one/firebase/cloud_firestore/firestore.dart';
import 'package:task_one/provider/provider.dart';
import 'package:task_one/utils/extension/extension.dart';
import 'package:task_one/utils/widgets/roundbutton.dart';
import 'package:task_one/utils/widgets/spin_kit.dart';
import 'package:task_one/utils/widgets/top_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: authProvider.isLoading,
        progressIndicator: const SpinKitFlutter(),
        child: Stack(
          children: [
            const TopContainer(),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              decoration: const BoxDecoration(
                color: Colors.white,
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
                        controller: _namecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      5.sH,
                      TextFormField(
                        controller: _addresscontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your address',
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      5.sH,
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
                      10.sH,
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
                        bgcolor: Colors.black,
                        textcolor: Colors.white,
                        title: 'Sign Up',
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            authProvider.signup(
                              _namecontroller.text.trim(),
                              _addresscontroller.text.trim(),
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            );
                          }
                        },
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
