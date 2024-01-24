import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserFunctions {
  static customTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: text,
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  static customSignInButton(String text, String emailAddress, String password) {
    return SizedBox(
      height: 5.h,
      width: 50.w,
      child: ElevatedButton(
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailAddress, password: password);
          } catch (e) {
            print(e);
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
