import 'package:digital_attendance/assessment/assessment.dart';
import 'package:digital_attendance/assignment/recording/main_page.dart';
import 'package:digital_attendance/review/dashboard_assignment/dash.dart';
import 'package:digital_attendance/attendance/swipe.dart';
import 'package:flutter/material.dart';

class DrawerLayoutWidget extends StatefulWidget {
  const DrawerLayoutWidget({super.key});

  @override
  State<DrawerLayoutWidget> createState() => _DrawerLayoutWidgetState();
}

class _DrawerLayoutWidgetState extends State<DrawerLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Welcome to Home Page'),
            ),
            new Image.asset(
              'assests/images/user.png',
            ),
            ListTile(
              title: Text('Attendance'),
              textColor: Colors.blue,
              trailing: Icon(Icons.list_alt_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SwipeCardPage()),
                );
              },
            ),
            ListTile(
              title: Text('Assignment'),
              textColor: Colors.blue,
              trailing: Icon(Icons.assignment_ind_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordPage()),
                );
              },
            ),
            ListTile(
              title: Text('Assessment'),
              textColor: Colors.blue,
              trailing: Icon(Icons.assessment_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarksScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Review'),
              textColor: Colors.blue,
              trailing: Icon(Icons.calculate_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
