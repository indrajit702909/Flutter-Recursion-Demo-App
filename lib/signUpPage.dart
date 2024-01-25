// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recursion_app/homepage.dart';
import 'package:recursion_app/loginpage.dart';
import 'package:recursion_app/user.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 13, 17, 14),
          appBar: AppBar(
            title: const Text("Sign Up"),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0.h,
                  ),
                  UserFunctions.customTextField(
                      emailController, 'email', Icons.email, false),
                  UserFunctions.customTextField(
                      passwordController, 'password', Icons.password, true),
                  UserFunctions.customTextField(confirmPasswordController,
                      'confirm password', Icons.password, true),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (passwordController.text ==
                              confirmPasswordController.text &&
                          passwordController.text != "") {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: confirmPasswordController.text);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (route) => false);
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: const Text('Sign up'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
