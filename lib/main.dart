import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/courses_screen.dart';
import 'screens/attendance_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/courses': (context) => CoursesPage(
              courses: [],
            ),
        '/attendance': (context) => AttendancePage(
              registeredCourses: [],
              courses: [],
            ),
      },
    );
  }
}
