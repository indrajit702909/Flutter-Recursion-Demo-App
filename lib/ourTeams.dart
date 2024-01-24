import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OurTeams extends StatefulWidget {
  const OurTeams({super.key});

  @override
  State<OurTeams> createState() => _TEAMSState();
}

class _TEAMSState extends State<OurTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(28, 32, 40, 0.043),
        title: Text('Meet the Team'),
        titleTextStyle: TextStyle(color: Colors.red, fontSize: 20.sp),
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
