import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recursion_app/homepage.dart';
import 'package:recursion_app/signUpPage.dart';
import 'package:recursion_app/user.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 13, 17, 14),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.sp,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  ),
                  Image.asset(
                    'images/logoInverted.png',
                    color: Colors.white,
                    height: 22.w, // Adjust the height as needed
                    width: 22.h, // Adjust the width as needed
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'REC',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25.sp,
                        ),
                      ),
                      Text(
                        'ursion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  UserFunctions.customTextField(
                      emailcontroller, "email", Icons.mail, false),
                  SizedBox(
                    height: 3.h,
                  ),
                  UserFunctions.customTextField(
                      passwordcontroller, "password", Icons.password, true),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        handleSignIn();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const HomePage())),
                          (route) => false,
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the sign-in page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
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

  Future<void> handleSignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
  }
}
