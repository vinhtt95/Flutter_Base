import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/common/http/response.dart';
import 'package:flutter_boilerplate/feature/course/bloc/index.dart';
import 'package:flutter_boilerplate/feature/course/model/course.dart';
import 'package:flutter_boilerplate/feature/course/resource/repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:developer';
// import 'course_event.dart';
// import 'course_state.dart';

class CoursesBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CoursesBloc({@required this.courseRepository})
      : assert(courseRepository != null);

  @override
  CourseState get initialState => CourseEmpty();

  @override
  Stream<CourseState> transformEvents(
    Stream<CourseEvent> events,
    Stream<CourseState> Function(CourseEvent event) next,
  ) {
    log('data: $courseRepository');
    return super.transformEvents(
      events.debounceTime(
        const Duration(milliseconds: 3000),
      ),
      next,
    );
  }

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    final CourseState currentState = state;

    if (event is Fetch) {
      try {
        if (currentState is CourseEmpty) {
          final List<Course> courses = await _fetchCourses();
          yield CourseLoaded(courses: courses);
          return;
        }
        if (currentState is CourseLoaded) {
          final List<Course> posts = await _fetchCourses();
          yield posts.isEmpty
              ? currentState.copyWith()
              : CourseLoaded(courses: currentState.courses + posts);
        }
      } catch (_) {
        yield CourseError();
      }
    }
  }

  Future<List<Course>> _fetchCourses() async {
    final response = await courseRepository.fetchCourses();
    if (response.status == Status.ConnectivityError) {
      //Internet problem
    }
    if (response.status == Status.Success) {
      return response.data;
    }

    return [];
  }
}
