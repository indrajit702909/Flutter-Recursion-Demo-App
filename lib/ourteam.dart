import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class OurTeams extends StatefulWidget {
  const OurTeams({super.key});

  @override
  State<OurTeams> createState() => _OurTeamsState();
}

class _OurTeamsState extends State<OurTeams> {
  List<String> finalYearName = [];
  List<String> finalYearPhoto = [];
  List<String> finalYearPost = [];
  List<String> thirdYearName = [];
  List<String> thirdYearPhoto = [];
  List<String> thirdYearPost = [];

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://recnitdgp.pythonanywhere.com/api/team/'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        setState(
          () {
            for (int i = 0; i < jsonData.length; i++) {
              if (jsonData[i]['batch_year'] == 2024) {
                finalYearName.add(jsonData[i]['name']);
                finalYearPhoto.add(jsonData[i]['image']);
                finalYearPost.add(jsonData[i]['designation']);
              } else if (jsonData[i]['batch_year'] == 2025) {
                thirdYearName.add(jsonData[i]['name']);
                thirdYearPhoto.add(jsonData[i]['image']);
                thirdYearPost.add(jsonData[i]['designation']);
              }
            }
          },
        );
        print('data fetched successfully');
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle other types of errors
      print('Error: $error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 17, 14),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Meet our Team',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              'Final Year',
              style: TextStyle(
                fontSize: 19.sp,
                color: Colors.blue,
                shadows: const [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(2, 1),
                    blurRadius: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.sp,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              padding: EdgeInsets.all(
                4.sp,
              ),
              height: 38.h,
              child: ListView.builder(
                itemCount: finalYearName.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 1.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            finalYearPhoto[index],
                          ),
                          radius: 10.w,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              finalYearName[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 0.1.sp,
                            ),
                            Text(
                              finalYearPost[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Third Year',
              style: TextStyle(
                fontSize: 19.sp,
                color: Colors.blue,
                shadows: const [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(2, 1),
                    blurRadius: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.sp,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              padding: EdgeInsets.all(
                4.sp,
              ),
              height: 38.h,
              child: ListView.builder(
                itemCount: finalYearName.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 1.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            thirdYearPhoto[index],
                          ),
                          radius: 10.w,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              thirdYearName[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 0.1.sp,
                            ),
                            Text(
                              thirdYearPost[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
