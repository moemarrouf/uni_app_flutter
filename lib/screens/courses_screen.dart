import 'package:flutter/material.dart';
import 'course.dart';

class CoursesPage extends StatefulWidget {
  final List<Course> courses;

  const CoursesPage({super.key, required this.courses});

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses Registration'),
      ),
      body: ListView.builder(
        itemCount: widget.courses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text(widget.courses[index].courseName),
              trailing: ElevatedButton(
                onPressed: widget.courses[index].status == 'registered'
                    ? () {
                        setState(() {
                          widget.courses[index].status = 'not-registered';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Unregistered from ${widget.courses[index].courseName}'),
                          ),
                        );
                      }
                    : () {
                        setState(() {
                          widget.courses[index].status = 'registered';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Registered for ${widget.courses[index].courseName}'),
                          ),
                        );
                      },
                child: Text(
                  widget.courses[index].status == 'registered'
                      ? 'Unregister'
                      : 'Register',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
