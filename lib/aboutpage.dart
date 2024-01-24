import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _TEAMSState();
}

class _TEAMSState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(28, 32, 40, 0.043),
        title: Text('Our Events'),
        titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 120, 18, 163), fontSize: 20.sp),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            height: 10.h,
            color: Colors.greenAccent,
          );
        },
      ),
    );
  }
}
