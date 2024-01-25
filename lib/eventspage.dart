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
  Future<void> fetchEventsPage1() async {
    try {
      final response = await http
          .get(Uri.parse('https://recnitdgp.pythonanywhere.com/api/events/'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        setState(
          () {
            for (int i = 0; i < jsonData.length; i++) {
              if (jsonData[0]['results'][i] == 2024) {
              } else if (jsonData[i]['batch_year'] == 2025) {}
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
  Widget build(BuildContext context) {
    return Scaffold(
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
      // body: ListView.builder(itemCount:  ,itemBuilder: ),
    );
  }
}
