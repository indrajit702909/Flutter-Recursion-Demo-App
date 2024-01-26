import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<String> contestName = [];
  List<String> className = [];
  List<String> contestImage = [];
  List<String> classImage = [];
  List<String> classDescription = [];
  List<String> contestDescription = [];

  Future<void> fetchEventsPage1() async {
    try {
      final response = await http
          .get(Uri.parse('https://recnitdgp.pythonanywhere.com/api/events/'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> events = jsonData['results'];
        setState(
          () {
            for (int i = 0; i < events.length; i++) {
              if (events[i]['event_type'] == 'Class') {
                className.add(events[i]['title']);
                classImage.add(events[i]['image']);
                classDescription.add(events[i]['description']);
              } else if (events[i]['event_type'] == 'Contest') {
                contestName.add(events[i]['title']);
                contestImage.add(events[i]['image']);
                contestDescription.add(events[i]['description']);
              }
            }
          },
        );
        print('data fetched successfully');
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEventsPage1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 17, 14),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 18.sp,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Our Events',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
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
              'Contests',
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
                scrollDirection: Axis.horizontal,
                itemCount: contestName.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.indigo[900],
                    width: 89.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 25.h,
                          width: 60.w,
                          child: Image.network(
                            contestImage[index],
                          ),
                        ),
                        Text(
                          contestName[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          contestDescription[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
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
              'Class',
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
                scrollDirection: Axis.horizontal,
                itemCount: className.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.indigo[900],
                    width: 89.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 25.h,
                          width: 60.w,
                          child: Image.network(
                            classImage[index],
                          ),
                        ),
                        Text(
                          className[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          classDescription[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
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
