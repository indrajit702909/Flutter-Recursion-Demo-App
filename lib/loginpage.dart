import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          appBar: AppBar(
            title: const Text(
              "Welcome to RECursion",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          backgroundColor: Color.fromARGB(255, 13, 17, 14),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  'images/logoInverted.png',
                  color: Colors.white,
                  height: 22.w, // Adjust the height as needed
                  width: 22.h, // Adjust the width as needed
                ),
                SizedBox(
                  height: 15.h,
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
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailcontroller.text,
                          password: passwordcontroller.text);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: ((context) => HomePage())),
                          (route) => false);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('LOGIN'),
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
                    "Don't have an account? Sign in",
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
        );
      },
    );
  }
}
