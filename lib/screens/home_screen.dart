import 'package:flutter/material.dart';
import 'course.dart'; // Import the Course model
import 'courses_screen.dart';
import 'attendance_screen.dart';

class HomePage extends StatelessWidget {
  // Unified list of courses
  final List<Course> courses = [
    Course(
        courseId: 'ICS',
        courseName: 'Intro to Computer Science',
        status: 'registered'),
    Course(
        courseId: 'MOB',
        courseName: 'Mobile App development',
        status: 'registered'),
    Course(
        courseId: 'HCI',
        courseName: 'Human Computer Interaction',
        status: 'not-registered'),
    Course(
        courseId: 'AM',
        courseName: 'Advanced Multimedia',
        status: 'not-registered'),
    Course(
        courseId: 'PM',
        courseName: 'Project Managment',
        status: 'not-registered'),
    Course(
        courseId: 'GD',
        courseName: 'Game Development',
        status: 'not-registered'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Mohamed'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Welcome to Universty system', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoursesPage(courses: courses),
                  ),
                );
              },
              child: Text('Courses Registered'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttendancePage(
                      courses: courses,
                      registeredCourses: [],
                    ),
                  ),
                );
              },
              child: Text('Attendance'),
            ),
          ],
        ),
      ),
    );
  }
}
