import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/course/model/course.dart';
// import 'package:flutter_boilerplate/feature/home/model/book.dart';

class CourseWidget extends StatelessWidget {
  final Course course;

  const CourseWidget({Key key, @required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${course.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(course.title),
      isThreeLine: true,
      subtitle: Text(course.sub),
      dense: true,
    );
  }
}
