import 'package:flutter/material.dart';
import 'course.dart';

class AttendancePage extends StatefulWidget {
  final List<Course> courses;

  const AttendancePage(
      {super.key, required this.courses, required List registeredCourses});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // Track the attendance state of each course (if attendance is marked)
  late Map<String, bool> attendanceStatus;

  @override
  void initState() {
    super.initState();
    // Initialize the attendanceStatus map based on registered courses
    attendanceStatus = {
      for (var course in widget.courses)
        if (course.status == 'registered') course.courseId: false,
    };
  }

  // Function to mark attendance
  void markAttendance(String courseId) {
    setState(() {
      attendanceStatus[courseId] =
          true; // Disable the button after attendance is marked
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter the registered courses
    List<Course> registeredCourses = widget.courses
        .where((course) => course.status == 'registered')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Class Attendance'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: registeredCourses.isEmpty
            ? Center(
                child: Text(
                  'Please register a course to mark its attendance',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: registeredCourses.length,
                itemBuilder: (context, index) {
                  Course course = registeredCourses[index];
                  bool isAttendanceMarked =
                      attendanceStatus[course.courseId] ?? false;

                  return ListTile(
                    title: Text(course.courseName),
                    trailing: ElevatedButton(
                      onPressed: isAttendanceMarked
                          ? null // Disable button if attendance is already marked
                          : () {
                              markAttendance(course.courseId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Attendance marked for ${course.courseName}')),
                              );
                            },
                      child: Text(isAttendanceMarked
                          ? 'Attendance Marked'
                          : 'Mark Attendance'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
