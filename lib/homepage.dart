import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recursion_app/eventspage.dart';
import 'package:recursion_app/loginpage.dart';
import 'package:recursion_app/ourteam.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                handleSignOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const LoginPage()),
                    ),
                    (route) => false);
              },
              icon: Icon(
                Icons.logout,
                size: 20.sp,
                color: Colors.white,
              ),
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logoInverted.png',
                height: 5.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "RECursion",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 13, 17, 14),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Programming Community of NIT Durgapur',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 1.75.h,
                ),
                Text(
                  "We are programming community of NIT Durgapur, with focus on improving coding culture institute wide by conducting regular lectures from beginner to advance topics of programming. Our goal is to increase student's participation in inter-collegiate contest like ACM-ICPC and help them get better.",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 1.75.h,
                ),
                Divider(
                  color: Colors.blueGrey,
                  thickness: 0.3.h,
                ),
                SizedBox(
                  height: 1.75.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the sign-in page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OurTeams(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Our Team',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Image.asset(
                              'images/teamicon.png',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the sign-in page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EventsPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Our Events',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Image.asset(
                              'images/eventsicon.png',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> handleSignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
