import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/feature/course/bloc/course_state.dart';
import 'package:flutter_boilerplate/feature/course/bloc/courses_bloc.dart';
import 'package:flutter_boilerplate/feature/course/ui/widget/course_widget.dart';
// import 'package:flutter_boilerplate/feature/home/bloc/index.dart';
// import 'package:flutter_boilerplate/feature/home/ui/widget/book_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  CoursesBloc _booksBloc;

  @override
  void initState() {
    super.initState();
    _booksBloc = BlocProvider.of<CoursesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc, CourseState>(
      builder: (context, state) {
        if (state is CourseEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CourseError) {
          return const Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is CourseLoaded) {
          if (state.courses.isEmpty) {
            return const Center(
              child: Text('no books'),
            );
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.courses.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: InkResponse(
                    enableFeedback: true,
                    child: CourseWidget(course: state.courses[index]),
                  ),
                );
              });
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
